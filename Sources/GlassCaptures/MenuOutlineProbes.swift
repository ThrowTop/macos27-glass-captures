import AppKit
import QuartzCore
import ScreenCaptureKit
import SafeKVC
import CoreGraphics
import Darwin

private final class OutlineSolidView: NSView {
    var color: NSColor = .white
    override func draw(_ dirtyRect: NSRect) {
        color.setFill()
        bounds.fill()
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
                    title.contains("private window picker") ||
                    title.contains("screen and audio") || title.contains("screen recording")
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
    Task.detached {
        do {
            let content = try await SCShareableContent.current
            guard let source = content.windows.first(where: { $0.windowID == number }) else {
                throw NSError(domain: "MenuOutline", code: 2,
                              userInfo: [NSLocalizedDescriptionKey: "window \(number) absent from ScreenCaptureKit list"])
            }
            let filter = SCContentFilter(desktopIndependentWindow: source)
            let configuration = SCStreamConfiguration()
            // The window-style filter returns the shadow in addition to the frame.
            // A 56 pt allowance on each side matches the legacy framing extent and
            // prevents SCStreamConfiguration from scaling the window down to fit.
            configuration.width = max(1, Int(ceil((windowSize.width + 112) * scale)))
            configuration.height = max(1, Int(ceil((windowSize.height + 112) * scale)))
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
    return [
        "windowNumber": window.windowNumber,
        "class": NSStringFromClass(type(of: window)),
        "frame": probeRect(window.frame),
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
