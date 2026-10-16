import AppKit
import CoreGraphics
import CoreImage
import ImageIO
import QuartzCore
import ScreenCaptureKit
import SwiftUI
import SafeKVC

struct Options {
    var scenario = "nsswitch"
    var appearance = "light"
    var background = "plain"
    var size = "regular"
    var state = "on"
    var interaction = "hold"
    var accent = "default"
    var out = "out"

    init() {
        let a = CommandLine.arguments
        var i = 1
        while i + 1 < a.count {
            let value = a[i + 1]
            switch a[i] {
            case "--scenario": scenario = value
            case "--appearance": appearance = value
            case "--background": background = value
            case "--size": size = value
            case "--state": state = value
            case "--interaction": interaction = value
            case "--accent": accent = value
            case "--out": out = value
            default: break
            }
            i += 2
        }
    }
}

func record(_ message: String) {
    let line = "\(ISO8601DateFormatter().string(from: Date())) \(message)\n"
    FileHandle.standardError.write(Data(line.utf8))
    if let i = CommandLine.arguments.firstIndex(of: "--out"), i + 1 < CommandLine.arguments.count {
        let log = URL(fileURLWithPath: CommandLine.arguments[i + 1]).appendingPathComponent("log.txt")
        if let handle = try? FileHandle(forWritingTo: log) {
            handle.seekToEndOfFile()
            handle.write(Data(line.utf8))
            try? handle.close()
        }
    }
}

func pointJSON(_ p: CGPoint) -> [String: CGFloat] { ["x": p.x, "y": p.y] }
func rectJSON(_ r: CGRect) -> [String: CGFloat] {
    ["x": r.minX, "y": r.minY, "width": r.width, "height": r.height]
}

final class BackgroundView: NSView {
    let kind: String
    init(frame: CGRect, kind: String) { self.kind = kind; super.init(frame: frame) }
    required init?(coder: NSCoder) { fatalError("init(coder:) is unavailable") }
    override func draw(_ dirtyRect: NSRect) {
        let r = bounds
        switch kind {
        case "black": NSColor.black.setFill(); r.fill()
        case "white": NSColor.white.setFill(); r.fill()
        case "hstripes":
            NSColor.white.setFill(); r.fill()
            NSColor.black.setFill()
            for y in stride(from: CGFloat(0), to: r.height, by: 2) {
                CGRect(x: 0, y: y, width: r.width, height: 1).fill()
            }
        case "grid":
            NSColor.white.setFill(); r.fill()
            NSColor.darkGray.setFill()
            for x in stride(from: CGFloat(0), to: r.width, by: 4) {
                CGRect(x: x, y: 0, width: 1, height: r.height).fill()
            }
            for y in stride(from: CGFloat(0), to: r.height, by: 4) {
                CGRect(x: 0, y: y, width: r.width, height: 1).fill()
            }
            NSColor.red.setFill()
            CGRect(x: 0, y: r.midY, width: r.width, height: 1).fill()
        case "rainbow":
            for x in stride(from: CGFloat(0), to: r.width, by: 1) {
                NSColor(calibratedHue: x / r.width, saturation: 1, brightness: 1, alpha: 1).setFill()
                CGRect(x: x, y: 0, width: 1, height: r.height).fill()
            }
        default: NSColor.windowBackgroundColor.setFill(); r.fill()
        }
    }
}

final class CaptureWindow: NSWindow {
    override var canBecomeKey: Bool { true }
    override var canBecomeMain: Bool { true }
}

struct SwitchView: View {
    @State var isOn: Bool
    var body: some View { Toggle("", isOn: $isOn).toggleStyle(.switch).labelsHidden() }
}

@available(macOS 26.0, *)
struct GlassView: View {
    let shape: String
    let style: String
    var body: some View {
        let base = RoundedRectangle(cornerRadius: shape == "capsule" ? 22 : 18)
            .fill(.clear)
            .frame(width: shape == "capsule" ? 120 : 200,
                   height: shape == "capsule" ? 44 : 120)
        if style == "clear" { base.glassEffect(.clear) }
        else if style == "interactive" { base.glassEffect(.regular.interactive()) }
        else { base.glassEffect(.regular) }
    }
}

func safeDescription(_ value: Any?) -> Any? {
    guard let value else { return nil }
    if value is NSNull { return NSNull() }
    if let s = value as? String { return s }
    if let n = value as? NSNumber { return n }
    if let p = value as? NSValue { return p.description }
    if let a = value as? [Any] { return a.map { safeDescription($0) ?? NSNull() } }
    return String(describing: value)
}

func layerJSON(_ layer: CALayer, depth: Int = 0) -> [String: Any] {
    if depth > 100 { return ["error": "layer depth limit"] }
    var d: [String: Any] = [
        "class": NSStringFromClass(type(of: layer)),
        "name": layer.name as Any? ?? NSNull(),
        "frame": rectJSON(layer.frame), "bounds": rectJSON(layer.bounds),
        "position": pointJSON(layer.position), "anchorPoint": pointJSON(layer.anchorPoint),
        "opacity": layer.opacity, "isHidden": layer.isHidden,
        "masksToBounds": layer.masksToBounds, "cornerRadius": layer.cornerRadius,
        "cornerCurve": layer.cornerCurve.rawValue,
        "sublayers": (layer.sublayers ?? []).map { layerJSON($0, depth: depth + 1) }
    ]
    if !CATransform3DIsIdentity(layer.transform) {
        let t = layer.transform
        d["transform"] = [t.m11,t.m12,t.m13,t.m14,t.m21,t.m22,t.m23,t.m24,
                          t.m31,t.m32,t.m33,t.m34,t.m41,t.m42,t.m43,t.m44]
    }
    for key in ["compositingFilter", "filters", "backgroundFilters"] {
        if let value = SafeValueForKey(layer, key) { d[key] = filterJSON(value) }
    }
    let cls = NSStringFromClass(type(of: layer))
    if ["Backdrop", "Portal", "SDF"].contains(where: cls.contains) {
        for key in ["scale", "groupName", "marginWidth", "captureOnly", "windowServerAware",
                    "sourceLayer", "hidesSourceLayer", "matchesPosition"] {
            if let value = SafeValueForKey(layer, key) {
                d[key] = safeDescription(value)
            }
        }
    }
    return d
}

func filterJSON(_ value: Any) -> Any {
    if let a = value as? [Any] { return a.map { filterJSON($0) } }
    let obj = value as AnyObject
    var d: [String: Any] = ["class": NSStringFromClass(type(of: obj)), "description": String(describing: value)]
    for key in ["name", "inputAmount", "inputRadius", "inputColorMatrix"] {
        if let v = SafeValueForKey(obj, key) { d[key] = safeDescription(v) }
    }
    if let keys = SafeValueForKey(obj, "inputKeys") as? [String] {
        for key in keys where d[key] == nil {
            if let v = SafeValueForKey(obj, key) { d[key] = safeDescription(v) }
        }
    }
    return d
}

func writeJSON(_ object: Any, to url: URL) throws {
    let data = try JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted, .sortedKeys, .fragmentsAllowed])
    try data.write(to: url, options: .atomic)
}

func writePNG(_ image: CGImage, to url: URL) -> Bool {
    guard let dest = CGImageDestinationCreateWithURL(url as CFURL, "public.png" as CFString, 1, nil) else { return false }
    CGImageDestinationAddImage(dest, image, nil)
    return CGImageDestinationFinalize(dest)
}

func writeDisplayEnvironment(to path: String) throws {
    let id = CGMainDisplayID()
    let options = [kCGDisplayShowDuplicateLowResolutionModes as String: true] as CFDictionary
    let modes = (CGDisplayCopyAllDisplayModes(id, options) as? [CGDisplayMode]) ?? []
    let before = CGDisplayCopyDisplayMode(id)
    var switchResult = "not needed"
    if (NSScreen.main?.backingScaleFactor ?? 1) < 2, let current = before {
        if let hidpi = modes.first(where: {
            $0.width == current.width && $0.height == current.height &&
            $0.pixelWidth >= 2 * $0.width && $0.pixelHeight >= 2 * $0.height
        }) {
            var configuration: CGDisplayConfigRef?
            let begin = CGBeginDisplayConfiguration(&configuration)
            if begin == .success, let configuration {
                let configure = CGConfigureDisplayWithDisplayMode(configuration, id, hidpi, nil)
                let complete = configure == .success ? CGCompleteDisplayConfiguration(configuration, .permanently) : configure
                if configure != .success { CGCancelDisplayConfiguration(configuration) }
                switchResult = "HiDPI mode \(hidpi.width)x\(hidpi.height) / \(hidpi.pixelWidth)x\(hidpi.pixelHeight): \(complete.rawValue)"
            } else { switchResult = "CGBeginDisplayConfiguration failed: \(begin.rawValue)" }
        } else { switchResult = "no matching 2x mode" }
    }
    let selected = CGDisplayCopyDisplayMode(id)
    let info: [String: Any] = [
        "display_id": id,
        "backing_scale": NSScreen.main?.backingScaleFactor ?? 1,
        "display_pixels": ["width": CGDisplayPixelsWide(id), "height": CGDisplayPixelsHigh(id)],
        "initial_mode": before.map { ["width": $0.width, "height": $0.height, "pixel_width": $0.pixelWidth, "pixel_height": $0.pixelHeight] } as Any? ?? NSNull(),
        "selected_mode": selected.map { ["width": $0.width, "height": $0.height, "pixel_width": $0.pixelWidth, "pixel_height": $0.pixelHeight] } as Any? ?? NSNull(),
        "switch_result": switchResult,
        "modes": modes.map { ["width": $0.width, "height": $0.height, "pixel_width": $0.pixelWidth, "pixel_height": $0.pixelHeight, "refresh_hz": $0.refreshRate] },
        "screen_capture_preflight": CGPreflightScreenCaptureAccess()
    ]
    try writeJSON(info, to: URL(fileURLWithPath: path))
}

final class CaptureSession {
    let options: Options
    let window: NSWindow
    let control: NSView
    let folder: URL
    let scale: CGFloat
    var results: [[String: Any]] = []
    var mouseDownTime: Date?
    var mouseUpTime: Date?
    var trackingDurationMS = 0
    var sckFailure: String?
    var sckUnavailable = false

    init(options: Options) throws {
        self.options = options
        let root = URL(fileURLWithPath: options.out, isDirectory: true)
        folder = root.appendingPathComponent(options.scenario)
            .appendingPathComponent("\(options.appearance)-\(options.accent)-\(options.size)-\(options.state)-\(options.interaction)")
            .appendingPathComponent(options.background)
        try FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
        let w = CaptureWindow(contentRect: CGRect(x: 100, y: 100, width: 480, height: 300),
                         styleMask: [.borderless], backing: .buffered, defer: false)
        w.isReleasedWhenClosed = false
        w.backgroundColor = .windowBackgroundColor
        w.hasShadow = false
        w.level = .normal
        let bg = BackgroundView(frame: CGRect(x: 0, y: 0, width: 480, height: 300), kind: options.background)
        w.contentView = bg
        let c: NSView
        let controlSize: NSControl.ControlSize = options.size == "mini" ? .mini : options.size == "small" ? .small : options.size == "large" ? .large : .regular
        switch options.scenario {
        case "nsswitch":
            let v = NSSwitch(frame: .zero)
            v.controlSize = controlSize
            v.state = options.state == "on" ? .on : .off
            v.sizeToFit()
            c = v
        case "swiftui-toggle":
            let v = NSHostingView(rootView: SwitchView(isOn: options.state == "on"))
            v.frame.size = CGSize(width: 96, height: 52)
            c = v
        case "nsslider":
            let v = NSSlider(value: options.state == "on" ? 0.7 : 0.3, minValue: 0, maxValue: 1, target: nil, action: nil)
            v.isContinuous = true
            v.controlSize = controlSize
            v.frame.size = CGSize(width: 200, height: 28)
            c = v
        case "nssegmented":
            let v = NSSegmentedControl(labels: ["One", "Two", "Three"], trackingMode: .selectOne, target: nil, action: nil)
            v.controlSize = controlSize
            v.selectedSegment = options.state == "on" ? 1 : 0
            v.sizeToFit()
            c = v
        case "nsbutton":
            let v = NSButton(title: "Button", target: nil, action: nil)
            v.bezelStyle = .rounded
            v.controlSize = controlSize
            v.sizeToFit()
            c = v
        case "nsglass":
            if #available(macOS 26.0, *) {
                let v = NSGlassEffectView(frame: CGRect(x: 0, y: 0, width: options.size == "large" ? 200 : 120, height: options.size == "large" ? 120 : 44))
                c = v
            } else { throw NSError(domain: "GlassCaptures", code: 1, userInfo: [NSLocalizedDescriptionKey: "NSGlassEffectView unavailable"]) }
        case "swiftui-glass-regular", "swiftui-glass-clear", "swiftui-glass-interactive":
            if #available(macOS 26.0, *) {
                let style = options.scenario.replacingOccurrences(of: "swiftui-glass-", with: "")
                let v = NSHostingView(rootView: GlassView(shape: options.size == "large" ? "rect" : "capsule", style: style))
                v.frame.size = CGSize(width: options.size == "large" ? 220 : 140,
                                      height: options.size == "large" ? 140 : 64)
                c = v
            } else { throw NSError(domain: "GlassCaptures", code: 2, userInfo: [NSLocalizedDescriptionKey: "SwiftUI glass unavailable"]) }
        default: throw NSError(domain: "GlassCaptures", code: 3, userInfo: [NSLocalizedDescriptionKey: "unknown scenario \(options.scenario)"])
        }
        c.frame.origin = CGPoint(x: (480 - c.frame.width) / 2, y: (300 - c.frame.height) / 2)
        bg.addSubview(c)
        control = c
        window = w
        scale = w.screen?.backingScaleFactor ?? NSScreen.main?.backingScaleFactor ?? 1
    }

    func screenshot(_ url: URL) -> (String, String?) {
        if sckUnavailable { return screenshotWithCLI(url) }
        let semaphore = DispatchSemaphore(value: 0)
        var image: CGImage?
        var errorText: String?
        let wid = CGWindowID(window.windowNumber)
        let targetScale = scale
        Task.detached {
            do {
                let content = try await SCShareableContent.current
                guard let scWindow = content.windows.first(where: { $0.windowID == wid }) else {
                    throw NSError(domain: "GlassCaptures", code: 4, userInfo: [NSLocalizedDescriptionKey: "window absent from ScreenCaptureKit list"])
                }
                let filter = SCContentFilter(desktopIndependentWindow: scWindow)
                let config = SCStreamConfiguration()
                config.width = Int(scWindow.frame.width * targetScale)
                config.height = Int(scWindow.frame.height * targetScale)
                config.showsCursor = false
                image = try await SCScreenshotManager.captureImage(contentFilter: filter, configuration: config)
            } catch { errorText = String(describing: error) }
            semaphore.signal()
        }
        if semaphore.wait(timeout: .now() + 8) == .success, let image, writePNG(image, to: url) {
            return ("ScreenCaptureKit", nil)
        }
        sckFailure = errorText ?? "ScreenCaptureKit timed out or failed to write PNG"
        sckUnavailable = true
        return screenshotWithCLI(url)
    }

    func screenshotWithCLI(_ url: URL) -> (String, String?) {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/sbin/screencapture")
        process.arguments = ["-x", "-o", "-l", "\(window.windowNumber)", url.path]
        do {
            try process.run()
            process.waitUntilExit()
            if process.terminationStatus == 0, FileManager.default.fileExists(atPath: url.path) {
                return ("screencapture", nil)
            }
            return ("none", "ScreenCaptureKit: \(sckFailure ?? "unknown"); screencapture exit \(process.terminationStatus)")
        } catch { return ("none", "ScreenCaptureKit: \(sckFailure ?? "unknown"); screencapture: \(error)") }
    }

    func capture(_ phase: String) {
        let url = folder.appendingPathComponent("\(phase).png")
        let (method, error) = screenshot(url)
        let frame = control.convert(control.bounds, to: window.contentView)
        let knob = knobFrame()
        var cropPath: String? = nil
        if method != "none", let source = CGImageSourceCreateWithURL(url as CFURL, nil),
           let image = CGImageSourceCreateImageAtIndex(source, 0, nil) {
            let actualScale = CGFloat(image.width) / window.frame.width
            let margin: CGFloat = 40
            let crop = CGRect(x: max(0, floor((frame.minX - margin) * actualScale)),
                              y: max(0, floor((window.frame.height - frame.maxY - margin) * actualScale)),
                              width: ceil((frame.width + 2 * margin) * actualScale),
                              height: ceil((frame.height + 2 * margin) * actualScale))
                .intersection(CGRect(x: 0, y: 0, width: image.width, height: image.height))
            if let sub = image.cropping(to: crop) {
                let cropURL = folder.appendingPathComponent("\(phase)-crop.png")
                if writePNG(sub, to: cropURL) { cropPath = cropURL.path }
            }
        }
        if phase == "idle" || phase == "held-0500ms" || phase == "drag-held-0500ms" {
            let layerURL = folder.appendingPathComponent("layers-\(phase).json")
            do {
                if let layer = window.contentView?.superview?.layer {
                    try writeJSON(layerJSON(layer), to: layerURL)
                } else { try writeJSON(["error": "frame view has no layer"], to: layerURL) }
            } catch { record("layer dump failed \(phase): \(error)") }
        }
        let t = mouseDownTime.map { Int(Date().timeIntervalSince($0) * 1000) }
        let entry: [String: Any] = [
            "scenario": options.scenario, "control": NSStringFromClass(type(of: control)),
            "size": options.size, "state": options.state, "appearance": options.appearance,
            "accent": options.accent, "background": options.background, "phase": phase,
            "t_ms_since_mouse_down": t as Any? ?? NSNull(), "control_frame_window_points": rectJSON(frame),
            "control_frame_window_pixels": rectJSON(frame.applying(CGAffineTransform(scaleX: scale, y: scale))),
            "knob_frame_window_points": knob.map { rectJSON($0) } as Any? ?? NSNull(),
            "knob_frame_window_pixels": knob.map { rectJSON($0.applying(CGAffineTransform(scaleX: scale, y: scale))) } as Any? ?? NSNull(),
            "backing_scale": scale, "capture_method": method, "success": method != "none",
            "window_is_key": window.isKeyWindow,
            "error": error as Any? ?? NSNull(), "image": method == "none" ? NSNull() : url.path as Any,
            "crop": cropPath as Any? ?? NSNull(), "sck_error": sckFailure as Any? ?? NSNull()
        ]
        results.append(entry)
        record("capture \(phase) method=\(method) t_ms=\(t.map(String.init) ?? "idle") error=\(error ?? "none")")
    }

    func saveManifest() throws {
        for i in results.indices { results[i]["tracking_duration_ms"] = trackingDurationMS }
        try writeJSON(results, to: folder.appendingPathComponent("manifest-part.json"))
    }

    func knobFrame() -> CGRect? {
        guard options.scenario == "nsswitch" else { return nil }
        var candidates: [CGRect] = []
        func visit(_ view: NSView) {
            for child in view.subviews {
                let r = child.convert(child.bounds, to: window.contentView)
                if r.width > 8 && r.width < control.bounds.width - 5 && r.height > 8 {
                    candidates.append(r)
                }
                visit(child)
            }
        }
        visit(control)
        return options.state == "on" ? candidates.max(by: { $0.midX < $1.midX })
                                     : candidates.min(by: { $0.midX < $1.midX })
    }

    func send(_ type: NSEvent.EventType, at p: CGPoint) {
        guard let e = NSEvent.mouseEvent(with: type, location: p, modifierFlags: [],
                                        timestamp: ProcessInfo.processInfo.systemUptime,
                                        windowNumber: window.windowNumber, context: nil,
                                        eventNumber: 0, clickCount: 1, pressure: type == .leftMouseUp ? 0 : 1) else {
            record("failed to make event \(type.rawValue)"); return
        }
        record("inject \(type.rawValue) at \(p.x),\(p.y)")
        if type == .leftMouseUp { mouseUpTime = Date() }
        if type == .leftMouseDown { window.sendEvent(e) }
        else { NSApp.postEvent(e, atStart: false) }
    }

    func run() throws {
        window.makeKeyAndOrderFront(nil)
        window.orderFrontRegardless()
        NSApp.activate(ignoringOtherApps: true)
        _ = NSRunningApplication.current.activate(options: [.activateAllWindows])
        window.makeKey()
        RunLoop.main.run(until: Date().addingTimeInterval(1.2))
        record("window key=\(window.isKeyWindow) main=\(window.isMainWindow) appActive=\(NSApp.isActive)")
        record("frontmost=\(NSWorkspace.shared.frontmostApplication?.localizedName ?? "nil") current=\(NSRunningApplication.current.localizedName ?? "nil") visible=\(window.isVisible)")
        capture("idle")
        if options.interaction == "idle" { try saveManifest(); return }
        let f = control.convert(control.bounds, to: window.contentView)
        let start = knobFrame().map { CGPoint(x: $0.midX, y: $0.midY) }
            ?? CGPoint(x: f.midX, y: f.midY)
        let direction: CGFloat = options.state == "on" ? -1 : 1
        let dragPoint = CGPoint(x: start.x + 8 * direction, y: start.y)
        let isDrag = options.interaction == "drag"
        mouseDownTime = Date()
        let held: [(TimeInterval, String)] = isDrag
            ? [(0.1,"held-0100ms"),(0.25,"held-0250ms"),(0.5,"drag-held-0500ms"),(1.0,"held-1000ms")]
            : [(0.1,"held-0100ms"),(0.25,"held-0250ms"),(0.5,"held-0500ms"),(1.0,"held-1000ms")]
        var timers: [Timer] = []
        if isDrag {
            let timer = Timer(timeInterval: 0.05, repeats: false) { [self] _ in send(.leftMouseDragged, at: dragPoint) }
            RunLoop.main.add(timer, forMode: .eventTracking)
            RunLoop.main.add(timer, forMode: .default)
            timers.append(timer)
        }
        for (delay, phase) in held {
            let timer = Timer(timeInterval: delay, repeats: false) { [self] _ in
                capture(phase)
                if delay == 1.0 { send(.leftMouseUp, at: isDrag ? dragPoint : start) }
            }
            RunLoop.main.add(timer, forMode: .eventTracking)
            RunLoop.main.add(timer, forMode: .default)
            timers.append(timer)
        }
        send(.leftMouseDown, at: start)
        trackingDurationMS = Int(Date().timeIntervalSince(mouseDownTime!) * 1000)
        record("mouseDown sendEvent returned t_ms=\(trackingDurationMS)")
        // A control that does not enter tracking may return before the timers. Keep the
        // event loop live so its failure is visible in the images and manifest.
        if mouseUpTime == nil { RunLoop.main.run(until: Date().addingTimeInterval(1.5)) }
        guard let release = mouseUpTime else {
            record("mouse-up timer did not fire; no released captures")
            try saveManifest()
            throw NSError(domain: "GlassCaptures", code: 5, userInfo: [NSLocalizedDescriptionKey: "mouse-up timer did not fire"])
        }
        for (delay, phase) in [(0.05,"released-0050ms"),(0.1,"released-0100ms"),
                               (0.2,"released-0200ms"),(0.35,"released-0350ms"),(0.6,"released-0600ms")] {
            let deadline = release.addingTimeInterval(delay)
            if deadline > Date() { RunLoop.main.run(until: deadline) }
            capture(phase)
        }
        try saveManifest()
        if trackingDurationMS < 800 {
            throw NSError(domain: "GlassCaptures", code: 6, userInfo: [NSLocalizedDescriptionKey: "control did not enter mouse tracking"])
        }
        _ = timers
    }
}

if let i = CommandLine.arguments.firstIndex(of: "--env-out"), i + 1 < CommandLine.arguments.count {
    do { try writeDisplayEnvironment(to: CommandLine.arguments[i + 1]); exit(0) }
    catch { record("display environment failed: \(error)"); exit(1) }
}
let options = Options()
NSApplication.shared.setActivationPolicy(.regular)
NSApp.appearance = NSAppearance(named: options.appearance == "dark" ? .darkAqua : .aqua)
record("preflight screen capture access=\(CGPreflightScreenCaptureAccess())")
DispatchQueue.main.async {
    do {
        let session = try CaptureSession(options: options)
        try session.run()
        let failures = session.results.filter { ($0["success"] as? Bool) != true }
        try? (failures.isEmpty ? "SUCCESS" : "FAIL").write(to: session.folder.appendingPathComponent("status.txt"), atomically: true, encoding: .utf8)
        exit(failures.isEmpty ? 0 : 1)
    } catch {
        record("fatal: \(error)")
        let root = URL(fileURLWithPath: options.out, isDirectory: true)
        let folder = root.appendingPathComponent(options.scenario)
            .appendingPathComponent("\(options.appearance)-\(options.accent)-\(options.size)-\(options.state)-\(options.interaction)")
            .appendingPathComponent(options.background)
        try? FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
        try? "FAIL: \(error)".write(to: folder.appendingPathComponent("status.txt"), atomically: true, encoding: .utf8)
        exit(1)
    }
}
NSApp.run()
