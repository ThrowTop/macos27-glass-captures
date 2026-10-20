import AppKit
import QuartzCore
import ScreenCaptureKit
import SafeKVC
import CoreGraphics
import Darwin
import SwiftUI

private final class OutlineSolidView: NSView {
    var color: NSColor = .white
    override func draw(_ dirtyRect: NSRect) {
        color.setFill()
        bounds.fill()
    }
}

private final class OutlinePatternView: NSView {
    var kind = "plain"
    override func draw(_ dirtyRect: NSRect) {
        if kind == "photo", let url = Bundle.main.url(forResource: "photo", withExtension: "png"),
           let image = NSImage(contentsOf: url) {
            image.draw(in: bounds, from: .zero, operation: .sourceOver, fraction: 1)
            return
        }
        if kind == "checker8" || kind == "photo" {
            NSColor.white.setFill(); bounds.fill()
            NSColor.black.setFill()
            for y in stride(from: CGFloat(0), to: bounds.height, by: 8) {
                for x in stride(from: CGFloat(0), to: bounds.width, by: 8)
                    where (Int(x / 8) + Int(y / 8)) % 2 == 0 {
                    CGRect(x: x, y: y, width: 8, height: 8).fill()
                }
            }
        } else {
            NSColor.windowBackgroundColor.setFill(); bounds.fill()
        }
    }
}

private struct OutlinePickerProbeView: View {
    @State private var choice = "English"
    var body: some View {
        Picker("Captions", selection: $choice) {
            Text("English").tag("English")
            Text("Swedish").tag("Swedish")
            Text("German").tag("German")
        }
        .pickerStyle(.menu)
    }
}

private struct OutlineMenuButtonProbeView: View {
    var body: some View {
        Menu("Captions") {
            Button("English") {}
            Button("Swedish") {}
            Menu("More languages") {
                Button("German") {}
                Button("French") {}
            }
        }
    }
}

private final class OutlineBox<T> {
    var value: T
    init(_ value: T) { self.value = value }
}

private func outlineWrite(_ image: CGImage, _ url: URL) -> Bool {
    writePNG(image, to: url)
}

private func outlineCaptureDisplay(_ rect: CGRect, _ url: URL) -> [String: Any] {
    let screens = NSScreen.screens
    guard let screen = screens.first else { return ["error": "no NSScreen"] }
    let screenFrame = screen.frame
    let semaphore = DispatchSemaphore(value: 0)
    let image = OutlineBox<CGImage?>(nil)
    let failure = OutlineBox<String?>(nil)
    let excludedNames = OutlineBox<[String]>([])
    let visibleNames = OutlineBox<[String]>([])
    Task.detached {
        do {
            let content = try await SCShareableContent.current
            guard let display = content.displays.first else {
                throw NSError(domain: "MenuOutline", code: 1,
                              userInfo: [NSLocalizedDescriptionKey: "ScreenCaptureKit returned no display"])
            }
            let names = content.windows.map { window in
                "\(window.owningApplication?.applicationName ?? "unknown"): \(window.title ?? "")"
            }
            visibleNames.value = names
            let excluded = content.windows.filter { window in
                let title = (window.title ?? "").lowercased()
                let owner = (window.owningApplication?.applicationName ?? "").lowercased()
                return owner.contains("usernotificationcenter") ||
                    owner.contains("universalaccessauthwarn") ||
                    title.contains("private window picker") ||
                    title.contains("screen and audio") || title.contains("screen recording") ||
                    title.contains("device control and data access")
            }
            excludedNames.value = excluded.map {
                "\($0.owningApplication?.applicationName ?? "unknown"): \($0.title ?? "")"
            }
            let filter = SCContentFilter(display: display, excludingWindows: excluded)
            let configuration = SCStreamConfiguration()
            configuration.width = display.width
            configuration.height = display.height
            configuration.showsCursor = false
            configuration.ignoreShadowsDisplay = false
            image.value = try await SCScreenshotManager.captureImage(contentFilter: filter,
                                                                      configuration: configuration)
        } catch { failure.value = String(describing: error) }
        semaphore.signal()
    }
    guard semaphore.wait(timeout: .now() + 12) == .success, let full = image.value else {
        return ["error": failure.value ?? "ScreenCaptureKit display capture timed out"]
    }
    let scale = CGFloat(full.width) / screenFrame.width
    let clippedRect = rect.intersection(screenFrame)
    let crop = CGRect(x: floor((clippedRect.minX - screenFrame.minX) * scale),
                      y: floor((screenFrame.maxY - clippedRect.maxY) * scale),
                      width: ceil(clippedRect.width * scale),
                      height: ceil(clippedRect.height * scale))
    guard let clipped = full.cropping(to: crop) else {
        return ["error": "display crop failed: \(crop)"]
    }
    return ["file": url.lastPathComponent, "written": outlineWrite(clipped, url),
            "scale": scale, "cropScreenRect": probeRect(clippedRect), "cropPixels": probeRect(crop),
            "imagePixels": ["width": clipped.width, "height": clipped.height],
            "excludedSystemWindows": excludedNames.value,
            "visibleWindowTitles": visibleNames.value]
}

private func outlineCaptureSingleWindow(_ window: NSWindow, _ url: URL) -> [String: Any] {
    let semaphore = DispatchSemaphore(value: 0)
    let image = OutlineBox<CGImage?>(nil)
    let failure = OutlineBox<String?>(nil)
    let number = CGWindowID(window.windowNumber)
    let windowSize = window.frame.size
    let scale = NSScreen.main?.backingScaleFactor ?? 1
    let shadowPadding: CGFloat = window.hasShadow ? 112 : 0
    Task.detached {
        do {
            let content = try await SCShareableContent.current
            guard let source = content.windows.first(where: { $0.windowID == number }) else {
                throw NSError(domain: "MenuOutline", code: 2,
                              userInfo: [NSLocalizedDescriptionKey: "window \(number) absent from ScreenCaptureKit list"])
            }
            let filter = SCContentFilter(desktopIndependentWindow: source)
            let configuration = SCStreamConfiguration()
            // The window-style filter returns framing effects in addition to the frame.
            // A 56 pt allowance on each side matches the runner's legacy framing extent.
            configuration.width = max(1, Int(ceil((windowSize.width + shadowPadding) * scale)))
            configuration.height = max(1, Int(ceil((windowSize.height + shadowPadding) * scale)))
            configuration.showsCursor = false
            configuration.shouldBeOpaque = false
            configuration.ignoreShadowsSingleWindow = false
            image.value = try await SCScreenshotManager.captureImage(contentFilter: filter,
                                                                      configuration: configuration)
        } catch { failure.value = String(describing: error) }
        semaphore.signal()
    }
    guard semaphore.wait(timeout: .now() + 12) == .success, let captured = image.value else {
        return ["error": failure.value ?? "ScreenCaptureKit window capture timed out"]
    }
    return ["file": url.lastPathComponent, "written": outlineWrite(captured, url),
            "imagePixels": ["width": captured.width, "height": captured.height],
            "alphaExtrema": outlineAlphaExtrema(captured)]
}

private func outlineAlphaExtrema(_ image: CGImage) -> [Int] {
    var bytes = [UInt8](repeating: 0, count: image.width * image.height * 4)
    let drew = bytes.withUnsafeMutableBytes { raw -> Bool in
        guard let context = CGContext(data: raw.baseAddress, width: image.width, height: image.height,
                                      bitsPerComponent: 8, bytesPerRow: image.width * 4,
                                      space: CGColorSpaceCreateDeviceRGB(),
                                      bitmapInfo: CGBitmapInfo.byteOrder32Big.rawValue |
                                        CGImageAlphaInfo.premultipliedLast.rawValue) else { return false }
        context.draw(image, in: CGRect(x: 0, y: 0, width: image.width, height: image.height))
        return true
    }
    guard drew else { return [] }
    var low = 255, high = 0
    for index in stride(from: 3, to: bytes.count, by: 4) {
        let value = Int(bytes[index])
        low = min(low, value); high = max(high, value)
    }
    return [low, high]
}

private func outlineSafeValue(_ value: Any?) -> Any {
    safeDescription(value) ?? NSNull()
}

private func outlineKVC(_ object: AnyObject, _ key: String) -> Any {
    if let value = SafeValueForKey(object, key) { return ["value": outlineSafeValue(value)] }
    var error: NSString?
    let result = SafeInvoke({ object.value(forKey: key) }, &error)
    if let error { return ["error": error as String] }
    return ["value": outlineSafeValue(result)]
}

private func outlineLayerTree(_ layer: CALayer, depth: Int = 0) -> [String: Any] {
    var entry: [String: Any] = [
        "class": NSStringFromClass(type(of: layer)),
        "frame": probeRect(layer.frame), "bounds": probeRect(layer.bounds),
        "cornerRadius": layer.cornerRadius, "borderWidth": layer.borderWidth,
        "opacity": layer.opacity, "isHidden": layer.isHidden,
        "filters": safeDescription(layer.filters) ?? NSNull(),
        "backgroundFilters": safeDescription(layer.backgroundFilters) ?? NSNull(),
        "compositingFilter": safeDescription(layer.compositingFilter) ?? NSNull(),
        "sublayers": []
    ]
    entry["borderColor"] = layer.borderColor.flatMap { safeDescription($0) } ?? NSNull()
    if depth < 14 {
        entry["sublayers"] = (layer.sublayers ?? []).map { outlineLayerTree($0, depth: depth + 1) }
    }
    return entry
}

private func outlineGlassLayers(_ layer: CALayer, into entries: inout [[String: Any]], depth: Int = 0) {
    let cls = NSStringFromClass(type(of: layer))
    if ["Glass", "SDF", "Backdrop", "Portal"].contains(where: cls.contains) {
        entries.append(["class": cls, "frame": probeRect(layer.frame), "bounds": probeRect(layer.bounds),
                        "cornerRadius": layer.cornerRadius, "borderWidth": layer.borderWidth,
                        "borderColor": layer.borderColor.flatMap { safeDescription($0) } ?? NSNull(),
                        "filters": safeDescription(layer.filters) ?? NSNull(),
                        "backgroundFilters": safeDescription(layer.backgroundFilters) ?? NSNull()])
    }
    guard depth < 14 else { return }
    for child in layer.sublayers ?? [] { outlineGlassLayers(child, into: &entries, depth: depth + 1) }
}

private func outlineRuntimeDump(_ window: NSWindow) -> [String: Any] {
    let selector = NSSelectorFromString("shadowParameters")
    var shadowError: NSString?
    let shadowValue: Any?
    if window.responds(to: selector) {
        shadowValue = SafeInvoke({ window.perform(selector)?.takeUnretainedValue() }, &shadowError)
    } else {
        shadowValue = nil
    }
    let glassSelector = NSSelectorFromString("_NSMenuUseGlassWindowStyle")
    var glassError: NSString?
    var glassResult: Any = ["reachable": false]
    let menuClassObject = NSMenu.self as AnyObject
    if let menuClass = menuClassObject as? NSObject, menuClass.responds(to: glassSelector) {
        let object = SafeInvoke({ menuClass.perform(glassSelector)?.takeUnretainedValue() }, &glassError)
        glassResult = ["reachable": true, "value": outlineSafeValue(object)]
    } else if window.responds(to: glassSelector) {
        let object = SafeInvoke({ window.perform(glassSelector)?.takeUnretainedValue() }, &glassError)
        glassResult = ["reachable": true, "value": outlineSafeValue(object)]
    }
    let shadowJSON: Any
    if let shadowError { shadowJSON = ["error": shadowError as String] }
    else if let shadowValue { shadowJSON = outlineSafeValue(shadowValue) }
    else { shadowJSON = NSNull() }
    if let glassError { glassResult = ["reachable": true, "error": glassError as String] }
    let tree = window.contentView?.superview?.layer ?? window.contentView?.layer
    let contentScreen = window.contentView.map {
        window.convertToScreen($0.convert($0.bounds, to: nil))
    }
    let expectedContentScreen = window.contentRect(forFrameRect: window.frame)
    let contentFills = contentScreen.map {
        abs($0.minX - expectedContentScreen.minX) < 0.5 &&
        abs($0.minY - expectedContentScreen.minY) < 0.5 &&
        abs($0.width - expectedContentScreen.width) < 0.5 &&
        abs($0.height - expectedContentScreen.height) < 0.5
    } ?? false
    var glassLayers: [[String: Any]] = []
    if let tree { outlineGlassLayers(tree, into: &glassLayers) }
    let rootBounds = tree.map { $0.bounds } ?? .zero
    let glassViewFills = glassLayers.isEmpty ? NSNull() as Any : glassLayers.contains { entry in
        guard let frame = entry["frame"] as? [String: CGFloat] else { return false }
        return abs((frame["x"] ?? 0) - rootBounds.minX) < 0.5 &&
            abs((frame["y"] ?? 0) - rootBounds.minY) < 0.5 &&
            abs((frame["width"] ?? 0) - rootBounds.width) < 0.5 &&
            abs((frame["height"] ?? 0) - rootBounds.height) < 0.5
    }
    return [
        "windowNumber": window.windowNumber,
        "class": NSStringFromClass(type(of: window)),
        "frame": probeRect(window.frame),
        "windowLevel": window.level.rawValue,
        "isKeyWindow": window.isKeyWindow,
        "isMainWindow": window.isMainWindow,
        "effectiveAppearance": window.effectiveAppearance.name.rawValue,
        "hasShadow": window.hasShadow,
        "shadowOptions": outlineKVC(window, "shadowOptions"),
        "shadowParameters": shadowJSON,
        "_NSMenuUseGlassWindowStyle": glassResult,
        "isOpaque": window.isOpaque,
        "backgroundColor": outlineSafeValue(window.backgroundColor),
        "contentViewBounds": window.contentView.map { probeRect($0.bounds) } as Any? ?? NSNull(),
        "contentViewFrameInWindow": window.contentView.map { probeRect($0.convert($0.bounds, to: nil)) } as Any? ?? NSNull(),
        "contentViewFrameScreen": contentScreen.map { probeRect($0) } as Any? ?? NSNull(),
        "expectedContentFrameScreen": probeRect(expectedContentScreen),
        "contentViewFillsWindowContentArea": contentFills,
        "glassRelatedLayers": glassLayers,
        "glassViewFillsWindowExactly": glassViewFills,
        "topLayerTree": tree.map { outlineLayerTree($0) as Any } ?? NSNull()
    ]
}

private func outlineCGWindowImage(_ window: NSWindow, _ url: URL) -> [String: Any] {
    typealias LegacyCGWindowListCreateImage = @convention(c) (CGRect, UInt32, UInt32, UInt32) -> Unmanaged<CGImage>?
    guard let library = dlopen("/System/Library/Frameworks/CoreGraphics.framework/CoreGraphics", RTLD_LAZY),
          let symbol = dlsym(library, "CGWindowListCreateImage") else {
        return ["error": "CGWindowListCreateImage symbol unavailable in CoreGraphics"]
    }
    let capture = unsafeBitCast(symbol, to: LegacyCGWindowListCreateImage.self)
    guard let image = capture(.null, CGWindowListOption.optionIncludingWindow.rawValue,
                              CGWindowID(window.windowNumber), CGWindowImageOption.bestResolution.rawValue)?
        .takeRetainedValue() else {
        return ["error": "CGWindowListCreateImage returned nil"]
    }
    return ["file": url.lastPathComponent, "written": outlineWrite(image, url),
            "imagePixels": ["width": image.width, "height": image.height],
            "alphaExtrema": outlineAlphaExtrema(image)]
}

private func outlineMenuWindows(excluding baseline: Set<Int>) -> [NSWindow] {
    NSApp.windows.filter { $0.isVisible && !baseline.contains($0.windowNumber) }
}

private func outlineMouseEvent(_ type: NSEvent.EventType, window: NSWindow, point: CGPoint) -> NSEvent? {
    NSEvent.mouseEvent(with: type, location: point, modifierFlags: [],
                       timestamp: ProcessInfo.processInfo.systemUptime,
                       windowNumber: window.windowNumber, context: nil, eventNumber: 0,
                       clickCount: 1, pressure: type == .leftMouseUp ? 0 : 1)
}

private func outlineSendMouse(_ type: NSEvent.EventType, window: NSWindow, point: CGPoint) {
    guard let event = outlineMouseEvent(type, window: window, point: point) else { return }
    NSApp.postEvent(event, atStart: false)
}

private func outlineSendEscape(to window: NSWindow) {
    guard let event = NSEvent.keyEvent(with: .keyDown, location: .zero, modifierFlags: [],
                                       timestamp: ProcessInfo.processInfo.systemUptime,
                                       windowNumber: window.windowNumber, context: nil,
                                       characters: "\u{1b}", charactersIgnoringModifiers: "\u{1b}",
                                       isARepeat: false, keyCode: 53) else { return }
    window.sendEvent(event)
}

private func outlineMenuRowCenters(_ view: NSView, into centers: inout [CGPoint]) {
    let name = NSStringFromClass(type(of: view))
    let frame = view.convert(view.bounds, to: nil)
    if (name.contains("MenuItem") || name.contains("TableRow")) &&
        frame.height >= 12 && frame.height <= 44 && frame.width > 60 {
        centers.append(CGPoint(x: frame.midX, y: frame.midY))
    }
    for child in view.subviews { outlineMenuRowCenters(child, into: &centers) }
}

private func outlineHoverFirstMenuItem(_ window: NSWindow) {
    guard let content = window.contentView?.superview ?? window.contentView else { return }
    var centers: [CGPoint] = []
    outlineMenuRowCenters(content, into: &centers)
    guard let point = centers.first else { return }
    let screenPoint = window.convertToScreen(CGRect(origin: point, size: .zero)).origin
    let cgPoint = CGPoint(x: screenPoint.x, y: (NSScreen.main?.frame.maxY ?? 768) - screenPoint.y)
    CGWarpMouseCursorPosition(cgPoint)
    CGEvent(mouseEventSource: nil, mouseType: .mouseMoved, mouseCursorPosition: cgPoint,
            mouseButton: .left)?.post(tap: .cghidEventTap)
}

private func outlineCaptureMenuWindowSet(source: String, attempt: Int, appearance: String,
                                         background: String, host: NSWindow,
                                         menuWindows: [NSWindow], folder: URL) throws -> [String: Any] {
    guard !menuWindows.isEmpty else { throw NSError(domain: "MenuOutline", code: 3,
        userInfo: [NSLocalizedDescriptionKey: "no visible menu windows to capture"]) }
    var union = CGRect.null
    for menuWindow in menuWindows { union = union.union(menuWindow.frame) }
    let displayRect = union.insetBy(dx: -56, dy: -56)
    let display = outlineCaptureDisplay(displayRect, folder.appendingPathComponent("attempt-\(attempt)-display.png"))
    var captures: [[String: Any]] = []
    var windows: [[String: Any]] = []
    for (index, menuWindow) in menuWindows.enumerated() {
        let runtimeName = "attempt-\(attempt)-runtime-\(index).json"
        let runtime = outlineRuntimeDump(menuWindow)
        try writeJSON(runtime, to: folder.appendingPathComponent(runtimeName))
        let name = "menu-window-\(index)"
        let displayCapture: [String: Any] = [
            "window": name, "method": "display", "file": display["file"] ?? NSNull(),
            "error": display["error"] ?? NSNull(), "shapeFrame": probeRect(menuWindow.frame),
            "cropScreenRect": display["cropScreenRect"] ?? NSNull(),
            "scale": display["scale"] ?? host.backingScaleFactor,
            "imagePixels": display["imagePixels"] ?? NSNull(), "runtime": runtimeName,
            "pixelScale": host.backingScaleFactor, "windowState": "active"
        ]
        captures.append(displayCapture)
        let singleName = "attempt-\(attempt)-window-\(index)-single.png"
        var single = outlineCaptureSingleWindow(menuWindow, folder.appendingPathComponent(singleName))
        single["window"] = name; single["method"] = "single-window"
        single["shapeFrame"] = probeRect(menuWindow.frame); single["runtime"] = runtimeName
        single["pixelScale"] = host.backingScaleFactor; single["windowState"] = "active"
        captures.append(single)
        let cgName = "attempt-\(attempt)-window-\(index)-cgwindow.png"
        var cg = outlineCGWindowImage(menuWindow, folder.appendingPathComponent(cgName))
        cg["window"] = name; cg["method"] = "cgwindow"
        cg["shapeFrame"] = probeRect(menuWindow.frame); cg["runtime"] = runtimeName
        cg["pixelScale"] = host.backingScaleFactor; cg["windowState"] = "active"
        captures.append(cg)
        windows.append(["name": name, "runtime": runtimeName,
                        "windowNumber": menuWindow.windowNumber,
                        "class": NSStringFromClass(type(of: menuWindow)),
                        "frame": probeRect(menuWindow.frame)])
    }
    let hostRuntimeName = "attempt-\(attempt)-host-runtime.json"
    try writeJSON(outlineRuntimeDump(host), to: folder.appendingPathComponent(hostRuntimeName))
    return ["attempt": attempt, "appearance": appearance, "background": background,
            "source": source, "opened": true, "menuWindows": windows,
            "hostRuntime": hostRuntimeName, "displayRect": probeRect(displayRect),
            "captures": captures]
}

private func outlineRunMenuCase(source: String, appearance: String, background: String,
                                output: URL) throws {
    let folder = output.appendingPathComponent("menus/\(appearance)/\(background)/\(source)",
                                               isDirectory: true)
    try FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
    record("menu-outline begin source=\(source) pass=\(appearance) background=\(background)")
    let screen = NSScreen.main?.frame ?? CGRect(x: 0, y: 0, width: 1024, height: 768)
    let hostFrame = CGRect(x: screen.midX - 360, y: screen.midY - 270, width: 720, height: 540)
    let host = NSWindow(contentRect: hostFrame, styleMask: [.titled, .closable], backing: .buffered, defer: false)
    host.isReleasedWhenClosed = false
    host.title = "Menu outline \(source) \(background)"
    host.appearance = NSAppearance(named: appearance.hasPrefix("dark") ? .darkAqua : .aqua)
    host.backgroundColor = .windowBackgroundColor
    host.hasShadow = true
    let root = OutlinePatternView(frame: CGRect(origin: .zero, size: hostFrame.size))
    root.kind = background
    root.wantsLayer = true
    root.autoresizingMask = [.width, .height]
    host.contentView = root
    host.makeKeyAndOrderFront(nil)
    host.orderFrontRegardless()
    NSApp.activate(ignoringOtherApps: true)
    RunLoop.main.run(until: Date().addingTimeInterval(0.25))

    var nativeMenu: NSMenu?
    var clickPoint: CGPoint?
    var presenter: (() -> Void)?
    var submenu = false
    var control: NSView?
    let controlFrame = CGRect(x: 245, y: 265, width: 230, height: 40)

    switch source {
    case "appkit-popup", "appkit-pulldown", "submenu":
        let pullsDown = source == "appkit-pulldown"
        let button = NSPopUpButton(frame: controlFrame, pullsDown: pullsDown)
        button.controlSize = .regular
        button.font = .systemFont(ofSize: NSFont.systemFontSize(for: .regular))
        if pullsDown {
            button.addItem(withTitle: "Actions")
            button.addItems(withTitles: ["Duplicate", "Rename", "Move to Trash"])
        } else {
            button.addItems(withTitles: ["English", "Swedish", "German", "French"])
            button.selectItem(at: 0)
        }
        if source == "submenu", let menu = button.menu, let parent = menu.item(at: 0) {
            let child = NSMenu(title: "Caption language")
            for title in ["English", "Swedish", "German"] {
                child.addItem(withTitle: title, action: nil, keyEquivalent: "")
            }
            menu.setSubmenu(child, for: parent)
            submenu = true
        }
        root.addSubview(button); control = button; nativeMenu = button.menu
        presenter = { button.performClick(nil) }
    case "context":
        let anchor = NSView(frame: CGRect(x: 350, y: 270, width: 24, height: 24))
        root.addSubview(anchor); control = anchor
        let menu = NSMenu(title: "Context outline")
        menu.addItem(withTitle: "Open", action: nil, keyEquivalent: "")
        menu.addItem(withTitle: "Share", action: nil, keyEquivalent: "")
        menu.addItem(NSMenuItem.separator())
        menu.addItem(withTitle: "Quick Look", action: nil, keyEquivalent: "")
        nativeMenu = menu
        let point = anchor.convert(CGPoint(x: anchor.bounds.midX, y: anchor.bounds.midY), to: nil)
        let event = NSEvent.mouseEvent(with: .rightMouseDown, location: point, modifierFlags: [],
                                       timestamp: ProcessInfo.processInfo.systemUptime,
                                       windowNumber: host.windowNumber, context: nil,
                                       eventNumber: 0, clickCount: 1, pressure: 1)
        presenter = { if let event { NSMenu.popUpContextMenu(menu, with: event, for: anchor) } }
    case "swiftui-picker":
        let hosting = NSHostingView(rootView: OutlinePickerProbeView())
        let fit = hosting.fittingSize
        hosting.frame = CGRect(x: (hostFrame.width - fit.width) / 2,
                               y: (hostFrame.height - fit.height) / 2,
                               width: fit.width, height: fit.height)
        root.addSubview(hosting); control = hosting
        clickPoint = hosting.convert(CGPoint(x: hosting.bounds.midX, y: hosting.bounds.midY), to: nil)
    case "swiftui-menu":
        let hosting = NSHostingView(rootView: OutlineMenuButtonProbeView())
        let fit = hosting.fittingSize
        hosting.frame = CGRect(x: (hostFrame.width - fit.width) / 2,
                               y: (hostFrame.height - fit.height) / 2,
                               width: fit.width, height: fit.height)
        root.addSubview(hosting); control = hosting
        clickPoint = hosting.convert(CGPoint(x: hosting.bounds.midX, y: hosting.bounds.midY), to: nil)
    case "combobox":
        let combo = NSComboBox(frame: controlFrame)
        combo.addItems(withObjectValues: ["English", "Swedish", "German", "French"])
        combo.isEditable = false
        combo.selectItem(at: 0)
        root.addSubview(combo); control = combo
        clickPoint = combo.convert(CGPoint(x: combo.bounds.maxX - 12, y: combo.bounds.midY), to: nil)
    default:
        host.close()
        throw NSError(domain: "MenuOutline", code: 4,
                      userInfo: [NSLocalizedDescriptionKey: "unknown menu source \(source)"])
    }
    host.displayIfNeeded()
    if let control { control.displayIfNeeded() }

    var attempts: [[String: Any]] = []
    var final: [String: Any] = [:]
    var didOpen = false
    let caseURL = folder.appendingPathComponent("case.json")
    func writeProgress(_ error: Any = "menu-open probe in progress") throws {
        try writeJSON(["stage": "menus", "source": source, "appearance": appearance,
                       "background": background, "opened": false, "attempts": attempts,
                       "menuWindows": final["menuWindows"] ?? [], "hostRuntime": final["hostRuntime"] ?? NSNull(),
                       "captures": final["captures"] ?? [], "openError": error], to: caseURL)
    }
    try writeProgress()
    for attempt in 1...3 where !didOpen {
        record("menu-outline attempt begin source=\(source) pass=\(appearance) background=\(background) attempt=\(attempt)")
        let progressIndex = attempts.count
        attempts.append(["attempt": attempt, "opened": false, "error": "attempt in progress"])
        try writeProgress("attempt \(attempt) in progress")
        let baseline = Set(NSApp.windows.map { $0.windowNumber })
        let attemptResult = OutlineBox<[String: Any]?>(nil)
        let hover = Timer(timeInterval: 0.55, repeats: false) { _ in
            if submenu, let menuWindow = outlineMenuWindows(excluding: baseline).first {
                outlineHoverFirstMenuItem(menuWindow)
            }
        }
        let captureTimer = Timer(timeInterval: submenu ? 1.0 : 0.7, repeats: false) { _ in
            let menuWindows = outlineMenuWindows(excluding: baseline)
            if !menuWindows.isEmpty {
                do {
                    attemptResult.value = try outlineCaptureMenuWindowSet(
                        source: source, attempt: attempt, appearance: appearance, background: background,
                        host: host, menuWindows: menuWindows, folder: folder)
                } catch { attemptResult.value = ["attempt": attempt, "opened": true, "error": String(describing: error)] }
            } else {
                attemptResult.value = ["attempt": attempt, "opened": false,
                                       "error": "no visible menu window during tracking"]
            }
            if let nativeMenu { nativeMenu.cancelTracking() }
            else {
                for menuWindow in outlineMenuWindows(excluding: baseline) { outlineSendEscape(to: menuWindow) }
                outlineSendEscape(to: NSApp.keyWindow ?? host)
            }
            for menuWindow in outlineMenuWindows(excluding: baseline) { menuWindow.orderOut(nil) }
        }
        let fallback = Timer(timeInterval: 10, repeats: false) { _ in
            if let nativeMenu { nativeMenu.cancelTrackingWithoutAnimation() }
            else {
                for menuWindow in outlineMenuWindows(excluding: baseline) { outlineSendEscape(to: menuWindow) }
                outlineSendEscape(to: NSApp.keyWindow ?? host)
            }
        }
        for timer in [hover, captureTimer, fallback] {
            RunLoop.main.add(timer, forMode: .eventTracking)
            RunLoop.main.add(timer, forMode: .common)
        }
        if let point = clickPoint {
            let mouseUp = Timer(timeInterval: 0.12, repeats: false) { _ in
                record("menu-outline post mouseUp source=\(source) pass=\(appearance) background=\(background)")
                outlineSendMouse(.leftMouseUp, window: host, point: point)
            }
            RunLoop.main.add(mouseUp, forMode: .eventTracking)
            RunLoop.main.add(mouseUp, forMode: .common)
            record("menu-outline post mouseDown source=\(source) pass=\(appearance) background=\(background)")
            outlineSendMouse(.leftMouseDown, window: host, point: point)
        } else { presenter?() }
        if attemptResult.value == nil {
            RunLoop.main.run(until: Date().addingTimeInterval(2.0))
        }
        [hover, captureTimer, fallback].forEach { $0.invalidate() }
        if let result = attemptResult.value {
            attempts[progressIndex] = result
            final = result
            didOpen = (result["opened"] as? Bool) == true && result["captures"] != nil
        } else {
            attempts[progressIndex] = ["attempt": attempt, "opened": false,
                                       "error": "tracking callback did not produce a capture result"]
        }
        try writeProgress(didOpen ? NSNull() : (attempts.last?["error"] ?? "menu did not open after three attempts"))
        record("menu-outline attempt end source=\(source) pass=\(appearance) background=\(background) attempt=\(attempt) opened=\(didOpen)")
    }

    let caseEntry: [String: Any] = [
        "stage": "menus", "source": source, "appearance": appearance,
        "background": background, "opened": didOpen, "attempts": attempts,
        "menuWindows": final["menuWindows"] ?? [], "hostRuntime": final["hostRuntime"] ?? NSNull(),
        "captures": final["captures"] ?? [], "openError": didOpen ? NSNull() :
            (attempts.last?["error"] ?? "menu did not open after three attempts")
    ]
    try writeJSON(caseEntry, to: caseURL)
    record("menu-outline source=\(source) pass=\(appearance) background=\(background) opened=\(didOpen)")
    host.close()
}

private func outlineCaptureNormalWindow(_ window: NSWindow, background: String, output: URL,
                                       pass: String) throws {
    let folder = output.appendingPathComponent("step1/\(pass)/\(background)", isDirectory: true)
    try FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
    let screen = NSScreen.main?.frame ?? CGRect(x: 0, y: 0, width: 1440, height: 900)
    let displayRect = window.frame.insetBy(dx: -64, dy: -64).intersection(screen)
    let display = outlineCaptureDisplay(displayRect, folder.appendingPathComponent("display.png"))
    let single = outlineCaptureSingleWindow(window, folder.appendingPathComponent("single-window.png"))
    let cg = outlineCGWindowImage(window, folder.appendingPathComponent("cgwindow.png"))
    let runtime = outlineRuntimeDump(window)
    try writeJSON(runtime, to: folder.appendingPathComponent("runtime.json"))
    let entry: [String: Any] = [
        "stage": "step1", "appearance": pass, "backdrop": background,
        "shape": "normal titled NSWindow", "windowFrame": probeRect(window.frame),
        "windowState": "active",
        "pixelScale": window.backingScaleFactor,
        "display": display, "singleWindow": single, "cgWindow": cg,
        "runtime": "runtime.json"
    ]
    try writeJSON(entry, to: folder.appendingPathComponent("case.json"))
    record("menu-outline step1 \(pass)/\(background) display=\(display["error"] ?? "ok") single=\(single["error"] ?? "ok") cg=\(cg["error"] ?? "ok")")
}

func runMenuOutlineWindowProbe(appearance: String, output path: String) throws {
    let output = URL(fileURLWithPath: path, isDirectory: true)
    NSApp.appearance = NSAppearance(named: appearance.hasPrefix("dark") ? .darkAqua : .aqua)
    let screen = NSScreen.main?.frame ?? CGRect(x: 0, y: 0, width: 1440, height: 900)
    for colorName in ["white", "black"] {
        let color: NSColor = colorName == "white" ? .white : .black
        let backdrop = NSWindow(contentRect: screen, styleMask: .borderless, backing: .buffered, defer: false)
        backdrop.isReleasedWhenClosed = false
        backdrop.backgroundColor = color
        backdrop.hasShadow = false
        let fill = OutlineSolidView(frame: CGRect(origin: .zero, size: screen.size))
        fill.color = color
        fill.wantsLayer = true
        backdrop.contentView = fill
        backdrop.level = .normal
        backdrop.orderFrontRegardless()

        let frame = CGRect(x: screen.midX - 320, y: screen.midY - 230, width: 640, height: 460)
        let window = NSWindow(contentRect: frame, styleMask: [.titled, .closable, .miniaturizable, .resizable],
                              backing: .buffered, defer: false)
        window.isReleasedWhenClosed = false
        window.title = "Window effects probe \(colorName)"
        window.backgroundColor = colorName == "white" ? .black : .white
        window.hasShadow = true
        window.appearance = NSAppearance(named: appearance.hasPrefix("dark") ? .darkAqua : .aqua)
        let content = OutlineSolidView(frame: CGRect(origin: .zero, size: frame.size))
        content.autoresizingMask = [.width, .height]
        content.wantsLayer = true
        content.color = colorName == "white" ? .black : .white
        window.contentView = content
        window.makeKeyAndOrderFront(nil)
        window.orderFrontRegardless()
        NSApp.activate(ignoringOtherApps: true)
        RunLoop.main.run(until: Date().addingTimeInterval(0.35))
        try outlineCaptureNormalWindow(window, background: colorName, output: output, pass: appearance)
        window.close(); backdrop.close()
    }
}

private func outlineCaptureWindowContour(appearance: String, background: String, state: String,
                                         output: URL) throws {
    let folder = output.appendingPathComponent("window-contour/\(appearance)/\(background)/\(state)",
                                               isDirectory: true)
    try FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
    let screen = NSScreen.main?.frame ?? CGRect(x: 0, y: 0, width: 1440, height: 900)
    let backdropColor: NSColor = background == "white" ? .white : .black
    let backdrop = NSWindow(contentRect: screen, styleMask: .borderless, backing: .buffered, defer: false)
    backdrop.isReleasedWhenClosed = false
    backdrop.backgroundColor = backdropColor
    backdrop.hasShadow = false
    let backfill = OutlineSolidView(frame: CGRect(origin: .zero, size: screen.size))
    backfill.color = backdropColor; backfill.wantsLayer = true
    backdrop.contentView = backfill
    backdrop.orderFrontRegardless()

    let frame = CGRect(x: screen.midX - 320, y: screen.midY - 230, width: 640, height: 460)
    let window = NSWindow(contentRect: frame, styleMask: [.titled, .closable, .miniaturizable, .resizable],
                          backing: .buffered, defer: false)
    window.isReleasedWhenClosed = false
    window.title = "Window contour \(state) \(background)"
    window.backgroundColor = background == "white" ? .black : .white
    window.hasShadow = true
    window.appearance = NSAppearance(named: appearance.hasPrefix("dark") ? .darkAqua : .aqua)
    let content = OutlineSolidView(frame: CGRect(origin: .zero, size: frame.size))
    content.autoresizingMask = [.width, .height]
    content.wantsLayer = true
    content.color = background == "white" ? .black : .white
    window.contentView = content
    window.makeKeyAndOrderFront(nil)
    window.orderFrontRegardless()
    NSApp.activate(ignoringOtherApps: true)
    RunLoop.main.run(until: Date().addingTimeInterval(0.25))

    var sink: NSWindow?
    if state == "inactive" {
        let keyWindow = NSWindow(contentRect: CGRect(x: screen.minX + 20, y: screen.minY + 18,
                                                      width: 128, height: 64),
                                 styleMask: [.titled], backing: .buffered, defer: false)
        keyWindow.isReleasedWhenClosed = false
        keyWindow.title = "Key sink"
        keyWindow.hasShadow = false
        keyWindow.backgroundColor = .windowBackgroundColor
        keyWindow.makeKeyAndOrderFront(nil)
        window.orderFrontRegardless()
        sink = keyWindow
        RunLoop.main.run(until: Date().addingTimeInterval(0.2))
    }
    let displayRect = window.frame.insetBy(dx: -64, dy: -64).intersection(screen)
    let display = outlineCaptureDisplay(displayRect, folder.appendingPathComponent("display.png"))
    let single = outlineCaptureSingleWindow(window, folder.appendingPathComponent("single-window.png"))
    let cg = outlineCGWindowImage(window, folder.appendingPathComponent("cgwindow.png"))
    let runtime = outlineRuntimeDump(window)
    try writeJSON(runtime, to: folder.appendingPathComponent("runtime.json"))
    let entry: [String: Any] = [
        "stage": "window-contour", "appearance": appearance, "background": background,
        "windowState": state, "shape": "normal titled NSWindow", "windowFrame": probeRect(window.frame),
        "pixelScale": window.backingScaleFactor, "display": display,
        "singleWindow": single, "cgWindow": cg, "runtime": "runtime.json",
        "isKeyWindow": window.isKeyWindow
    ]
    try writeJSON(entry, to: folder.appendingPathComponent("case.json"))
    sink?.close(); window.close(); backdrop.close()
}

func runMenuOutlineProbe(appearance: String, output path: String,
                         menuFilter: String? = nil) throws {
    let output = URL(fileURLWithPath: path, isDirectory: true)
    NSApp.appearance = NSAppearance(named: appearance.hasPrefix("dark") ? .darkAqua : .aqua)
    if menuFilter == nil {
        try runMenuOutlineWindowProbe(appearance: appearance, output: path)
        for background in ["white", "black"] {
            for state in ["active", "inactive"] {
                try outlineCaptureWindowContour(appearance: appearance, background: background,
                                                state: state, output: output)
            }
        }
    }
    let menuCases: [(String, String)]
    if let menuFilter, menuFilter.contains(":") {
        let parts = menuFilter.split(separator: ":", maxSplits: 1).map(String.init)
        menuCases = parts.count == 2 ? [(parts[0], parts[1])] : []
    } else if menuFilter == "light-contrast-photo-missing" {
        menuCases = ["combobox", "submenu", "swiftui-menu", "swiftui-picker"].map { ("photo", $0) }
    } else {
        menuCases = ["plain", "photo"].flatMap { background in
            ["appkit-popup", "appkit-pulldown", "context", "swiftui-picker",
             "swiftui-menu", "combobox", "submenu"].map { (background, $0) }
        }
    }
    for (background, source) in menuCases {
            try outlineRunMenuCase(source: source, appearance: appearance,
                                   background: background, output: output)
    }
}

func runMenuOutlineSingleContourProbe(appearance: String, background: String, state: String,
                                      output path: String) throws {
    NSApp.appearance = NSAppearance(named: appearance.hasPrefix("dark") ? .darkAqua : .aqua)
    let output = URL(fileURLWithPath: path, isDirectory: true)
    try outlineCaptureWindowContour(appearance: appearance, background: background,
                                    state: state, output: output)
}


// Window silhouette per window style: per-window images keep the shadow and rims in the alpha, so the
// corner shape and radius can be read from them; the theme frame reports its own radius.
private final class WindowShapeToolbarDelegate: NSObject, NSToolbarDelegate {
    let item = NSToolbarItem.Identifier("probe.item")
    func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] { [item] }
    func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] { [item] }
    func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier identifier: NSToolbarItem.Identifier,
                 willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
        let entry = NSToolbarItem(itemIdentifier: identifier)
        entry.label = "Item"
        entry.image = NSImage(systemSymbolName: "square.and.arrow.up", accessibilityDescription: nil)
        return entry
    }
}

func runWindowShapeProbe(appearance: String, output path: String) throws {
    let output = URL(fileURLWithPath: path, isDirectory: true)
    NSApp.appearance = NSAppearance(named: appearance.hasPrefix("dark") ? .darkAqua : .aqua)
    let screen = NSScreen.main?.frame ?? CGRect(x: 0, y: 0, width: 1440, height: 900)
    let backdrop = NSWindow(contentRect: screen, styleMask: .borderless, backing: .buffered, defer: false)
    backdrop.isReleasedWhenClosed = false
    backdrop.backgroundColor = .white
    backdrop.hasShadow = false
    let fill = OutlineSolidView(frame: CGRect(origin: .zero, size: screen.size))
    fill.color = .white; fill.wantsLayer = true
    backdrop.contentView = fill
    backdrop.orderFrontRegardless()
    let delegate = WindowShapeToolbarDelegate()
    let variants: [(String, NSWindow.ToolbarStyle?, Bool)] = [
        ("titled", nil, false), ("unified", .unified, false), ("unified-compact", .unifiedCompact, false),
        ("expanded", .expanded, false), ("preference", .preference, false),
        ("unified-fullsize", .unified, true), ("unified-compact-fullsize", .unifiedCompact, true)]
    for (name, style, fullSize) in variants {
        let folder = output.appendingPathComponent("window-shape/\(appearance)/\(name)", isDirectory: true)
        try FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
        var mask: NSWindow.StyleMask = [.titled, .closable, .miniaturizable, .resizable]
        if fullSize { mask.insert(.fullSizeContentView) }
        let frame = CGRect(x: screen.midX - 320, y: screen.midY - 230, width: 640, height: 460)
        let window = NSWindow(contentRect: frame, styleMask: mask, backing: .buffered, defer: false)
        window.isReleasedWhenClosed = false
        window.title = "Window shape \(name)"
        window.hasShadow = true
        window.appearance = NSAppearance(named: appearance.hasPrefix("dark") ? .darkAqua : .aqua)
        if let style {
            let toolbar = NSToolbar(identifier: "probe.\(name)")
            toolbar.delegate = delegate
            window.toolbar = toolbar
            window.toolbarStyle = style
        }
        if fullSize { window.titlebarAppearsTransparent = true }
        let content = OutlineSolidView(frame: CGRect(origin: .zero, size: frame.size))
        content.autoresizingMask = [.width, .height]
        content.wantsLayer = true
        content.color = .black
        window.contentView = content
        window.makeKeyAndOrderFront(nil)
        window.orderFrontRegardless()
        NSApp.activate(ignoringOtherApps: true)
        RunLoop.main.run(until: Date().addingTimeInterval(0.35))
        let cg = outlineCGWindowImage(window, folder.appendingPathComponent("cgwindow.png"))
        var runtime = outlineRuntimeDump(window)
        if let theme = window.contentView?.superview {
            runtime["themeFrameClass"] = NSStringFromClass(type(of: theme))
            for key in ["_cornerRadius", "_getCachedDefaultWindowCornerRadius", "_topCornerRadius",
                        "_bottomCornerRadius", "cornerRadius", "_convolutionOverride"] {
                runtime["themeFrame.\(key)"] = outlineKVC(theme, key)
            }
        }
        for key in ["_cornerRadius", "_cornerMask", "_windowCornerRadius"] {
            runtime["window.\(key)"] = outlineKVC(window, key)
        }
        runtime["toolbarStyle"] = window.toolbarStyle.rawValue
        runtime["styleMask"] = window.styleMask.rawValue
        runtime["titlebarAppearsTransparent"] = window.titlebarAppearsTransparent
        try writeJSON(runtime, to: folder.appendingPathComponent("runtime.json"))
        try writeJSON(["stage": "window-shape", "variant": name, "appearance": appearance,
                       "windowFrame": probeRect(window.frame), "pixelScale": window.backingScaleFactor,
                       "isKeyWindow": window.isKeyWindow, "cgWindow": cg, "runtime": "runtime.json"],
                      to: folder.appendingPathComponent("case.json"))
        record("window-shape \(appearance)/\(name) cg=\(cg["error"] ?? "ok")")
        window.close()
    }
    backdrop.close()
}


// Text rasterization references: system-font labels as AppKit draws them on screen, and the same
// strings drawn by CoreText with font smoothing on and off, so the smoothing dilation can be isolated.
private final class TextSmoothingView: NSView {
    var smoothing = true
    var sizes: [CGFloat] = []
    var textColor: NSColor = .labelColor
    override var isFlipped: Bool { true }
    override func draw(_ dirtyRect: NSRect) {
        guard let context = NSGraphicsContext.current?.cgContext else { return }
        context.setShouldSmoothFonts(smoothing)
        context.setAllowsFontSmoothing(true)
        var y: CGFloat = 4
        for size in sizes {
            let attributes: [NSAttributedString.Key: Any] = [
                .font: NSFont.systemFont(ofSize: size), .foregroundColor: textColor]
            NSAttributedString(string: "Checkbox Radio", attributes: attributes)
                .draw(at: CGPoint(x: 6, y: y))
            y += ceil(size * 1.6)
        }
    }
}

private final class TextColorSweepView: NSView {
    var smoothing = true
    override var isFlipped: Bool { true }
    static let colors: [(String, NSColor)] = [
        ("gray0", NSColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)),
        ("gray25", NSColor(srgbRed: 0.25, green: 0.25, blue: 0.25, alpha: 1)),
        ("gray50", NSColor(srgbRed: 0.5, green: 0.5, blue: 0.5, alpha: 1)),
        ("gray75", NSColor(srgbRed: 0.75, green: 0.75, blue: 0.75, alpha: 1)),
        ("gray100", NSColor(srgbRed: 1, green: 1, blue: 1, alpha: 1)),
        ("blue", NSColor(srgbRed: 0, green: 0.478, blue: 1, alpha: 1)),
        ("red", NSColor(srgbRed: 1, green: 0.231, blue: 0.188, alpha: 1))]
    override func draw(_ dirtyRect: NSRect) {
        guard let context = NSGraphicsContext.current?.cgContext else { return }
        context.setShouldSmoothFonts(smoothing)
        context.setAllowsFontSmoothing(true)
        var y: CGFloat = 4
        for (_, color) in Self.colors {
            for size in [13.0, 22.0] as [CGFloat] {
                NSAttributedString(string: "Checkbox Radio", attributes: [
                    .font: NSFont.systemFont(ofSize: size), .foregroundColor: color])
                    .draw(at: CGPoint(x: 6, y: y))
                y += ceil(size * 1.6)
            }
        }
    }
}

func runTextProbe(appearance: String, output path: String) throws {
    let output = URL(fileURLWithPath: path, isDirectory: true)
    let dark = appearance.hasPrefix("dark")
    NSApp.appearance = NSAppearance(named: dark ? .darkAqua : .aqua)
    let folder = output.appendingPathComponent("text/\(appearance)", isDirectory: true)
    try FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
    let sizes: [CGFloat] = [9, 11, 13, 17, 22]
    let screen = NSScreen.main?.frame ?? CGRect(x: 0, y: 0, width: 1440, height: 900)
    let frame = CGRect(x: screen.midX - 430, y: screen.midY - 300, width: 860, height: 600)
    let window = NSWindow(contentRect: frame, styleMask: [.titled, .closable], backing: .buffered, defer: false)
    window.isReleasedWhenClosed = false
    window.title = "Text probe \(appearance)"
    window.appearance = NSAppearance(named: dark ? .darkAqua : .aqua)
    let root = OutlineSolidView(frame: CGRect(origin: .zero, size: frame.size))
    root.color = .windowBackgroundColor
    var labelsFrame: [[String: Any]] = []
    var y = frame.height - 8
    for size in sizes {
        let label = NSTextField(labelWithString: "Checkbox Radio")
        label.font = NSFont.systemFont(ofSize: size)
        label.sizeToFit()
        y -= ceil(size * 1.6)
        label.frame.origin = CGPoint(x: 8, y: y)
        root.addSubview(label)
        labelsFrame.append(["size": size, "frame": probeRect(label.frame)])
    }
    for (index, smoothing) in [true, false].enumerated() {
        let view = TextSmoothingView(frame: CGRect(x: 200 + CGFloat(index) * 160, y: 8, width: 150, height: 300))
        view.smoothing = smoothing
        view.sizes = sizes
        root.addSubview(view)
    }
    for (index, smoothing) in [true, false].enumerated() {
        let sweep = TextColorSweepView(frame: CGRect(x: 520 + CGFloat(index) * 165, y: 8, width: 160, height: 584))
        sweep.smoothing = smoothing
        root.addSubview(sweep)
    }
    window.contentView = root
    window.makeKeyAndOrderFront(nil)
    window.orderFrontRegardless()
    NSApp.activate(ignoringOtherApps: true)
    RunLoop.main.run(until: Date().addingTimeInterval(0.4))
    let cg = outlineCGWindowImage(window, folder.appendingPathComponent("cgwindow.png"))
    if let rep = root.bitmapImageRepForCachingDisplay(in: root.bounds) {
        root.cacheDisplay(in: root.bounds, to: rep)
        try rep.representation(using: .png, properties: [:])?
            .write(to: folder.appendingPathComponent("cachedisplay.png"))
    }
    try writeJSON(["appearance": appearance, "contentFrame": probeRect(root.frame),
                   "windowFrame": probeRect(window.frame), "labels": labelsFrame,
                   "smoothingViews": [["smoothing": true, "x": 200], ["smoothing": false, "x": 360]],
                   "colorSweep": ["x": [520, 685], "smoothing": [true, false], "rowsTop": 4,
                                  "sizes": [13, 22], "colors": TextColorSweepView.colors.map { $0.0 }],
                   "pixelScale": window.backingScaleFactor, "cgWindow": cg,
                   "labelColor": safeDescription(NSColor.labelColor.usingColorSpace(.sRGB)) ?? NSNull(),
                   "fontSmoothingDefault": UserDefaults.standard.object(forKey: "AppleFontSmoothing") ?? NSNull()],
                  to: folder.appendingPathComponent("case.json"))
    record("text-probe \(appearance) cg=\(cg["error"] ?? "ok")")
    window.close()
}


// Scroll pocket under a unified toolbar: per-window images and the pocket's layer tree, default style
// and with style 2 (hard) set through -[NSScrollView setScrollPocketStyle:onEdge:].
private final class PocketDocumentView: NSView {
    override var isFlipped: Bool { true }
    override func draw(_ dirtyRect: NSRect) {
        let colors: [NSColor] = [.systemRed, .systemOrange, .systemYellow, .systemGreen, .systemBlue,
                                 .systemPurple, .white, .black]
        var y: CGFloat = 0
        var index = 0
        while y < bounds.height {
            colors[index % colors.count].setFill()
            CGRect(x: 0, y: y, width: bounds.width / 2, height: 24).fill()
            let text = NSAttributedString(string: "Row \(index) — The quick brown fox jumps over the lazy dog",
                attributes: [.font: NSFont.systemFont(ofSize: 13), .foregroundColor: NSColor.labelColor])
            text.draw(at: CGPoint(x: bounds.width / 2 + 8, y: y + 4))
            y += 24
            index += 1
        }
    }
}

private func pocketLayerTree(_ layer: CALayer, depth: Int = 0) -> [String: Any] {
    var entry: [String: Any] = [
        "class": NSStringFromClass(type(of: layer)), "name": layer.name ?? NSNull(),
        "frame": probeRect(layer.frame), "opacity": layer.opacity, "isHidden": layer.isHidden,
        "backgroundColor": layer.backgroundColor.flatMap { safeDescription($0) } ?? NSNull(),
        "compositingFilter": safeDescription(layer.compositingFilter) ?? NSNull(),
        "masksToBounds": layer.masksToBounds,
        "mask": layer.mask.map { pocketLayerTree($0, depth: depth + 1) } ?? NSNull()]
    func filterInfo(_ list: [Any]?) -> Any {
        guard let list else { return NSNull() }
        return list.map { filter -> [String: Any] in
            var info: [String: Any] = ["description": safeDescription(filter) ?? NSNull()]
            if let object = filter as? NSObject {
                for key in ["name", "type", "inputRadius", "inputNormalizeEdges", "inputDither", "inputFade",
                            "inputColorMatrix", "inputAmount", "inputBlurFillBlurRadius",
                            "inputBlurFillDarkenOpacity", "inputBlurFillLightenOpacity",
                            "inputBlurFillNormalOpacity", "inputMaskImage", "inputSourceSublayerName"] {
                    var error: NSString?
                    let value = SafeInvoke({ object.value(forKey: key) }, &error)
                    if error == nil, let value { info[key] = safeDescription(value) ?? NSNull() }
                }
            }
            return info
        }
    }
    entry["filters"] = filterInfo(layer.filters)
    entry["backgroundFilters"] = filterInfo(layer.backgroundFilters)
    let object = layer as NSObject
    for key in ["scale", "marginWidth", "contentsScale", "groupName", "enabled", "captureOnly",
                "colors", "locations", "startPoint", "endPoint", "type", "contents"] {
        if object.responds(to: NSSelectorFromString(key)) {
            var error: NSString?
            let value = SafeInvoke({ object.value(forKey: key) }, &error)
            if error == nil { entry[key] = safeDescription(value) ?? NSNull() }
        }
    }
    if depth < 16 {
        entry["sublayers"] = (layer.sublayers ?? []).map { pocketLayerTree($0, depth: depth + 1) }
    }
    return entry
}

private func pocketViews(_ view: NSView, into list: inout [NSView]) {
    let name = NSStringFromClass(type(of: view))
    if name.contains("Pocket") && !name.contains("PocketDocumentView") { list.append(view) }
    for child in view.subviews { pocketViews(child, into: &list) }
}

private func pocketViewTree(_ view: NSView, window: NSWindow, depth: Int = 0) -> [String: Any] {
    var entry: [String: Any] = [
        "class": NSStringFromClass(type(of: view)),
        "frameInWindow": probeRect(view.convert(view.bounds, to: nil)),
        "bounds": probeRect(view.bounds), "isHidden": view.isHidden, "alphaValue": view.alphaValue,
        "layer": view.layer.map { pocketLayerTree($0) } ?? NSNull()]
    if let scroll = view as? NSScrollView {
        entry["scrollView"] = [
            "contentInsets": ["top": scroll.contentInsets.top, "left": scroll.contentInsets.left,
                              "bottom": scroll.contentInsets.bottom, "right": scroll.contentInsets.right],
            "automaticallyAdjustsContentInsets": scroll.automaticallyAdjustsContentInsets,
            "contentBounds": probeRect(scroll.contentView.bounds),
            "contentFrameInWindow": probeRect(scroll.contentView.convert(scroll.contentView.bounds, to: nil)),
            "hasVerticalScroller": scroll.hasVerticalScroller,
            "verticalScroller": scroll.verticalScroller.map { pocketViewTree($0, window: window, depth: depth + 1) } ?? NSNull()]
    }
    if depth < 18 {
        entry["subviews"] = view.subviews.map { pocketViewTree($0, window: window, depth: depth + 1) }
    }
    return entry
}

private func pocketRuntimeValues(_ object: NSObject, keys: [String]) -> [String: Any] {
    var values: [String: Any] = [:]
    for key in keys {
        var error: NSString?
        let value = SafeInvoke({ object.value(forKey: key) }, &error)
        values[key] = error == nil ? (value.flatMap { safeDescription($0) } ?? NSNull())
                                   : "unavailable: \(error!)"
    }
    return values
}

private func pocketDocumentView(size: CGSize) -> PocketDocumentView {
    let document = PocketDocumentView(frame: CGRect(origin: .zero,
        size: CGSize(width: size.width, height: 2400)))
    return document
}

private func pocketScrollView(size: CGSize) -> NSScrollView {
    let scroll = NSScrollView(frame: CGRect(origin: .zero, size: size))
    scroll.autoresizingMask = [.width, .height]
    scroll.hasVerticalScroller = true
    scroll.drawsBackground = true
    scroll.documentView = pocketDocumentView(size: size)
    return scroll
}

private func pocketViewController(_ view: NSView) -> NSViewController {
    let controller = NSViewController()
    controller.view = view
    return controller
}

func runScrollPocketProbe(appearance: String, output path: String) throws {
    let output = URL(fileURLWithPath: path, isDirectory: true)
    let dark = appearance.hasPrefix("dark")
    let transparency = NSWorkspace.shared.accessibilityDisplayShouldReduceTransparency ? "reduced" : "normal"
    NSApp.appearance = NSAppearance(named: dark ? .darkAqua : .aqua)
    let screen = NSScreen.main?.frame ?? CGRect(x: 0, y: 0, width: 1440, height: 900)
    let delegate = WindowShapeToolbarDelegate()
    for style in ["automatic", "hard", "soft"] {
        for role in ["main", "sidebar", "inspector"] {
            let frame = CGRect(x: screen.midX - 450, y: screen.midY - 310, width: 900, height: 620)
            let window = NSWindow(contentRect: frame,
                styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
                backing: .buffered, defer: false)
            window.isReleasedWhenClosed = false
            window.title = "Scroll pocket \(role) \(style)"
            window.appearance = NSAppearance(named: dark ? .darkAqua : .aqua)
            let toolbar = NSToolbar(identifier: "pocket.\(style).\(role)")
            toolbar.delegate = delegate
            window.toolbar = toolbar
            window.toolbarStyle = .unified

            let target: NSScrollView
            switch role {
            case "sidebar":
                let side = pocketScrollView(size: frame.size)
                let content = pocketViewController(pocketDocumentView(size: frame.size))
                let controller = NSSplitViewController()
                controller.splitView.isVertical = true
                controller.addSplitViewItem(NSSplitViewItem(sidebarWithViewController: pocketViewController(side)))
                controller.addSplitViewItem(NSSplitViewItem(viewController: content))
                window.contentViewController = controller
                target = side
            case "inspector":
                let main = pocketScrollView(size: frame.size)
                let inspector = pocketScrollView(size: frame.size)
                let item = NSSplitViewItem(inspectorWithViewController: pocketViewController(inspector))
                item.isCollapsed = false
                let controller = NSSplitViewController()
                controller.splitView.isVertical = true
                controller.addSplitViewItem(NSSplitViewItem(viewController: pocketViewController(main)))
                controller.addSplitViewItem(item)
                window.contentViewController = controller
                target = inspector
            default:
                let scroll = pocketScrollView(size: frame.size)
                window.contentView = scroll
                target = scroll
            }

            if style != "automatic" {
                let selector = NSSelectorFromString("setScrollPocketStyle:onEdge:")
                if target.responds(to: selector) {
                    typealias SetStyle = @convention(c) (AnyObject, Selector, Int, Int) -> Void
                    let function = unsafeBitCast(target.method(for: selector), to: SetStyle.self)
                    for edge in 0..<4 { function(target, selector, style == "hard" ? 2 : 1, edge) }
                }
            }
            window.makeKeyAndOrderFront(nil)
            window.orderFrontRegardless()
            NSApp.activate(ignoringOtherApps: true)
            RunLoop.main.run(until: Date().addingTimeInterval(0.4))

            // Static references include the full view/layer tree; main-content motion samples use
            // the 0.5 pt increments requested by the capture task.
            let snapshots: [(String, CGFloat, Bool)] = [
                ("rest", 0, true), ("scrolled", 160, true)]
                + (role == "main" ? (1...8).map { ("motion", CGFloat(160) + CGFloat($0) * 0.5, false) } : [])
            for (state, offset, includeTree) in snapshots {
                let folder: URL
                if state == "motion" {
                    folder = output.appendingPathComponent(
                        "scroll-pocket/\(appearance)/\(transparency)/\(style)/\(role)/motion",
                        isDirectory: true)
                } else {
                    folder = output.appendingPathComponent(
                        "scroll-pocket/\(appearance)/\(transparency)/\(style)/\(role)/\(state)",
                        isDirectory: true)
                }
                try FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
                let top = -target.contentInsets.top
                target.contentView.scroll(to: CGPoint(x: 0, y: top + offset))
                target.reflectScrolledClipView(target.contentView)
                RunLoop.main.run(until: Date().addingTimeInterval(includeTree ? 1.2 : 0.3))

                let imageName = state == "motion" ? String(format: "offset-%05.1f.png", Double(offset)) : "cgwindow.png"
                let cg = outlineCGWindowImage(window, folder.appendingPathComponent(imageName))
                var pockets: [NSView] = []
                pocketViews(window.contentView?.superview ?? target, into: &pockets)
                var recordValues: [String: Any] = [
                    "appearance": appearance, "reduceTransparency": transparency == "reduced",
                    "style": style, "role": role, "state": state, "scrollOffset": offset,
                    "contentInsets": ["top": target.contentInsets.top],
                    "contentBounds": probeRect(target.contentView.bounds),
                    "windowFrame": probeRect(window.frame),
                    "contentLayoutRect": probeRect(window.contentLayoutRect),
                    "titlebarAppearsTransparent": window.titlebarAppearsTransparent,
                    "pixelScale": window.backingScaleFactor, "cgWindow": cg,
                    "pocketProperties": pockets.map { pocketRuntimeValues($0, keys: [
                        "edge", "style", "allowsSeparator", "_showSeparatorsOnHardPocket",
                        "backdropGroupName", "prefersSolidColorHardPocket", "allowsColorSchemeAdaptivity"]) }]
                if includeTree {
                    let root = window.contentView?.superview ?? window.contentView ?? target
                    recordValues["viewAndLayerTree"] = pocketViewTree(root, window: window)
                    recordValues["pockets"] = pockets.map { [
                        "class": NSStringFromClass(type(of: $0)),
                        "frameInWindow": probeRect($0.convert($0.bounds, to: nil)),
                        "isHidden": $0.isHidden, "alphaValue": $0.alphaValue,
                        "layer": $0.layer.map { pocketLayerTree($0) } ?? NSNull()] as [String: Any] }
                    var titlebarViews: [String: Any] = [:]
                    for key in ["titlebarView", "_titlebarView", "_titlebarContainerView"] {
                        var error: NSString?
                        if let value = SafeInvoke({ (window as NSObject).value(forKey: key) }, &error) {
                            if let view = value as? NSView {
                                titlebarViews[key] = pocketViewTree(view, window: window)
                            } else {
                                titlebarViews[key] = safeDescription(value) ?? NSNull()
                            }
                        } else {
                            titlebarViews[key] = error.map { "unavailable: \($0)" } ?? NSNull()
                        }
                    }
                    recordValues["titlebarViews"] = titlebarViews
                }
                let jsonURL = state == "motion"
                    ? folder.appendingPathComponent(String(format: "offset-%05.1f.json", Double(offset)))
                    : folder.appendingPathComponent("case.json")
                try writeJSON(recordValues, to: jsonURL)
                record("scroll-pocket \(appearance)/\(transparency)/\(style)/\(role)/\(state) offset=\(offset) pockets=\(pockets.count) cg=\(cg["error"] ?? "ok")")
            }
            window.close()
        }
    }
}


// Traffic-light references: the standard window buttons idle, hovered, pressed and dragged with HID
// mouse events, with each button's view tree and presentation-layer transforms in every state.
private func tlLayerTree(_ layer: CALayer, depth: Int = 0) -> [String: Any] {
    let p = layer.presentation() ?? layer
    let t = p.transform
    var entry: [String: Any] = [
        "class": NSStringFromClass(type(of: layer)), "name": layer.name ?? NSNull(),
        "frame": probeRect(p.frame), "bounds": probeRect(p.bounds),
        "position": ["x": p.position.x, "y": p.position.y],
        "transform": [t.m11, t.m12, t.m21, t.m22, t.m41, t.m42],
        "opacity": p.opacity, "isHidden": p.isHidden, "cornerRadius": p.cornerRadius,
        "compositingFilter": safeDescription(layer.compositingFilter) ?? NSNull(),
        "filters": safeDescription(layer.filters) ?? NSNull(),
        "animationKeys": layer.animationKeys() ?? []
    ]
    if depth < 12 { entry["sublayers"] = (layer.sublayers ?? []).map { tlLayerTree($0, depth: depth + 1) } }
    return entry
}

private func tlViewTree(_ view: NSView, depth: Int = 0) -> [String: Any] {
    var entry: [String: Any] = [
        "class": NSStringFromClass(type(of: view)), "frame": probeRect(view.frame),
        "windowFrame": probeRect(view.convert(view.bounds, to: nil)),
        "isHidden": view.isHidden, "alpha": view.alphaValue
    ]
    if depth < 10 { entry["subviews"] = view.subviews.map { tlViewTree($0, depth: depth + 1) } }
    return entry
}

private func tlButtons(_ window: NSWindow) -> [(String, NSButton)] {
    let types: [(String, NSWindow.ButtonType)] = [("close", .closeButton), ("minimize", .miniaturizeButton),
                                                  ("zoom", .zoomButton)]
    return types.compactMap { name, type in window.standardWindowButton(type).map { (name, $0) } }
}

private func tlDump(_ window: NSWindow) -> [String: Any] {
    var buttons: [String: Any] = [:]
    for (name, button) in tlButtons(window) {
        var entry: [String: Any] = ["view": tlViewTree(button)]
        if let layer = button.layer { entry["layer"] = tlLayerTree(layer) }
        if let cell = button.cell {
            for key in ["_bezelInteractionState", "isHighlighted", "buttonRevealAmount", "widgetType",
                        "buttonID", "isObscured", "isEdited"] {
                entry["cell.\(key)"] = outlineKVC(cell, key)
            }
        }
        for key in ["revealAmount", "buttonGestureRecognizerEnabled"] { entry[key] = outlineKVC(button, key) }
        buttons[name] = entry
    }
    let mouse = NSEvent.mouseLocation
    let windows: [[String: Any]] = NSApp.windows.filter { $0.isVisible }.map {
        ["class": NSStringFromClass(type(of: $0)), "frame": probeRect($0.frame), "level": $0.level.rawValue]
    }
    return ["buttons": buttons, "isKeyWindow": window.isKeyWindow, "isMainWindow": window.isMainWindow,
            "mouse": ["x": mouse.x, "y": mouse.y], "pixelScale": window.backingScaleFactor,
            "windowFrame": probeRect(window.frame), "windows": windows]
}

private func tlCapture(_ rect: CGRect, windowNumber: Int?, _ url: URL) -> [String: Any] {
    typealias Capture = @convention(c) (CGRect, UInt32, UInt32, UInt32) -> Unmanaged<CGImage>?
    guard let library = dlopen("/System/Library/Frameworks/CoreGraphics.framework/CoreGraphics", RTLD_LAZY),
          let symbol = dlsym(library, "CGWindowListCreateImage") else { return ["error": "no CGWindowListCreateImage"] }
    let capture = unsafeBitCast(symbol, to: Capture.self)
    let option = windowNumber == nil ? CGWindowListOption.optionOnScreenOnly : .optionIncludingWindow
    guard let image = capture(rect, option.rawValue, CGWindowID(windowNumber ?? 0),
                              CGWindowImageOption.bestResolution.rawValue)?.takeRetainedValue() else {
        return ["error": "capture returned nil"]
    }
    return ["file": url.lastPathComponent, "written": outlineWrite(image, url),
            "imagePixels": ["width": image.width, "height": image.height], "cgRect": probeRect(rect)]
}

// The hosted VM ignores HID posts (the cursor never moves), so each event also warps the cursor
// and is queued as an AppKit event for the window; the button's tracking loop dequeues it.
private struct TrafficLightTarget: @unchecked Sendable {
    let windowNumber: Int
    let windowOrigin: CGPoint
    let screenTop: CGFloat
}

private func tlPost(_ type: CGEventType, _ point: CGPoint, _ target: TrafficLightTarget) {
    CGWarpMouseCursorPosition(point)
    CGEvent(mouseEventSource: nil, mouseType: type, mouseCursorPosition: point, mouseButton: .left)?
        .post(tap: .cghidEventTap)
    let kind: NSEvent.EventType
    switch type {
    case .leftMouseDown: kind = .leftMouseDown
    case .leftMouseUp: kind = .leftMouseUp
    case .leftMouseDragged: kind = .leftMouseDragged
    default: kind = .mouseMoved
    }
    let location = CGPoint(x: point.x - target.windowOrigin.x, y: target.screenTop - point.y - target.windowOrigin.y)
    if let event = NSEvent.mouseEvent(with: kind, location: location, modifierFlags: [],
                                      timestamp: ProcessInfo.processInfo.systemUptime,
                                      windowNumber: target.windowNumber, context: nil, eventNumber: 0,
                                      clickCount: 1, pressure: kind == .leftMouseUp || kind == .mouseMoved ? 0 : 1) {
        NSApp.postEvent(event, atStart: false)
    }
}

private final class TrafficLightToolbarDelegate: NSObject, NSToolbarDelegate {
    let item = NSToolbarItem.Identifier("probe.item")
    func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] { [item] }
    func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] { [item] }
    func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier identifier: NSToolbarItem.Identifier,
                 willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
        let entry = NSToolbarItem(itemIdentifier: identifier)
        entry.label = "Item"
        entry.image = NSImage(systemSymbolName: "square.and.arrow.up", accessibilityDescription: nil)
        return entry
    }
}

private final class TrafficLightRun: @unchecked Sendable {
    var done = false
    var cases: [[String: Any]] = []
}

func runTrafficLightProbe(appearance: String, output path: String) throws {
    let output = URL(fileURLWithPath: path, isDirectory: true)
    let dark = appearance.hasPrefix("dark")
    NSApp.appearance = NSAppearance(named: dark ? .darkAqua : .aqua)
    let screen = NSScreen.main?.frame ?? CGRect(x: 0, y: 0, width: 1440, height: 900)
    let backdrop = NSWindow(contentRect: screen, styleMask: .borderless, backing: .buffered, defer: false)
    backdrop.isReleasedWhenClosed = false
    backdrop.backgroundColor = .white
    backdrop.hasShadow = false
    backdrop.orderFrontRegardless()
    let delegate = TrafficLightToolbarDelegate()
    // CG global coordinates have their origin at the top left of the main display.
    let screenTop = screen.maxY
    func cgPoint(_ p: CGPoint) -> CGPoint { CGPoint(x: p.x, y: screenTop - p.y) }
    let park = CGPoint(x: screen.maxX - 20, y: 20)
    let run = TrafficLightRun()
    for variant in ["unified", "titled"] {
        let folder = output.appendingPathComponent("traffic-lights/\(appearance)/\(variant)", isDirectory: true)
        try FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
        let frame = CGRect(x: screen.midX - 320, y: screen.midY - 230, width: 640, height: 460)
        let window = NSWindow(contentRect: frame, styleMask: [.titled, .closable, .miniaturizable, .resizable],
                              backing: .buffered, defer: false)
        window.isReleasedWhenClosed = false
        window.title = "Traffic lights \(variant)"
        window.appearance = NSAppearance(named: dark ? .darkAqua : .aqua)
        if variant == "unified" {
            let toolbar = NSToolbar(identifier: "probe.traffic")
            toolbar.delegate = delegate
            window.toolbar = toolbar
            window.toolbarStyle = .unified
        }
        window.makeKeyAndOrderFront(nil)
        window.orderFrontRegardless()
        NSApp.activate(ignoringOtherApps: true)
        RunLoop.main.run(until: Date().addingTimeInterval(0.6))
        var centers: [String: CGPoint] = [:]
        for (name, button) in tlButtons(window) {
            let r = window.convertToScreen(button.convert(button.bounds, to: nil))
            centers[name] = CGPoint(x: r.midX, y: r.midY)
        }
        let region = CGRect(x: window.frame.minX - 20, y: screenTop - window.frame.maxY - 20, width: 240, height: 120)
        let windowNumber = window.windowNumber
        let target = TrafficLightTarget(windowNumber: windowNumber, windowOrigin: window.frame.origin,
                                        screenTop: screenTop)
        let other = NSWindow(contentRect: CGRect(x: screen.minX + 40, y: screen.minY + 60, width: 200, height: 120),
                             styleMask: [.titled], backing: .buffered, defer: false)
        other.isReleasedWhenClosed = false
        other.title = "Other"
        run.done = false
        // Events and captures run off the main thread: a pressed window button tracks the mouse in a
        // nested loop, and main-queue blocks still run there (common modes) for the dumps.
        DispatchQueue.global().async {
            // The probe itself runs inside a main-queue block, so main.sync would deadlock; a run-loop
            // block runs in the nested run loops and in the button's tracking loop (common modes).
            func onMain<T>(_ body: @escaping () -> T) -> T {
                let done = DispatchSemaphore(value: 0)
                var result: T?
                CFRunLoopPerformBlock(CFRunLoopGetMain(), CFRunLoopMode.commonModes.rawValue) {
                    result = body()
                    done.signal()
                }
                CFRunLoopWakeUp(CFRunLoopGetMain())
                done.wait()
                return result!
            }
            func state(_ name: String, wait: Double) {
                Thread.sleep(forTimeInterval: wait)
                let display = tlCapture(region, windowNumber: nil, folder.appendingPathComponent("\(name)-display.png"))
                let windowImage = tlCapture(.null, windowNumber: windowNumber,
                                            folder.appendingPathComponent("\(name)-window.png"))
                let dump = onMain { tlDump(window) }
                try? writeJSON(dump, to: folder.appendingPathComponent("\(name).json"))
                onMain { run.cases.append(["appearance": appearance, "variant": variant, "state": name,
                                           "display": display, "window": windowImage]) }
                record("traffic-lights \(appearance)/\(variant)/\(name) display=\(display["error"] ?? "ok")")
            }
            guard let close = centers["close"], let zoom = centers["zoom"] else {
                onMain { run.done = true }
                return
            }
            tlPost(.mouseMoved, cgPoint(park), target); state("idle", wait: 0.8)
            tlPost(.mouseMoved, cgPoint(close), target); state("hover-close", wait: 0.8)
            tlPost(.mouseMoved, cgPoint(zoom), target); state("hover-zoom", wait: 0.6)
            tlPost(.mouseMoved, cgPoint(close), target); Thread.sleep(forTimeInterval: 0.4)
            tlPost(.leftMouseDown, cgPoint(close), target); state("pressed-close", wait: 1.2)
            var last = close
            let drags: [(String, Double, Double)] = [("drag-close-right12", 12, 0), ("drag-close-right80", 80, 0),
                                                     ("drag-close-right160", 160, 0), ("drag-close-down80", 0, -80),
                                                     ("drag-close-diag", 80, -80)]
            for (name, dx, dy) in drags {
                let goal = CGPoint(x: close.x + dx, y: close.y + dy)
                for step in 1...10 {
                    let f = Double(step) / 10
                    tlPost(.leftMouseDragged, cgPoint(CGPoint(x: last.x + (goal.x - last.x) * f,
                                                              y: last.y + (goal.y - last.y) * f)), target)
                    Thread.sleep(forTimeInterval: 0.02)
                }
                last = goal
                state(name, wait: 1.2)
            }
            tlPost(.leftMouseUp, cgPoint(last), target); state("released", wait: 1.2)
            if variant == "unified" {
                onMain { other.makeKeyAndOrderFront(nil) }
                tlPost(.mouseMoved, cgPoint(park), target); state("inactive", wait: 0.8)
                tlPost(.mouseMoved, cgPoint(close), target); state("inactive-hover-close", wait: 0.8)
            }
            tlPost(.mouseMoved, cgPoint(park), target)
            onMain { run.done = true }
        }
        // The probe runs inside a main-queue block, so NSApp's own loop is not fetching events:
        // dispatch the queued AppKit events here.
        while !run.done {
            if let event = NSApp.nextEvent(matching: .any, until: Date().addingTimeInterval(0.02),
                                           inMode: .default, dequeue: true) {
                NSApp.sendEvent(event)
            }
        }
        other.close()
        window.close()
    }
    try writeJSON(run.cases, to: output.appendingPathComponent("traffic-lights/\(appearance)/cases.json"))
    backdrop.close()
}
