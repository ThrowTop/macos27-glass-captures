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
