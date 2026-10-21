import AppKit
import ScreenCaptureKit
import ImageIO
import QuartzCore
import Darwin

private enum ProbeError: Error, CustomStringConvertible {
    case usage(String)
    case missingDisplay
    case badImage
    case missingBackdrop(String)

    var description: String {
        switch self {
        case .usage(let message): return message
        case .missingDisplay: return "No screen/display was available"
        case .badImage: return "Could not create or encode the requested image"
        case .missingBackdrop(let name): return "Expected native sidebar/inspector CABackdropLayer not found: \(name)"
        }
    }
}

private struct Configuration {
    let appearance: NSAppearance.Name
    let desktop: String
    let tint: String
    let aware: String
    let output: URL

    static func parse(_ args: [String]) throws -> Configuration {
        var values: [String: String] = [:]
        for arg in args {
            guard arg.hasPrefix("--"), let split = arg.dropFirst(2).firstIndex(of: "=") else {
                throw ProbeError.usage("Expected --appearance=light|dark --desktop=black|white|red|blue --tint=on|off --aware=native|off --output=PATH")
            }
            let key = String(arg[arg.index(arg.startIndex, offsetBy: 2)..<split])
            let value = String(arg[arg.index(after: split)...])
            guard values[key] == nil else { throw ProbeError.usage("Duplicate option --\(key)") }
            values[key] = value
        }
        guard let appearanceArg = values["appearance"], let desktop = values["desktop"],
              let tint = values["tint"], let aware = values["aware"], let outputArg = values["output"],
              values.count == 5 else {
            throw ProbeError.usage("Required: --appearance=light|dark --desktop=black|white|red|blue --tint=on|off --aware=native|off --output=PATH")
        }
        let appearance: NSAppearance.Name
        switch appearanceArg {
        case "light": appearance = .aqua
        case "dark": appearance = .darkAqua
        default: throw ProbeError.usage("Invalid appearance: \(appearanceArg)")
        }
        guard ["black", "white", "red", "blue"].contains(desktop) else { throw ProbeError.usage("Invalid desktop: \(desktop)") }
        guard ["on", "off"].contains(tint) else { throw ProbeError.usage("Invalid tint: \(tint)") }
        guard ["native", "off"].contains(aware) else { throw ProbeError.usage("Invalid aware mode: \(aware)") }
        return Configuration(appearance: appearance, desktop: desktop, tint: tint, aware: aware,
                             output: URL(fileURLWithPath: outputArg, isDirectory: true))
    }
}

private final class EmptyViewController: NSViewController {
    override func loadView() {
        let view = NSView()
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.clear.cgColor
        self.view = view
    }
}

@MainActor
private final class Probe: NSObject, NSApplicationDelegate {
    private let config: Configuration
    private var window: NSWindow?
    private var splitController: NSSplitViewController?
    private var sidebarItem: NSSplitViewItem?
    private var inspectorItem: NSSplitViewItem?
    private var errors: [String] = []
    private var incomplete: [String] = []
    private var tintValue: Bool { config.tint == "off" }

    init(config: Configuration) { self.config = config }

    func applicationDidFinishLaunching(_ notification: Notification) {
        Task { await run() }
    }

    private func run() async {
        do {
            try FileManager.default.createDirectory(at: config.output, withIntermediateDirectories: true)
            // Supplied macOS 26B5101f trace: +[NSApplication isReduceDesktopTintingEnabled]
            // at 0x18a76bdc4 tailcalls standardUserDefaults.boolForKey for
            // CFString 0x1e2892ee8 ("AppleReduceDesktopTinting"). This records that trace;
            // native interpretation remains with the MacUIKit owner.
            // UserDefaults.argumentDomain is volatile and takes precedence over persistent user defaults.
            UserDefaults.standard.setVolatileDomain(["AppleReduceDesktopTinting": tintValue], forName: UserDefaults.argumentDomain)
            let observedTintValue = UserDefaults.standard.bool(forKey: "AppleReduceDesktopTinting")
            if observedTintValue != tintValue { incomplete.append("Process-scoped AppleReduceDesktopTinting value did not match the requested value") }
            NSApp.appearance = NSAppearance(named: config.appearance)
            guard let screen = NSScreen.main else { throw ProbeError.missingDisplay }
            let desktopURL = config.output.appendingPathComponent("desktop-\(config.desktop).png")
            try writeSolidDesktop(to: desktopURL, color: desktopColor(config.desktop))
            do {
                try NSWorkspace.shared.setDesktopImageURL(desktopURL, for: screen, options: [:])
            } catch { errors.append("setDesktopImageURL: \(error)") }
            try await settle(seconds: 1.5)
            if !errors.isEmpty { throw ProbeError.usage(errors.joined(separator: "; ")) }

            let desktopCapture = try await captureDisplay(screen: screen)
            try savePNG(desktopCapture, to: config.output.appendingPathComponent("desktop-before-window.png"))
            buildWindow(screen: screen)
            NSApp.activate(ignoringOtherApps: true)
            window?.makeKeyAndOrderFront(nil)
            try await settle(seconds: 1.0)

            let layerReport = inspectAndApplyBackdropMode()
            for side in ["sidebar", "inspector"] {
                let records = layerReport[side] as? [[String: Any]] ?? []
                if !records.contains(where: { $0["eligibleSidebarInspectorSize"] as? Bool == true }) {
                    incomplete.append("Expected native \(side) backdrop not found at the requested size")
                } else if config.aware == "off" && !records.contains(where: {
                    $0["eligibleSidebarInspectorSize"] as? Bool == true && $0["setFalseConfirmed"] as? Bool == true
                }) {
                    incomplete.append("Eligible native \(side) backdrop did not confirm windowServerAware=false")
                }
            }
            try await settle(seconds: 0.75)
            let full = try await captureDisplay(screen: screen)
            try savePNG(full, to: config.output.appendingPathComponent("full-display.png"))
            let cropInfo = try saveWindowCrop(full, screen: screen)
            let windowScan = overlappingWindows(windowFrame: window?.frame ?? .zero, screen: screen)
            let windows = windowScan.windows
            let blocked = windows.filter { ($0["aboveProbe"] as? Bool) == true && (($0["alpha"] as? NSNumber)?.doubleValue ?? 1) > 0 }
            if !windowScan.complete { incomplete.append("On-screen window enumeration was incomplete; obstruction cannot be ruled out") }
            if !blocked.isEmpty { incomplete.append("One or more other on-screen windows overlap the probe window; inspect metadata.json") }
            let metadata: [String: Any] = [
                "status": incomplete.isEmpty ? "captured" : "incomplete",
                "errors": errors, "incompleteReasons": incomplete,
                "appearance": config.appearance == .darkAqua ? "dark" : "light",
                "desktopStimulus": config.desktop, "desktopImage": desktopURL.lastPathComponent,
                "tint": ["requested": config.tint, "AppleReduceDesktopTinting": observedTintValue],
                "awareMode": config.aware, "backdrops": layerReport,
                "screen": screenFacts(screen), "window": windowFacts(window),
                "crop": cropInfo, "overlappingVisibleWindows": windows,
                "visibleWindowEnumerationComplete": windowScan.complete,
                "obstructionAssessment": !windowScan.complete ? "unknown: on-screen window enumeration incomplete" : (blocked.isEmpty ? "no reported visible window above probe intersects probe window" : "obstructed: reported window(s) above probe intersect probe window"),
                "capture": ["method": "ScreenCaptureKit SCScreenshotManager display composite", "offscreenViewSnapshot": false]
            ]
            try writeJSON(metadata, to: config.output.appendingPathComponent("metadata.json"))
            print("status=\(incomplete.isEmpty ? "captured" : "incomplete") output=\(config.output.path)")
            exit(incomplete.isEmpty ? EXIT_SUCCESS : EXIT_FAILURE)
        } catch {
            errors.append(String(describing: error))
            let failure: [String: Any] = ["status": "failed", "errors": errors, "incompleteReasons": incomplete,
                                          "appearance": config.appearance == .darkAqua ? "dark" : "light",
                                          "desktopStimulus": config.desktop, "tint": config.tint, "awareMode": config.aware]
            try? FileManager.default.createDirectory(at: config.output, withIntermediateDirectories: true)
            try? writeJSON(failure, to: config.output.appendingPathComponent("metadata.json"))
            fputs("failure: \(error)\n", stderr)
            exit(EXIT_FAILURE)
        }
    }

    private func buildWindow(screen: NSScreen) {
        let sidebar = EmptyViewController()
        let body = EmptyViewController()
        let inspector = EmptyViewController()
        for controller in [sidebar, body, inspector] {
            controller.view.wantsLayer = true
            controller.view.layer?.backgroundColor = NSColor.clear.cgColor
        }
        let split = NSSplitViewController()
        split.splitView.dividerStyle = .thin
        let sideItem = NSSplitViewItem(sidebarWithViewController: sidebar)
        let bodyItem = NSSplitViewItem(viewController: body)
        let inspectItem = NSSplitViewItem(inspectorWithViewController: inspector)
        sideItem.minimumThickness = 180; sideItem.maximumThickness = 180
        bodyItem.minimumThickness = 300; bodyItem.maximumThickness = 300
        inspectItem.minimumThickness = 180; inspectItem.maximumThickness = 180
        sideItem.canCollapse = false; inspectItem.canCollapse = false
        split.addSplitViewItem(sideItem); split.addSplitViewItem(bodyItem); split.addSplitViewItem(inspectItem)
        split.view.wantsLayer = true
        split.view.layer?.backgroundColor = NSColor(srgbRed: 0.75, green: 0.75, blue: 0.75, alpha: 1).cgColor
        let style: NSWindow.StyleMask = [.titled, .closable, .resizable, .fullSizeContentView]
        let frame = NSRect(x: screen.visibleFrame.midX - 331, y: screen.visibleFrame.midY - 200,
                           width: 662, height: 400)
        let window = NSWindow(contentRect: frame, styleMask: style, backing: .buffered, defer: false, screen: screen)
        window.titleVisibility = .hidden
        window.titlebarAppearsTransparent = true
        window.isReleasedWhenClosed = false
        window.appearance = NSAppearance(named: config.appearance)
        window.backgroundColor = NSColor(srgbRed: 0.75, green: 0.75, blue: 0.75, alpha: 1)
        window.isOpaque = true
        window.contentViewController = split
        self.window = window; splitController = split; sidebarItem = sideItem; inspectorItem = inspectItem
    }

    private func inspectAndApplyBackdropMode() -> [String: Any] {
        guard let window else { return [:] }
        var result: [String: Any] = ["nativeViewCounts": ["NSGlassEffectView": 0, "CAChameleonLayer": 0]]
        let root = window.contentView
        let glassCount = countViews(root, className: "NSGlassEffectView")
        result["nativeViewCounts"] = ["NSGlassEffectView": glassCount,
                                      "CAChameleonLayer": countLayers(root?.layer, className: "CAChameleonLayer")]
        for (name, item) in [("sidebar", sidebarItem), ("inspector", inspectorItem)] {
            guard let item else { continue }
            var records: [[String: Any]] = []
            for layer in backdropLayers(in: item.viewController.view) {
                let frame = layer.frame
                var before = backdropProperties(layer)
                before["frame"] = rectJSON(frame); before["bounds"] = rectJSON(layer.bounds)
                let expected = abs(frame.width - 180) <= 20 && abs(frame.height - 400) <= 40 && frame.width > 0 && frame.height > 0
                let hasSetter = layer.responds(to: NSSelectorFromString("setWindowServerAware:"))
                let attempted = config.aware == "off" && expected && hasSetter
                if attempted {
                    invokeBoolSetter(layer, selector: NSSelectorFromString("setWindowServerAware:"), value: false)
                }
                var after = backdropProperties(layer)
                after["frame"] = rectJSON(layer.frame); after["bounds"] = rectJSON(layer.bounds)
                let confirmedFalse = attempted && (after["windowServerAware"] as? NSNumber)?.boolValue == false
                records.append(["class": NSStringFromClass(type(of: layer)), "before": before, "after": after,
                                "eligibleSidebarInspectorSize": expected,
                                "windowServerAwareSetterPresent": hasSetter, "setFalseAttempted": attempted,
                                "setFalseConfirmed": confirmedFalse])
            }
            result[name] = records
        }
        return result
    }

    private func backdropProperties(_ layer: CALayer) -> [String: Any] {
        var properties: [String: Any] = [:]
        for key in ["scale", "marginWidth", "windowServerAware", "allowsSubstituteColor"] {
            let getter = NSSelectorFromString(key)
            if layer.responds(to: getter), let value = layer.value(forKey: key) { properties[key] = jsonSafe(value) }
            else { properties[key] = NSNull() }
        }
        return properties
    }

    private func invokeBoolSetter(_ object: NSObject, selector: Selector, value: Bool) {
        typealias Setter = @convention(c) (AnyObject, Selector, Bool) -> Void
        let implementation = object.method(for: selector)
        unsafeBitCast(implementation, to: Setter.self)(object, selector, value)
    }

    private func backdropLayers(in layer: CALayer?) -> [CALayer] {
        guard let layer else { return [] }
        let own = NSStringFromClass(type(of: layer)).contains("CABackdropLayer") ? [layer] : []
        return own + (layer.sublayers ?? []).flatMap { backdropLayers(in: $0) }
    }

    private func backdropLayers(in view: NSView) -> [CALayer] {
        var found = backdropLayers(in: view.layer)
        for child in view.subviews { found.append(contentsOf: backdropLayers(in: child)) }
        var seen = Set<ObjectIdentifier>()
        return found.filter { seen.insert(ObjectIdentifier($0)).inserted }
    }

    private func countLayers(_ layer: CALayer?, className: String) -> Int {
        guard let layer else { return 0 }
        return (NSStringFromClass(type(of: layer)).contains(className) ? 1 : 0) + (layer.sublayers ?? []).reduce(0) { $0 + countLayers($1, className: className) }
    }

    private func countViews(_ view: NSView?, className: String) -> Int {
        guard let view else { return 0 }
        return (NSStringFromClass(type(of: view)).contains(className) ? 1 : 0) + view.subviews.reduce(0) { $0 + countViews($1, className: className) }
    }

    private func captureDisplay(screen: NSScreen) async throws -> CGImage {
        let content = try await SCShareableContent.excludingDesktopWindows(false, onScreenWindowsOnly: true)
        guard let display = content.displays.first(where: { $0.displayID == screen.deviceDescription[ NSDeviceDescriptionKey("NSScreenNumber") ] as? CGDirectDisplayID }) ?? content.displays.first else {
            throw ProbeError.missingDisplay
        }
        let filter = SCContentFilter(display: display, excludingWindows: [])
        let configuration = SCStreamConfiguration()
        configuration.width = display.width; configuration.height = display.height
        configuration.showsCursor = false
        return try await SCScreenshotManager.captureImage(contentFilter: filter, configuration: configuration)
    }

    private func saveWindowCrop(_ image: CGImage, screen: NSScreen) throws -> [String: Any] {
        guard let window else { throw ProbeError.missingDisplay }
        let margin: CGFloat = 64
        let requested = window.frame.insetBy(dx: -margin, dy: -margin)
        let clipped = requested.intersection(screen.frame)
        let scale = CGFloat(image.width) / screen.frame.width
        let pixelRect = CGRect(x: (clipped.minX - screen.frame.minX) * scale,
                               y: (screen.frame.maxY - clipped.maxY) * scale,
                               width: clipped.width * scale, height: clipped.height * scale).integral
        guard let cropped = image.cropping(to: pixelRect), cropped.width > 0, cropped.height > 0 else { throw ProbeError.badImage }
        try savePNG(cropped, to: config.output.appendingPathComponent("window-and-margin.png"))
        return ["requestedRectPoints": rectJSON(requested), "capturedRectPoints": rectJSON(clipped),
                "marginPoints": margin, "pixelRect": rectJSON(pixelRect), "pixelScale": scale]
    }

    private func screenFacts(_ screen: NSScreen) -> [String: Any] {
        ["framePoints": rectJSON(screen.frame), "visibleFramePoints": rectJSON(screen.visibleFrame),
         "backingScaleFactor": screen.backingScaleFactor,
         "displayID": screen.deviceDescription[NSDeviceDescriptionKey("NSScreenNumber")].map { String(describing: $0) } ?? "unknown",
         "devicePixelSize": screen.deviceDescription[NSDeviceDescriptionKey("NSDeviceSize")].map { String(describing: $0) } ?? "unknown"]
    }

    private func windowFacts(_ window: NSWindow?) -> [String: Any] {
        guard let window else { return [:] }
        return ["framePoints": rectJSON(window.frame), "contentLayoutRectPoints": rectJSON(window.contentLayoutRect),
                "backingScaleFactor": window.backingScaleFactor, "styleMask": window.styleMask.rawValue,
                "isVisible": window.isVisible, "appearance": window.effectiveAppearance.name.rawValue]
    }

    private func overlappingWindows(windowFrame: CGRect, screen: NSScreen) -> (windows: [[String: Any]], complete: Bool) {
        guard let infos = CGWindowListCopyWindowInfo(.optionOnScreenOnly, kCGNullWindowID) as? [[String: Any]] else { return ([], false) }
        let probeNumber = window?.windowNumber
        var complete = true
        var reachedProbe = false
        let windows = infos.compactMap { info -> [String: Any]? in
            let number = info[kCGWindowNumber as String] as? Int
            let aboveProbe = !reachedProbe && number != probeNumber
            if number == probeNumber { reachedProbe = true }
            guard let bounds = info[kCGWindowBounds as String] as? [String: Any],
                  let rawX = bounds["X"] as? NSNumber, let rawY = bounds["Y"] as? NSNumber,
                  let rawWidth = bounds["Width"] as? NSNumber, let rawHeight = bounds["Height"] as? NSNumber else {
                complete = false
                return nil
            }
            let rawRect = CGRect(x: rawX.doubleValue, y: rawY.doubleValue,
                                 width: rawWidth.doubleValue, height: rawHeight.doubleValue)
            // CGWindow bounds use a top-left screen origin; store/compare AppKit points below.
            let rect = CGRect(x: rawRect.minX, y: screen.frame.maxY - rawRect.maxY,
                              width: rawRect.width, height: rawRect.height)
            guard rect.intersects(windowFrame) else { return nil }
            return ["windowNumber": number ?? -1, "ownerPID": info[kCGWindowOwnerPID as String] ?? NSNull(),
                    "ownerName": info[kCGWindowOwnerName as String] ?? "", "name": info[kCGWindowName as String] ?? "",
                    "rectAppKitPoints": rectJSON(rect), "rawCGWindowBounds": rectJSON(rawRect),
                    "alpha": info[kCGWindowAlpha as String] ?? NSNull(),
                    "layer": info[kCGWindowLayer as String] ?? NSNull(), "isProbeWindow": number == probeNumber,
                    "intersectsProbeWindow": true, "aboveProbe": aboveProbe]
        }
        return (windows, complete && reachedProbe)
    }

    private func settle(seconds: Double) async throws { try await Task.sleep(for: .seconds(seconds)) }
}

private func desktopColor(_ name: String) -> NSColor {
    switch name {
    case "black": return NSColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
    case "white": return NSColor(srgbRed: 1, green: 1, blue: 1, alpha: 1)
    case "red": return NSColor(srgbRed: 1, green: 0, blue: 0, alpha: 1)
    default: return NSColor(srgbRed: 0, green: 0, blue: 1, alpha: 1)
    }
}

private func writeSolidDesktop(to url: URL, color: NSColor) throws {
    guard let colorSpace = CGColorSpace(name: CGColorSpace.sRGB),
          let context = CGContext(data: nil, width: 128, height: 128, bitsPerComponent: 8,
                                  bytesPerRow: 0, space: colorSpace,
                                  bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) else { throw ProbeError.badImage }
    context.setFillColor(color.cgColor)
    context.fill(CGRect(x: 0, y: 0, width: 128, height: 128))
    guard let image = context.makeImage() else { throw ProbeError.badImage }
    try savePNG(image, to: url)
}

private func savePNG(_ image: CGImage, to url: URL) throws {
    guard let destination = CGImageDestinationCreateWithURL(url as CFURL, "public.png" as CFString, 1, nil) else { throw ProbeError.badImage }
    CGImageDestinationAddImage(destination, image, nil)
    guard CGImageDestinationFinalize(destination) else { throw ProbeError.badImage }
}

private func writeJSON(_ object: [String: Any], to url: URL) throws {
    let data = try JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted, .sortedKeys])
    try data.write(to: url, options: .atomic)
}

private func rectJSON(_ rect: CGRect) -> [String: CGFloat] {
    ["x": rect.origin.x, "y": rect.origin.y, "width": rect.width, "height": rect.height]
}

private func jsonSafe(_ value: Any) -> Any {
    if let number = value as? NSNumber { return number }
    if let text = value as? String { return text }
    return String(describing: value)
}

@main
private struct WallpaperEdgesMain {
    @MainActor
    static func main() {
        do {
            let config = try Configuration.parse(Array(CommandLine.arguments.dropFirst()))
            let app = NSApplication.shared
            app.setActivationPolicy(.regular)
            let delegate = Probe(config: config)
            app.delegate = delegate
            app.run()
        } catch {
            fputs("usage/failure: \(error)\n", stderr)
            exit(EXIT_FAILURE)
        }
    }
}
