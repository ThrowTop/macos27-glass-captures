import AppKit
import CoreGraphics
import CoreImage
import ImageIO
import QuartzCore
import ScreenCaptureKit
import SwiftUI
import SafeKVC
import ApplicationServices
import ObjectiveC.runtime
import Darwin

struct Options {
    var scenario = "nsswitch"
    var appearance = "light"
    var background = "plain"
    var size = "regular"
    var state = "on"
    var interaction = "hold"
    var accent = "default"
    var accessibility = "default"
    var out = "out"
    // Native layer ablations after the idle capture (SwiftUI glass scenarios only).
    var ablate = false

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
            case "--accessibility": accessibility = value
            case "--out": out = value
            default: break
            }
            i += 2
        }
    }

    init(_ values: [String: String]) {
        scenario = values["scenario"] ?? scenario
        appearance = values["appearance"] ?? appearance
        background = values["background"] ?? background
        size = values["size"] ?? size
        state = values["state"] ?? state
        interaction = values["interaction"] ?? interaction
        accent = values["accent"] ?? accent
        accessibility = values["accessibility"] ?? accessibility
        out = values["out"] ?? out
        ablate = values["ablate"] == "1"
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
        case "vstripes":
            NSColor.white.setFill(); r.fill()
            NSColor.black.setFill()
            for x in stride(from: CGFloat(0), to: r.width, by: 2) {
                CGRect(x: x, y: 0, width: 1, height: r.height).fill()
            }
        case "checker8":
            NSColor.white.setFill(); r.fill()
            NSColor.black.setFill()
            for y in stride(from: CGFloat(0), to: r.height, by: 8) {
                for x in stride(from: CGFloat(0), to: r.width, by: 8) where
                    (Int(x / 8) + Int(y / 8)) % 2 == 0 {
                    CGRect(x: x, y: y, width: 8, height: 8).fill()
                }
            }
        case "photo":
            if let url = Bundle.main.url(forResource: "photo", withExtension: "png"),
               let image = NSImage(contentsOf: url) {
                let source = image.size
                let ratio = max(r.width / source.width, r.height / source.height)
                let used = CGSize(width: r.width / ratio, height: r.height / ratio)
                let crop = CGRect(x: (source.width - used.width) / 2,
                                  y: (source.height - used.height) / 2,
                                  width: used.width, height: used.height)
                image.draw(in: r, from: crop, operation: .copy, fraction: 1)
            } else { NSColor.windowBackgroundColor.setFill(); r.fill() }
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

final class CaptureToolbarItems: NSObject, NSToolbarDelegate {
    private let names = ["First", "Second", "Third"]
    private let ids = (0..<3).map { NSToolbarItem.Identifier("capture-button-\($0)") }
    private let segmentID = NSToolbarItem.Identifier("capture-segments")

    func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        ids + [segmentID, .flexibleSpace]
    }
    func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        [ids[0], ids[1], .flexibleSpace, segmentID, .flexibleSpace, ids[2]]
    }
    func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier id: NSToolbarItem.Identifier,
                 willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
        let item = NSToolbarItem(itemIdentifier: id)
        if id == segmentID {
            let segmented = NSSegmentedControl(labels: ["One", "Two", "Three"],
                trackingMode: .selectOne, target: nil, action: nil)
            segmented.selectedSegment = 0
            segmented.sizeToFit()
            item.view = segmented
            return item
        }
        guard let index = ids.firstIndex(of: id) else { return nil }
        let button = NSButton(title: names[index], target: nil, action: nil)
        button.bezelStyle = .toolbar
        button.sizeToFit()
        item.view = button
        return item
    }
}

struct SwitchView: View {
    @State var isOn: Bool
    var body: some View { Toggle("", isOn: $isOn).toggleStyle(.switch).labelsHidden() }
}

@available(macOS 26.0, *)
struct GlassButtonView: View {
    let prominent: Bool
    let large: Bool
    var body: some View {
        if prominent {
            Button("Button") {}.buttonStyle(.glassProminent)
                .controlSize(large ? .large : .regular)
        } else {
            Button("Button") {}.buttonStyle(.glass)
                .controlSize(large ? .large : .regular)
        }
    }
}

@available(macOS 26.0, *)
struct GlassView: View {
    let shape: String
    let style: String
    let width: CGFloat
    let height: CGFloat
    let spacing: CGFloat
    var glass: Glass {
        switch style {
        case "clear": return .clear
        case "identity": return .identity
        case "blue": return .regular.tint(.blue)
        case "red50": return .regular.tint(.red.opacity(0.5))
        case "interactive": return .regular.interactive()
        default: return .regular
        }
    }
    @ViewBuilder var element: some View {
        let content = Color.clear.frame(width: width, height: height)
        if shape == "circle" { content.glassEffect(glass, in: Circle()) }
        else if shape == "rounded" {
            content.glassEffect(glass, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
        } else { content.glassEffect(glass, in: Capsule()) }
    }
    var body: some View {
        if shape == "legacy-capsule" || shape == "legacy-large" {
            let base = RoundedRectangle(cornerRadius: shape == "legacy-capsule" ? 22 : 18)
                .fill(.clear).frame(width: width, height: height)
            if style == "clear" { base.glassEffect(.clear) }
            else if style == "interactive" { base.glassEffect(.regular.interactive()) }
            else { base.glassEffect(.regular) }
        } else if shape == "container-merged" || shape == "container-separate" {
            GlassEffectContainer(spacing: 20) {
                HStack(spacing: spacing) {
                    Color.clear.frame(width: 64, height: 64).glassEffect(glass, in: Capsule())
                    Color.clear.frame(width: 64, height: 64).glassEffect(glass, in: Capsule())
                }
            }
        } else { element }
    }
}

func safeDescription(_ value: Any?, depth: Int = 0) -> Any? {
    guard let value else { return nil }
    if depth > 12 { return ["error": "value depth limit"] }
    if value is NSNull { return NSNull() }
    if let s = value as? String { return s }
    if let n = value as? NSNumber { return n }
    if CFGetTypeID(value as CFTypeRef) == CGColor.typeID {
        let color = value as! CGColor
        return ["components": color.components?.map(Double.init) ?? [],
                "color_space": color.colorSpace.map { String(describing: $0.name) } ?? "unknown"] as [String: Any]
    }
    if let data = value as? Data {
        if data.count % 4 == 0 {
            let bytes = [UInt8](data)
            return stride(from: 0, to: bytes.count, by: 4).map { i -> Float in
                let bits = UInt32(bytes[i]) | UInt32(bytes[i+1]) << 8 |
                    UInt32(bytes[i+2]) << 16 | UInt32(bytes[i+3]) << 24
                return Float(bitPattern: bits)
            }
        }
        return ["bytes": data.count, "base64": data.base64EncodedString()]
    }
    if let p = value as? NSValue {
        let type = String(cString: p.objCType)
        if type.hasPrefix("{CGRect") { return rectJSON(p.rectValue) }
        if type.hasPrefix("{CGPoint") { return pointJSON(p.pointValue) }
        if type.hasPrefix("{CGSize") { return ["width": p.sizeValue.width, "height": p.sizeValue.height] }
        if type.hasPrefix("{CGAffineTransform") {
            var t = CGAffineTransform.identity
            p.getValue(&t)
            return [t.a, t.b, t.c, t.d, t.tx, t.ty]
        }
        return ["type": type, "value": p.description]
    }
    if let a = value as? [Any] { return a.map { safeDescription($0, depth: depth + 1) ?? NSNull() } }
    if let d = value as? [String: Any] {
        return d.mapValues { safeDescription($0, depth: depth + 1) ?? NSNull() }
    }
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

func filterJSON(_ value: Any, depth: Int = 0) -> Any {
    if depth > 12 { return ["error": "filter depth limit"] }
    if let a = value as? [Any] { return a.map { filterJSON($0, depth: depth + 1) } }
    let obj = value as AnyObject
    var d: [String: Any] = ["class": NSStringFromClass(type(of: obj))]
    var keys = Set(["name", "inputAmount", "inputRadius", "inputColorMatrix"])
    if let attributes = SafeValueForKey(obj, "attributes") as? [String: Any] {
        d["attributes"] = safeDescription(attributes)
        keys.formUnion(attributes.keys.filter { $0.hasPrefix("input") })
    }
    if let inputKeys = SafeValueForKey(obj, "inputKeys") as? [String] {
        keys.formUnion(inputKeys)
    }
    var cls: AnyClass? = type(of: obj)
    while let current = cls {
        var count: UInt32 = 0
        if let properties = class_copyPropertyList(current, &count) {
            for i in 0..<Int(count) {
                let key = String(cString: property_getName(properties[i]))
                if key.hasPrefix("input") { keys.insert(key) }
            }
            free(properties)
        }
        cls = class_getSuperclass(current)
    }
    for key in keys.sorted() {
        if let v = SafeValueForKey(obj, key) {
            if let nested = v as? [Any], nested.contains(where: { String(describing: type(of: $0)).contains("Filter") }) {
                d[key] = filterJSON(nested, depth: depth + 1)
            } else { d[key] = safeDescription(v, depth: depth + 1) }
        }
    }
    return d
}

func writeJSON(_ object: Any, to url: URL) throws {
    func finiteJSON(_ value: Any) -> Any {
        if let array = value as? [Any] { return array.map(finiteJSON) }
        if let object = value as? [String: Any] { return object.mapValues(finiteJSON) }
        if let number = value as? NSNumber {
            return number.doubleValue.isFinite ? number : NSNull()
        }
        if let number = value as? CGFloat {
            return number.isFinite ? number : NSNull()
        }
        if let number = value as? Double {
            return number.isFinite ? number : NSNull()
        }
        if let number = value as? Float {
            return number.isFinite ? number : NSNull()
        }
        return value
    }
    let data = try JSONSerialization.data(withJSONObject: finiteJSON(object), options: [.prettyPrinted, .sortedKeys, .fragmentsAllowed])
    try data.write(to: url, options: .atomic)
}

func writePNG(_ image: CGImage, to url: URL) -> Bool {
    guard let dest = CGImageDestinationCreateWithURL(url as CFURL, "public.png" as CFString, 1, nil) else { return false }
    CGImageDestinationAddImage(dest, image, nil)
    return CGImageDestinationFinalize(dest)
}

func systemFact(_ name: String) -> String {
    let process = Process()
    process.executableURL = URL(fileURLWithPath: "/usr/sbin/sysctl")
    process.arguments = ["-n", name]
    let pipe = Pipe()
    process.standardOutput = pipe
    process.standardError = Pipe()
    do {
        try process.run()
        let value = String(data: pipe.fileHandleForReading.readDataToEndOfFile(), encoding: .utf8) ?? ""
        process.waitUntilExit()
        return value.trimmingCharacters(in: .whitespacesAndNewlines)
    } catch { return "unavailable: \(error)" }
}

let hardwareModel = systemFact("hw.model")
let osBuild = systemFact("kern.osversion")

// Windows above `window` that cover `region` (window coordinates; the whole window when nil).
// The Dock's screen-sized backstop window is transparent outside the (auto-hidden) Dock bar and
// is ignored; the bar itself is a separate check by the script (Dock autohide).
func overlappingWindows(above window: NSWindow, region: CGRect? = nil) -> [[String: Any]] {
    let screen = window.screen ?? NSScreen.main
    let top = screen?.frame.maxY ?? 0
    let screenFrame = screen?.frame ?? .zero
    let local = region ?? CGRect(origin: .zero, size: window.frame.size)
    let onScreen = window.convertToScreen(local)
    let target = CGRect(x: onScreen.minX, y: top - onScreen.maxY,
                        width: onScreen.width, height: onScreen.height)
    let list = CGWindowListCopyWindowInfo([.optionOnScreenAboveWindow, .excludeDesktopElements],
                                           CGWindowID(window.windowNumber)) as? [[String: Any]] ?? []
    return list.compactMap { item in
        if (item[kCGWindowOwnerPID as String] as? NSNumber)?.int32Value ==
            ProcessInfo.processInfo.processIdentifier { return nil }
        guard let b = item[kCGWindowBounds as String] as? [String: Any],
              let x = (b["X"] as? NSNumber)?.doubleValue,
              let y = (b["Y"] as? NSNumber)?.doubleValue,
              let w = (b["Width"] as? NSNumber)?.doubleValue,
              let h = (b["Height"] as? NSNumber)?.doubleValue else { return nil }
        let frame = CGRect(x: x, y: y, width: w, height: h)
        if (item[kCGWindowOwnerName as String] as? String) == "Dock" &&
            frame.size == screenFrame.size { return nil }
        guard frame.intersects(target) else { return nil }
        return ["owner": item[kCGWindowOwnerName as String] ?? NSNull(),
                "name": item[kCGWindowName as String] ?? NSNull(),
                "frame": rectJSON(frame),
                "owner_pid": item[kCGWindowOwnerPID as String] ?? NSNull()]
    }
}

func ownPresentationFrame(above window: NSWindow) -> CGRect? {
    let top = (window.screen ?? NSScreen.main)?.frame.maxY ?? 0
    let list = CGWindowListCopyWindowInfo([.optionOnScreenAboveWindow, .excludeDesktopElements],
                                          CGWindowID(window.windowNumber)) as? [[String: Any]] ?? []
    for item in list {
        guard (item[kCGWindowOwnerPID as String] as? NSNumber)?.int32Value ==
                  ProcessInfo.processInfo.processIdentifier,
              let b = item[kCGWindowBounds as String] as? [String: Any],
              let x = (b["X"] as? NSNumber)?.doubleValue,
              let y = (b["Y"] as? NSNumber)?.doubleValue,
              let w = (b["Width"] as? NSNumber)?.doubleValue,
              let h = (b["Height"] as? NSNumber)?.doubleValue else { continue }
        return CGRect(x: x - window.frame.minX, y: top - y - h - window.frame.minY,
                      width: w, height: h)
    }
    return nil
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
    let glassLocalFrame: CGRect
    let glassShape: String
    let glassStyle: String
    let glassCornerRadius: CGFloat
    let glassSpacing: CGFloat?
    let folder: URL
    let scale: CGFloat
    let toolbarItems: CaptureToolbarItems?
    let splitController: NSSplitViewController?
    let popover: NSPopover?
    let menu: NSMenu?
    var results: [[String: Any]] = []
    var mouseDownTime: Date?
    var mouseUpTime: Date?
    var trackingDurationMS = 0
    var usesTrackingLoop = true
    var usedDirectFallback = false
    var sckFailure: String?
    var sckUnavailable = false
    var backgroundPath: String?
    var backgroundError: String?
    var backgroundObstructions: [[String: Any]] = []

    init(options: Options) throws {
        self.options = options
        let root = URL(fileURLWithPath: options.out, isDirectory: true)
        folder = root.appendingPathComponent(options.scenario)
            .appendingPathComponent("\(options.appearance)-\(options.accent)-\(options.size)-\(options.state)-\(options.interaction)\(options.accessibility == "default" ? "" : "-\(options.accessibility)")")
            .appendingPathComponent(options.background)
        try FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
        let isToolbar = options.scenario == "toolbar-window"
        let isSidebar = options.scenario == "sidebar-window"
        let w = CaptureWindow(contentRect: CGRect(x: 24, y: 24, width: 480, height: 300),
                         styleMask: isToolbar || isSidebar ? [.titled, .fullSizeContentView] : [.borderless],
                         backing: .buffered, defer: false)
        if isToolbar || isSidebar {
            w.setFrame(CGRect(x: 24, y: 24, width: 480, height: 300), display: false)
        }
        w.isReleasedWhenClosed = false
        w.backgroundColor = .windowBackgroundColor
        w.hasShadow = false
        w.level = .normal
        var newToolbarItems: CaptureToolbarItems? = nil
        var newSplitController: NSSplitViewController? = nil
        var newPopover: NSPopover? = nil
        var newMenu: NSMenu? = nil
        if isToolbar {
            w.titleVisibility = .hidden
            w.titlebarAppearsTransparent = true
            let items = CaptureToolbarItems()
            let toolbar = NSToolbar(identifier: "capture-glass-toolbar")
            toolbar.delegate = items
            toolbar.displayMode = .iconOnly
            w.toolbar = toolbar
            newToolbarItems = items
        }
        w.appearance = NSAppearance(named: options.appearance == "dark" ? .darkAqua : .aqua)
        let bg = BackgroundView(frame: CGRect(x: 0, y: 0, width: 480, height: 300), kind: options.background)
        w.contentView = bg
        let c: NSView
        var shape = "capsule"
        var style = "none"
        var localGlass = CGRect.zero
        var corner: CGFloat = 0
        var spacing: CGFloat? = nil
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
        case "popup", "pulldown":
            // NSPopUpButton as a pop-up (selected item shown, checkmark in the menu) or pull-down
            // (fixed title, commands). Holding opens the menu; held captures show it.
            let pullsDown = options.scenario == "pulldown"
            let v = NSPopUpButton(frame: .zero, pullsDown: pullsDown)
            if pullsDown { v.addItem(withTitle: "Actions") }
            v.addItems(withTitles: pullsDown ? ["Duplicate", "Rename", "Move to Trash"]
                                             : ["Automatic", "Blue", "Pink", "Yellow"])
            if !pullsDown { v.selectItem(at: options.state == "on" ? 1 : 0) }
            v.controlSize = controlSize
            v.font = NSFont.systemFont(ofSize: NSFont.systemFontSize(for: controlSize))
            v.sizeToFit()
            c = v
            style = options.scenario
        case "progress":
            let v = NSProgressIndicator(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
            v.style = .bar
            v.isIndeterminate = false
            v.minValue = 0
            v.maxValue = 100
            v.doubleValue = options.state == "on" ? 70 : 30
            v.controlSize = controlSize
            c = v
            style = "progress"
        case "checkbox", "radio":
            let v = options.scenario == "checkbox"
                ? NSButton(checkboxWithTitle: "Checkbox", target: nil, action: nil)
                : NSButton(radioButtonWithTitle: "Radio", target: nil, action: nil)
            v.state = options.state == "on" ? .on : options.state == "mixed" ? .mixed : .off
            if options.state == "mixed" { v.allowsMixedState = true }
            v.controlSize = controlSize
            v.font = NSFont.systemFont(ofSize: NSFont.systemFontSize(for: controlSize))
            v.sizeToFit()
            c = v
            style = options.scenario
        case "nsbutton-glass":
            if #available(macOS 26.0, *) {
                let v = NSButton(title: "Button", target: nil, action: nil)
                v.bezelStyle = .glass
                v.controlSize = controlSize
                v.sizeToFit()
                c = v
                style = "button-glass"
            } else { throw NSError(domain: "GlassCaptures", code: 8, userInfo: [NSLocalizedDescriptionKey: "glass button unavailable"]) }
        case "swiftui-button-glass", "swiftui-button-prominent":
            if #available(macOS 26.0, *) {
                let prominent = options.scenario == "swiftui-button-prominent"
                let v = NSHostingView(rootView: GlassButtonView(prominent: prominent,
                    large: options.size == "large"))
                v.frame.size = v.fittingSize
                c = v
                style = prominent ? "glassProminent" : "glass"
            } else { throw NSError(domain: "GlassCaptures", code: 9, userInfo: [NSLocalizedDescriptionKey: "SwiftUI glass button unavailable"]) }
        case "toolbar-window":
            let v = NSView(frame: CGRect(x: 0, y: 0, width: 480, height: 300))
            c = v
            style = "toolbar"
            shape = "rect"
            localGlass = CGRect(x: 0, y: 246, width: 480, height: 54)
        case "sidebar-window":
            let split = NSSplitViewController()
            let sidebar = NSViewController()
            sidebar.view = NSView(frame: CGRect(x: 0, y: 0, width: 180, height: 300))
            let content = NSViewController()
            content.view = NSView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
            split.addSplitViewItem(NSSplitViewItem(sidebarWithViewController: sidebar))
            split.addSplitViewItem(NSSplitViewItem(viewController: content))
            split.view.frame = bg.bounds
            split.view.autoresizingMask = [.width, .height]
            c = split.view
            newSplitController = split
            style = "sidebar"
            shape = "rect"
            localGlass = CGRect(x: 0, y: 0, width: 180, height: 300)
        case "popover", "menu":
            let button = NSButton(title: options.scenario == "popover" ? "Open" : "Menu",
                                  target: nil, action: nil)
            button.sizeToFit()
            c = button
            style = options.scenario
            shape = "rect"
            if options.scenario == "popover" {
                let controller = NSViewController()
                controller.view = NSView(frame: CGRect(x: 0, y: 0, width: 220, height: 160))
                let text = NSTextField(labelWithString: "Popover")
                text.frame = CGRect(x: 20, y: 115, width: 170, height: 25)
                controller.view.addSubview(text)
                let p = NSPopover()
                p.contentViewController = controller
                p.contentSize = CGSize(width: 220, height: 160)
                p.behavior = .transient
                newPopover = p
            } else {
                // Covers the NSContextMenuImpl layout terms: plain items, a key equivalent, a
                // checked item (mark column), separators, a submenu arrow and an item image.
                let m = NSMenu(title: "Menu")
                m.autoenablesItems = false
                m.addItem(NSMenuItem(title: "First", action: nil, keyEquivalent: ""))
                let shortcut = NSMenuItem(title: "Show in Finder", action: nil, keyEquivalent: "r")
                shortcut.keyEquivalentModifierMask = .command
                m.addItem(shortcut)
                let checked = NSMenuItem(title: "Show Sidebar", action: nil, keyEquivalent: "")
                checked.state = .on
                m.addItem(checked)
                m.addItem(.separator())
                let sort = NSMenuItem(title: "Sort By", action: nil, keyEquivalent: "")
                let sub = NSMenu(title: "Sort By")
                sub.addItem(NSMenuItem(title: "Name", action: nil, keyEquivalent: ""))
                sort.submenu = sub
                m.addItem(sort)
                let image = NSMenuItem(title: "Settings", action: nil, keyEquivalent: "")
                image.image = NSImage(systemSymbolName: "gearshape", accessibilityDescription: nil)
                m.addItem(image)
                m.addItem(.separator())
                m.addItem(NSMenuItem(title: "Third", action: nil, keyEquivalent: ""))
                newMenu = m
            }
        case "nsglass", "nsglass-regular", "nsglass-clear", "nsglass-blue":
            if #available(macOS 26.0, *) {
                let large = options.size.hasPrefix("large")
                let height: CGFloat = large ? 120 : 44
                let v = NSGlassEffectView(frame: CGRect(x: 0, y: 0, width: large ? 200 : 120, height: height))
                style = options.scenario == "nsglass-clear" ? "clear" : "regular"
                if options.scenario != "nsglass" { v.style = style == "clear" ? .clear : .regular }
                if options.scenario == "nsglass-blue" { v.tintColor = .systemBlue }
                corner = options.size.hasSuffix("r0") ? 0 : options.size.hasSuffix("r12") ? 12 : height / 2
                if options.scenario != "nsglass" { v.cornerRadius = corner }
                corner = v.cornerRadius
                shape = corner == height / 2 ? "capsule" : "rect"
                localGlass = v.bounds
                c = v
            } else { throw NSError(domain: "GlassCaptures", code: 1, userInfo: [NSLocalizedDescriptionKey: "NSGlassEffectView unavailable"]) }
        case let scenario where scenario.hasPrefix("swiftui-glass-"):
            if #available(macOS 26.0, *) {
                style = scenario.replacingOccurrences(of: "swiftui-glass-", with: "")
                let dimensions: CGSize
                if options.size.hasPrefix("h"), let h = Double(options.size.dropFirst()) {
                    dimensions = CGSize(width: 2.5 * h, height: h)
                } else if options.size == "circle" { dimensions = CGSize(width: 64, height: 64) }
                else if options.size == "large" || options.size == "rounded" {
                    dimensions = CGSize(width: 200, height: 120)
                } else if options.size.hasPrefix("container") {
                    dimensions = CGSize(width: options.size == "container-merged" ? 140 : 152, height: 64)
                } else { dimensions = CGSize(width: 120, height: 44) }
                shape = options.size == "large" ? "legacy-large"
                    : options.size == "regular" ? "legacy-capsule"
                    : options.size == "rounded" ? "rounded"
                    : options.size == "circle" ? "circle"
                    : options.size.hasPrefix("container") ? options.size : "capsule"
                spacing = shape == "container-merged" ? 12 : shape == "container-separate" ? 24 : nil
                let v = NSHostingView(rootView: GlassView(shape: shape, style: style,
                    width: dimensions.width, height: dimensions.height, spacing: spacing ?? 0))
                v.frame.size = CGSize(width: dimensions.width + 20, height: dimensions.height + 20)
                localGlass = CGRect(x: 10, y: 10, width: dimensions.width, height: dimensions.height)
                corner = shape == "rounded" ? 12
                    : shape == "legacy-large" ? 18 : min(dimensions.width, dimensions.height) / 2
                c = v
            } else { throw NSError(domain: "GlassCaptures", code: 2, userInfo: [NSLocalizedDescriptionKey: "SwiftUI glass unavailable"]) }
        default: throw NSError(domain: "GlassCaptures", code: 3, userInfo: [NSLocalizedDescriptionKey: "unknown scenario \(options.scenario)"])
        }
        c.frame.origin = CGPoint(x: (480 - c.frame.width) / 2,
                                 y: options.scenario == "popover" || options.scenario == "menu"
                                     ? 70 : (300 - c.frame.height) / 2)
        bg.addSubview(c)
        control = c
        glassLocalFrame = localGlass == .zero ? c.bounds : localGlass
        glassShape = shape == "legacy-large" ? "rect" : shape == "legacy-capsule" ? "capsule" : shape
        glassStyle = style
        glassCornerRadius = corner
        glassSpacing = spacing
        window = w
        scale = w.screen?.backingScaleFactor ?? NSScreen.main?.backingScaleFactor ?? 1
        toolbarItems = newToolbarItems
        splitController = newSplitController
        popover = newPopover
        menu = newMenu
    }

    func screenshot(_ url: URL) -> (String, String?) {
        if sckUnavailable { return screenshotWithCLI(url) }
        let semaphore = DispatchSemaphore(value: 0)
        var image: CGImage?
        var errorText: String?
        let windowFrame = window.frame
        let screenFrame = (window.screen ?? NSScreen.main)?.frame ?? CGRect(x: 0, y: 0, width: 1024, height: 768)
        Task.detached {
            do {
                let content = try await SCShareableContent.current
                guard let display = content.displays.first else {
                    throw NSError(domain: "GlassCaptures", code: 4, userInfo: [NSLocalizedDescriptionKey: "display absent from ScreenCaptureKit list"])
                }
                // AppKit's liftedPresentation puts a pressed switch in a separate
                // overlay window. A window-only filter drops that overlay, so take
                // the display composite and crop the unchanged test window bounds.
                let filter = SCContentFilter(display: display, excludingWindows: [])
                let config = SCStreamConfiguration()
                config.width = display.width
                config.height = display.height
                config.showsCursor = false
                let full = try await SCScreenshotManager.captureImage(contentFilter: filter, configuration: config)
                let pixelScale = CGFloat(full.width) / screenFrame.width
                let crop = CGRect(x: floor((windowFrame.minX - screenFrame.minX) * pixelScale),
                                  y: floor((screenFrame.maxY - windowFrame.maxY) * pixelScale),
                                  width: ceil(windowFrame.width * pixelScale),
                                  height: ceil(windowFrame.height * pixelScale))
                guard let clipped = full.cropping(to: crop) else {
                    throw NSError(domain: "GlassCaptures", code: 7, userInfo: [NSLocalizedDescriptionKey: "display composite crop outside image: \(crop)"])
                }
                image = clipped
            } catch { errorText = String(describing: error) }
            semaphore.signal()
        }
        if semaphore.wait(timeout: .now() + 8) == .success, let image, writePNG(image, to: url) {
            return ("ScreenCaptureKit-display", nil)
        }
        sckFailure = errorText ?? "ScreenCaptureKit timed out or failed to write PNG"
        sckUnavailable = true
        return screenshotWithCLI(url)
    }

    func screenshotWithCLI(_ url: URL) -> (String, String?) {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/sbin/screencapture")
        let screen = (window.screen ?? NSScreen.main)?.frame ?? CGRect(x: 0, y: 0, width: 1024, height: 768)
        let rect = window.frame
        let region = "\(Int(rect.minX - screen.minX)),\(Int(screen.maxY - rect.maxY)),\(Int(rect.width)),\(Int(rect.height))"
        process.arguments = ["-x", "-o", "-R", region, url.path]
        do {
            try process.run()
            process.waitUntilExit()
            if process.terminationStatus == 0, FileManager.default.fileExists(atPath: url.path) {
                return ("screencapture-region", nil)
            }
            return ("none", "ScreenCaptureKit: \(sckFailure ?? "unknown"); screencapture exit \(process.terminationStatus)")
        } catch { return ("none", "ScreenCaptureKit: \(sckFailure ?? "unknown"); screencapture: \(error)") }
    }

    func waitForUnobstructedWindow() -> [[String: Any]] {
        let deadline = Date().addingTimeInterval(4)
        // Only the glass neighbourhood that the harness compares (control frame +/- 40 pt).
        let region = control.convert(control.bounds, to: nil).insetBy(dx: -40, dy: -40)
        var overlaps = overlappingWindows(above: window, region: region)
        while !overlaps.isEmpty && Date() < deadline {
            RunLoop.main.run(until: Date().addingTimeInterval(0.1))
            overlaps = overlappingWindows(above: window, region: region)
        }
        return overlaps
    }

    func capture(_ phase: String) {
        let obstructions = waitForUnobstructedWindow()
        let url = folder.appendingPathComponent("\(phase).png")
        let (method, error) = screenshot(url)
        let frame = control.convert(control.bounds, to: window.contentView)
        var glassFrame = control.convert(glassLocalFrame, to: window.contentView)
        if let popupWindow = popover?.contentViewController?.view.window {
            let content = popupWindow.frame
            glassFrame = CGRect(x: content.minX - window.frame.minX,
                               y: content.minY - window.frame.minY,
                               width: content.width, height: content.height)
        }
        let knob = knobFrame()
        let workspace = NSWorkspace.shared
        let accessibility: [String: Bool] = [
            "increase_contrast": workspace.accessibilityDisplayShouldIncreaseContrast,
            "reduce_transparency": workspace.accessibilityDisplayShouldReduceTransparency,
            "reduce_motion": workspace.accessibilityDisplayShouldReduceMotion,
            "differentiate_without_color": workspace.accessibilityDisplayShouldDifferentiateWithoutColor
        ]
        let accessibilityApplied = options.accessibility == "contrast"
            ? accessibility["increase_contrast"] == true
            : options.accessibility == "transparency"
            ? accessibility["reduce_transparency"] == true
            : accessibility.values.allSatisfy { !$0 }
        let screen = window.screen ?? NSScreen.main
        var cropPath: String? = nil
        var layerPath: String? = nil
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
        if phase == "idle" || phase == "held-0500ms" || phase == "drag-held-0500ms" || phase.hasPrefix("abl-") {
            let layerURL = folder.appendingPathComponent("layers-\(phase).json")
            do {
                if let layer = window.contentView?.superview?.layer {
                    var tree = layerJSON(layer)
                    let presentation = NSApp.windows.filter { $0 !== window && $0.isVisible }
                        .compactMap { other -> [String: Any]? in
                            guard let root = other.contentView?.superview?.layer else { return nil }
                            return ["window_frame": rectJSON(other.frame), "layers": layerJSON(root)]
                        }
                    if !presentation.isEmpty { tree["presentation_windows"] = presentation }
                    try writeJSON(tree, to: layerURL)
                    layerPath = layerURL.path
                } else { record("layer dump missing root layer \(phase)") }
            } catch { record("layer dump failed \(phase): \(error)") }
        }
        let t = mouseDownTime.map { Int(Date().timeIntervalSince($0) * 1000) }
        let glassFrameJSON: Any = options.scenario == "menu"
            ? (ownPresentationFrame(above: window).map { rectJSON($0) } as Any? ?? NSNull())
            : rectJSON(glassFrame)
        let entry: [String: Any] = [
            "scenario": options.scenario, "control": NSStringFromClass(type(of: control)),
            "size": options.size, "state": options.state, "interaction": options.interaction,
            "appearance": options.appearance,
            "accent": options.accent, "background": options.background, "phase": phase,
            "accessibility_axis": options.accessibility,
            "t_ms_since_mouse_down": t as Any? ?? NSNull(), "control_frame_window_points": rectJSON(frame),
            "control_frame_window_pixels": rectJSON(frame.applying(CGAffineTransform(scaleX: scale, y: scale))),
            "knob_frame_window_points": knob.map { rectJSON($0) } as Any? ?? NSNull(),
            "knob_frame_window_pixels": knob.map { rectJSON($0.applying(CGAffineTransform(scaleX: scale, y: scale))) } as Any? ?? NSNull(),
            "backing_scale": scale, "capture_method": method,
            "success": method != "none" && backgroundPath != nil &&
                backgroundObstructions.isEmpty && accessibilityApplied,
            "window_is_key": NSApp.isActive && window.isKeyWindow && window.isMainWindow,
            "window_key": window.isKeyWindow, "window_main": window.isMainWindow,
            "app_active": NSApp.isActive, "obstructed": !obstructions.isEmpty,
            "obstructions": obstructions,
            "accessibility": accessibility,
            "accessibility_axis_applied": accessibilityApplied,
            "effective_appearance": window.effectiveAppearance.name.rawValue,
            "accent_color": safeDescription(NSColor.controlAccentColor.cgColor) ?? NSNull(),
            "window_background_color": safeDescription(NSColor.windowBackgroundColor.cgColor) ?? NSNull(),
            "cursor_location": pointJSON(NSEvent.mouseLocation),
            "screen_color_space": screen?.colorSpace?.localizedName ?? "unknown",
            "edr_headroom": screen?.maximumExtendedDynamicRangeColorComponentValue ?? 1,
            "hardware_model": hardwareModel, "os_build": osBuild,
            "glass": glassStyle, "shape": glassShape,
            "glass_frame_window_points": glassFrameJSON,
            "corner_radius": glassCornerRadius,
            "container_spacing": glassSpacing as Any? ?? NSNull(),
            "background_image": backgroundPath as Any? ?? NSNull(),
            "background_error": backgroundError as Any? ?? NSNull(),
            "background_obstructions": backgroundObstructions,
            "do_not_disturb": "not configured; obstruction check is authoritative",
            "control_value": (control as? NSSwitch).map { $0.state.rawValue } as Any? ?? NSNull(),
            "error": error as Any? ?? NSNull(), "image": method == "none" ? NSNull() : url.path as Any,
            "crop": cropPath as Any? ?? NSNull(), "sck_error": sckFailure as Any? ?? NSNull(),
            "layers": layerPath as Any? ?? NSNull()
        ]
        results.append(entry)
        record("capture \(phase) method=\(method) t_ms=\(t.map(String.init) ?? "idle") error=\(error ?? "none")")
    }

    func saveManifest() throws {
        let heldName = options.interaction == "drag" ? "drag-held-0500ms" : "held-0500ms"
        let idle = try? Data(contentsOf: folder.appendingPathComponent("idle-crop.png"))
        let held = try? Data(contentsOf: folder.appendingPathComponent("\(heldName)-crop.png"))
        for i in results.indices {
            results[i]["tracking_duration_ms"] = trackingDurationMS
            results[i]["event_delivery"] = usedDirectFallback
                ? (usesTrackingLoop ? "control.mouseDown-tracking" : "window-and-control-asynchronous")
                : "window.sendEvent"
            if options.interaction != "idle", let idle, let held {
                results[i]["held_differs_from_idle"] = idle != held
            }
        }
        try writeJSON(results, to: folder.appendingPathComponent("manifest-part.json"))
    }

    func recordFailure(_ error: Error) {
        results.append([
            "scenario": options.scenario, "size": options.size, "state": options.state,
            "interaction": options.interaction,
            "appearance": options.appearance, "accent": options.accent,
            "background": options.background, "accessibility_axis": options.accessibility,
            "phase": "error", "success": false,
            "capture_method": "none", "error": String(describing: error)
        ])
        try? saveManifest()
    }

    // Isolate native glass stages: hide the SDF highlight (@2) and/or portal (@1) layers, or
    // override glassBackground inputs on a copied filter, capture, then restore. The layer dump
    // of each phase records what was in effect.
    func nativeAblations() {
        guard let root = window.contentView?.superview?.layer else { record("ablation: no root layer"); return }
        func all(_ l: CALayer) -> [CALayer] { [l] + (l.sublayers ?? []).flatMap(all) }
        func cls(_ l: CALayer) -> String { NSStringFromClass(type(of: l)) }
        let layers = all(root).filter { cls($0) == "SwiftUI.SDFLayer" }.flatMap(all)
        let portal = layers.filter { cls($0).contains("SDFPortalLayer") && $0.name == "@1" }
        let highlight = layers.filter { cls($0) == "CASDFLayer" && $0.name == "@2" }
        let backdrop = layers.filter { cls($0) == "CABackdropLayer" }
        record("ablation layers portal=\(portal.count) highlight=\(highlight.count) backdrop=\(backdrop.count)")
        func apply(_ phase: String, hide: [CALayer], inputs: [String: Any] = [:]) {
            let hidden = hide.map { ($0, $0.isHidden) }
            var filters: [(CALayer, [Any]?)] = []
            CATransaction.begin(); CATransaction.setDisableActions(true)
            for layer in hide { layer.isHidden = true }
            if !inputs.isEmpty {
                for layer in backdrop {
                    filters.append((layer, layer.filters))
                    layer.filters = (layer.filters ?? []).map { filter -> Any in
                        guard let object = filter as? NSObject,
                              SafeValueForKey(object, "name") as? String == "glassBackground",
                              object.responds(to: #selector(NSCopying.copy(with:))),
                              let copy = object.copy() as? NSObject else { return filter }
                        for (key, value) in inputs where !SafeSetValueForKey(copy, value, key) {
                            record("ablation \(phase): cannot set \(key)")
                        }
                        return copy
                    }
                }
            }
            CATransaction.commit(); CATransaction.flush()
            RunLoop.main.run(until: Date().addingTimeInterval(0.4))
            capture(phase)
            CATransaction.begin(); CATransaction.setDisableActions(true)
            for (layer, wasHidden) in hidden { layer.isHidden = wasHidden }
            for (layer, original) in filters { layer.filters = original }
            CATransaction.commit(); CATransaction.flush()
            RunLoop.main.run(until: Date().addingTimeInterval(0.4))
        }
        let fill: [String: Any] = ["inputBlurFillDarkenOpacity": 0, "inputBlurFillLightenOpacity": 0,
                                   "inputBlurFillNormalOpacity": 0]
        apply("abl-no-highlight", hide: highlight)
        apply("abl-no-portal", hide: portal)
        apply("abl-background", hide: highlight + portal)
        apply("abl-background-no-darken", hide: highlight + portal, inputs: ["inputBlurFillDarkenOpacity": 0])
        apply("abl-background-no-fill", hide: highlight + portal, inputs: fill)
        apply("abl-background-no-face", hide: highlight + portal, inputs: ["inputFaceOpacity": 0])
        apply("abl-background-raw", hide: highlight + portal,
              inputs: fill.merging(["inputFaceOpacity": 0, "inputBlurRadius": 0]) { $1 })
        // Native `wide` readout: normal fill 1 and face 0 make glass_background output the
        // two-tap fill sample at glassLod(1.6 * scale * radius) over the core.
        for radius in [2.5, 5, 8, 10] {
            apply("abl-wide-r\(radius)", hide: highlight + portal,
                  inputs: ["inputBlurFillDarkenOpacity": 0, "inputBlurFillLightenOpacity": 0,
                           "inputBlurFillNormalOpacity": 1, "inputFaceOpacity": 0,
                           "inputBlurFillBlurRadius": radius])
        }
        capture("abl-restored")
    }

    func knobFrame() -> CGRect? {
        guard options.scenario == "nsswitch" else { return nil }
        if let root = window.contentView?.superview?.layer {
            func first(_ layer: CALayer, matching predicate: (CALayer) -> Bool) -> CALayer? {
                if predicate(layer) { return layer }
                for child in layer.sublayers ?? [] {
                    if let found = first(child, matching: predicate) { return found }
                }
                return nil
            }
            if let switchLayer = first(root, matching: {
                $0.name == "NSSwitch" && abs($0.bounds.width - control.bounds.width) < 0.5
            }) {
                let lifted = first(switchLayer, matching: { $0.name == "LiftLayer" })
                let opaque = first(switchLayer, matching: {
                    $0.cornerCurve == .continuous && $0.cornerRadius > 0 &&
                    $0.bounds.width > 8 && $0.bounds.width < control.bounds.width - 5 &&
                    $0.bounds.height < control.bounds.height
                })
                if let knob = lifted ?? opaque {
                    return knob.convert(knob.bounds, to: root)
                }
            }
        }
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
        if type == .leftMouseDown || !usesTrackingLoop { window.sendEvent(e) }
        else { NSApp.postEvent(e, atStart: false) }
    }

    func directMouseDown(at p: CGPoint) {
        guard let e = NSEvent.mouseEvent(with: .leftMouseDown, location: p, modifierFlags: [],
                                        timestamp: ProcessInfo.processInfo.systemUptime,
                                        windowNumber: window.windowNumber, context: nil,
                                        eventNumber: 1, clickCount: 1, pressure: 1) else { return }
        record("inject direct control.mouseDown at \(p.x),\(p.y); AX trusted=\(AXIsProcessTrusted())")
        control.mouseDown(with: e)
    }

    func run() throws {
        NSApp.appearance = NSAppearance(named: options.appearance == "dark" ? .darkAqua : .aqua)
        window.appearance = NSApp.appearance
        window.makeKeyAndOrderFront(nil)
        window.orderFrontRegardless()
        NSApp.activate(ignoringOtherApps: true)
        _ = NSRunningApplication.current.activate(options: [.activateAllWindows])
        window.makeKey()
        let activationDeadline = Date().addingTimeInterval(4)
        var askedLaunchServices = false
        repeat {
            RunLoop.main.run(until: Date().addingTimeInterval(0.15))
            if NSApp.isActive && window.isKeyWindow && window.isMainWindow { break }
            if !askedLaunchServices {
                askedLaunchServices = true
                let launcher = Process()
                launcher.executableURL = URL(fileURLWithPath: "/usr/bin/open")
                launcher.arguments = ["-a", Bundle.main.bundleURL.path]
                do { try launcher.run(); launcher.waitUntilExit(); record("reactivate via open exit=\(launcher.terminationStatus)") }
                catch { record("reactivate via open failed: \(error)") }
            }
            NSApp.unhide(nil)
            NSApp.activate(ignoringOtherApps: true)
            _ = NSRunningApplication.current.activate(options: [.activateAllWindows])
            window.makeKeyAndOrderFront(nil)
        } while Date() < activationDeadline
        RunLoop.main.run(until: Date().addingTimeInterval(1.1))
        if let screen = window.screen ?? NSScreen.main {
            _ = CGWarpMouseCursorPosition(CGPoint(x: screen.frame.maxX - 12, y: screen.frame.minY + 12))
        }
        NSCursor.hide()
        defer { NSCursor.unhide() }
        var inactiveWindow: NSWindow? = nil
        defer { inactiveWindow?.close() }
        // Capture the exact backdrop through the same display-composite path.
        control.isHidden = true
        if options.scenario == "toolbar-window" { window.toolbar?.isVisible = false }
        RunLoop.main.run(until: Date().addingTimeInterval(0.35))
        backgroundObstructions = waitForUnobstructedWindow()
        let backgroundURL = folder.appendingPathComponent("background.png")
        let (backgroundMethod, backgroundError) = screenshot(backgroundURL)
        if backgroundMethod != "none" { backgroundPath = backgroundURL.path }
        else {
            self.backgroundError = backgroundError ?? "unknown"
            record("background capture failed: \(backgroundError ?? "unknown")")
        }
        control.isHidden = false
        if options.scenario == "toolbar-window" { window.toolbar?.isVisible = true }
        RunLoop.main.run(until: Date().addingTimeInterval(0.35))
        if let popover {
            popover.show(relativeTo: control.bounds, of: control, preferredEdge: .maxY)
            RunLoop.main.run(until: Date().addingTimeInterval(0.35))
        }
        if options.scenario == "swiftui-glass-regular-inactive" {
            let other = CaptureWindow(contentRect: CGRect(x: 600, y: 24, width: 100, height: 80),
                                      styleMask: [.borderless], backing: .buffered, defer: false)
            other.backgroundColor = .windowBackgroundColor
            other.makeKeyAndOrderFront(nil)
            inactiveWindow = other
            RunLoop.main.run(until: Date().addingTimeInterval(0.35))
        }
        record("window key=\(window.isKeyWindow) main=\(window.isMainWindow) appActive=\(NSApp.isActive)")
        record("frontmost=\(NSWorkspace.shared.frontmostApplication?.localizedName ?? "nil") frontmostPID=\(NSWorkspace.shared.frontmostApplication?.processIdentifier ?? -1) current=\(NSRunningApplication.current.localizedName ?? "nil") currentPID=\(ProcessInfo.processInfo.processIdentifier) visible=\(window.isVisible)")
        if let menu {
            let timer = Timer(timeInterval: 0.35, repeats: false) { [self] _ in
                capture("idle")
                menu.cancelTracking()
            }
            RunLoop.main.add(timer, forMode: .eventTracking)
            _ = menu.popUp(positioning: nil, at: CGPoint(x: control.frame.minX,
                y: control.frame.maxY), in: window.contentView)
            try saveManifest()
            return
        }
        capture("idle")
        if options.ablate && options.scenario.hasPrefix("swiftui-glass") { nativeAblations() }
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
        if trackingDurationMS < 20 {
            usedDirectFallback = true
            directMouseDown(at: start)
            trackingDurationMS = Int(Date().timeIntervalSince(mouseDownTime!) * 1000)
            record("direct mouseDown returned t_ms=\(trackingDurationMS)")
            if trackingDurationMS < 20 { usesTrackingLoop = false }
        }
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
        record("case end appActive=\(NSApp.isActive) key=\(window.isKeyWindow) frontmostPID=\(NSWorkspace.shared.frontmostApplication?.processIdentifier ?? -1)")
        _ = timers
    }
}

if let i = CommandLine.arguments.firstIndex(of: "--env-out"), i + 1 < CommandLine.arguments.count {
    do { try writeDisplayEnvironment(to: CommandLine.arguments[i + 1]); exit(0) }
    catch { record("display environment failed: \(error)"); exit(1) }
}
if (CommandLine.arguments.contains("--menu-outline-window-mode") ||
    CommandLine.arguments.contains("--menu-outline-mode")),
   let appearanceIndex = CommandLine.arguments.firstIndex(of: "--probe-appearance"),
   let outputIndex = CommandLine.arguments.firstIndex(of: "--probe-out"),
   appearanceIndex + 1 < CommandLine.arguments.count, outputIndex + 1 < CommandLine.arguments.count {
    NSApplication.shared.setActivationPolicy(.regular)
    let appearance = CommandLine.arguments[appearanceIndex + 1]
    let output = CommandLine.arguments[outputIndex + 1]
    let fullMenuOutline = CommandLine.arguments.contains("--menu-outline-mode")
    final class MenuOutlineLaunchDelegate: NSObject, NSApplicationDelegate {
        let start: () -> Void
        init(start: @escaping () -> Void) { self.start = start }
        func applicationDidFinishLaunching(_ notification: Notification) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { self.start() }
        }
    }
    let delegate = MenuOutlineLaunchDelegate {
        do {
            if fullMenuOutline { try runMenuOutlineProbe(appearance: appearance, output: output) }
            else { try runMenuOutlineWindowProbe(appearance: appearance, output: output) }
            exit(0)
        }
        catch { record("menu-outline window probe failed: \(error)"); exit(1) }
    }
    NSApp.delegate = delegate
    NSApp.run()
    _ = delegate
}
if CommandLine.arguments.contains("--probe-mode"),
   let appearanceIndex = CommandLine.arguments.firstIndex(of: "--probe-appearance"),
   let outputIndex = CommandLine.arguments.firstIndex(of: "--probe-out"),
   appearanceIndex + 1 < CommandLine.arguments.count, outputIndex + 1 < CommandLine.arguments.count {
    NSApplication.shared.setActivationPolicy(.regular)
    record("probe mode args=\(CommandLine.arguments)")
    let probeAppearance = CommandLine.arguments[appearanceIndex + 1]
    let probeOutput = CommandLine.arguments[outputIndex + 1]
    // Probe after launch finishes: windows ordered in while the app is still launching stayed off the
    // window server's on-screen list (deep probe runs 39176734275, 39177216538).
    final class ProbeLaunchDelegate: NSObject, NSApplicationDelegate {
        let start: () -> Void
        init(start: @escaping () -> Void) { self.start = start }
        func applicationDidFinishLaunching(_ notification: Notification) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { self.start() }
        }
    }
    let probeDelegate = ProbeLaunchDelegate {
        do { try runProbes(appearance: probeAppearance, output: probeOutput); exit(0) }
        catch { record("probe pass failed: \(error)"); exit(1) }
    }
    NSApp.delegate = probeDelegate
    NSApp.run()
    _ = probeDelegate
}
let options = Options()
NSApplication.shared.setActivationPolicy(.regular)
NSApp.appearance = NSAppearance(named: options.appearance == "dark" ? .darkAqua : .aqua)
record("preflight screen capture access=\(CGPreflightScreenCaptureAccess())")
DispatchQueue.main.async {
    var batch: [Options] = [options]
    if let i = CommandLine.arguments.firstIndex(of: "--batch"), i + 1 < CommandLine.arguments.count {
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: CommandLine.arguments[i + 1]))
            let rows = try JSONSerialization.jsonObject(with: data) as? [[String: String]] ?? []
            batch = rows.map(Options.init)
        } catch { record("batch parse failed: \(error)"); exit(1) }
    }
    var failures = 0
    var previousWindow: NSWindow?
    func advance(_ index: Int) {
        if index == batch.count {
            record("batch finished cases=\(batch.count) failures=\(failures)")
            exit(failures == 0 ? 0 : 1)
        }
        let item = batch[index]
        do {
            NSApp.appearance = NSAppearance(named: item.appearance == "dark" ? .darkAqua : .aqua)
            let session = try CaptureSession(options: item)
            do {
                try session.run()
                let imageFailures = session.results.filter { ($0["success"] as? Bool) != true }
                try? (imageFailures.isEmpty ? "SUCCESS" : "FAIL").write(to: session.folder.appendingPathComponent("status.txt"), atomically: true, encoding: .utf8)
                if !imageFailures.isEmpty { failures += 1 }
            } catch {
                record("fatal case \(item.scenario) \(item.appearance) \(item.background): \(error)")
                session.recordFailure(error)
                try? "FAIL: \(error)".write(to: session.folder.appendingPathComponent("status.txt"), atomically: true, encoding: .utf8)
                failures += 1
            }
            // Keep one window alive while the next case activates. On hosted
            // WindowServer, closing the last window deactivates this app.
            previousWindow?.close()
            previousWindow = session.window
        } catch {
            record("case setup failed: \(error)")
            let folder = URL(fileURLWithPath: item.out, isDirectory: true)
                .appendingPathComponent(item.scenario)
                .appendingPathComponent("\(item.appearance)-\(item.accent)-\(item.size)-\(item.state)-\(item.interaction)\(item.accessibility == "default" ? "" : "-\(item.accessibility)")")
                .appendingPathComponent(item.background)
            try? FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
            try? writeJSON([["scenario": item.scenario, "size": item.size, "state": item.state,
                             "interaction": item.interaction,
                             "appearance": item.appearance, "accent": item.accent,
                             "accessibility_axis": item.accessibility,
                             "background": item.background, "phase": "setup-error", "success": false,
                             "capture_method": "none", "error": String(describing: error)]],
                           to: folder.appendingPathComponent("manifest-part.json"))
            failures += 1
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { advance(index + 1) }
    }
    advance(0)
}
NSApp.run()
