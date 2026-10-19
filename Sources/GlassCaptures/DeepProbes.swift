import AppKit
import QuartzCore
import ScreenCaptureKit
import SafeKVC
import ApplicationServices
import SwiftUI
import ObjectiveC.runtime

// Deep probes: states that need a live window and a screenshot rather than a getter. Slider tick
// marks, open menus (tree, layers, open/close timeline, highlight) and a slider over-drag timeline.
// Output: deep.json plus PNGs in <pass>/deep/. As with the getter probes, every AppKit call runs
// under SafeInvoke and values are recorded as returned, never tuned.

// Mutable state shared with Timer blocks, which are @Sendable and cannot mutate captured locals.
private final class Box<T> {
    var value: T
    init(_ value: T) { self.value = value }
}

private func deepLayer(_ layer: CALayer, depth: Int, maximumDepth: Int) -> [String: Any] {
    var d: [String: Any] = [
        "class": NSStringFromClass(type(of: layer)),
        "name": layer.name ?? "",
        "frame": probeRect(layer.frame), "bounds": probeRect(layer.bounds),
        "opacity": layer.opacity, "isHidden": layer.isHidden,
        "masksToBounds": layer.masksToBounds, "cornerRadius": layer.cornerRadius,
        "cornerCurve": layer.cornerCurve.rawValue, "borderWidth": layer.borderWidth,
        "shadowOpacity": layer.shadowOpacity, "shadowRadius": layer.shadowRadius,
        "shadowOffset": probeSize(layer.shadowOffset),
        "contentsPresent": layer.contents != nil, "contentsScale": layer.contentsScale,
        "hasMask": layer.mask != nil
    ]
    d["backgroundColor"] = layer.backgroundColor.flatMap { safeDescription($0) } ?? NSNull()
    d["borderColor"] = layer.borderColor.flatMap { safeDescription($0) } ?? NSNull()
    d["shadowColor"] = layer.shadowColor.flatMap { safeDescription($0) } ?? NSNull()
    d["shadowPathBounds"] = layer.shadowPath.map { probeRect($0.boundingBox) as Any } ?? NSNull()
    d["compositingFilter"] = layer.compositingFilter.flatMap { safeDescription($0) } ?? NSNull()
    d["filters"] = layer.filters.flatMap { safeDescription($0) } ?? NSNull()
    d["backgroundFilters"] = layer.backgroundFilters.flatMap { safeDescription($0) } ?? NSNull()
    d["mask"] = layer.mask.map { deepLayer($0, depth: depth + 1, maximumDepth: depth + 1) as Any } ?? NSNull()
    let children: [[String: Any]] = depth >= maximumDepth ? [] : (layer.sublayers ?? []).map {
        deepLayer($0, depth: depth + 1, maximumDepth: maximumDepth)
    }
    d["sublayers"] = children
    return d
}

private func viewTree(_ view: NSView, depth: Int, maximumDepth: Int) -> [String: Any] {
    var d: [String: Any] = [
        "class": NSStringFromClass(type(of: view)),
        "frame": probeRect(view.frame),
        "frameInWindow": probeRect(view.convert(view.bounds, to: nil)),
        "isHidden": view.isHidden, "alphaValue": view.alphaValue, "wantsLayer": view.wantsLayer
    ]
    if let text = view as? NSTextField {
        d["stringValue"] = text.stringValue
        d["font"] = fontJSON(text.font) ?? NSNull()
    }
    let children: [[String: Any]] = depth >= maximumDepth ? [] : view.subviews.map {
        viewTree($0, depth: depth + 1, maximumDepth: maximumDepth)
    }
    d["subviews"] = children
    return d
}

// Flat presentation-layer sample for timelines: one entry per layer, depth-first.
private func presentationSample(_ layer: CALayer, path: String, depth: Int, maximumDepth: Int,
                                into out: inout [[String: Any]]) {
    let p = layer.presentation() ?? layer
    let t = p.transform
    out.append(["path": path, "class": NSStringFromClass(type(of: layer)),
                "frame": probeRect(p.frame), "bounds": probeRect(p.bounds),
                "position": ["x": p.position.x, "y": p.position.y],
                "opacity": p.opacity, "cornerRadius": p.cornerRadius,
                "transform": [t.m11, t.m12, t.m21, t.m22, t.m41, t.m42]])
    guard depth < maximumDepth else { return }
    for (index, child) in (layer.sublayers ?? []).enumerated() {
        presentationSample(child, path: "\(path)/\(index)", depth: depth + 1,
                           maximumDepth: maximumDepth, into: &out)
    }
}

// Runtime property dump used only while a menu window is open. KVC is performed inside
// SafeInvoke so an exception is retained alongside the property name.
private func runtimeValue(_ value: Any?) -> Any? {
    guard let value else { return nil }
    if let boxed = value as? NSValue,
       String(cString: boxed.objCType).hasPrefix("{CAColorMatrix=") {
        var components = [Float](repeating: 0, count: 20)
        components.withUnsafeMutableBytes { bytes in
            if let base = bytes.baseAddress { boxed.getValue(base, size: bytes.count) }
        }
        return components
    }
    return safeDescription(value)
}

private func runtimeKVC(_ object: AnyObject, _ key: String) -> [String: Any] {
    if let value = SafeValueForKey(object, key) {
        return ["value": runtimeValue(value) ?? NSNull()]
    }
    var error: NSString?
    let result = SafeInvoke({ object.value(forKey: key) }, &error)
    if let error { return ["error": error as String] }
    guard let result else { return ["value": NSNull()] }
    return ["value": runtimeValue(result) ?? NSNull()]
}

private func runtimeProperties(_ object: AnyObject, upTo stopClass: AnyClass? = nil,
                               classOnly: Bool = false) -> [String: Any] {
    var values: [String: Any] = [:]
    var current: AnyClass? = type(of: object)
    while let cls = current, cls !== stopClass {
        var count: UInt32 = 0
        if let list = class_copyPropertyList(cls, &count) {
            for index in 0..<Int(count) {
                let name = String(cString: property_getName(list[index]))
                let result = runtimeKVC(object, name)
                if let error = result["error"] as? String, name.hasPrefix("_") {
                    _ = error
                    continue
                }
                values[name] = result["value"] ?? ["error": result["error"] ?? "KVC failed"]
            }
            free(list)
        }
        if classOnly { break }
        current = class_getSuperclass(cls)
    }
    return values
}

private func runtimeFilter(_ object: AnyObject) -> [String: Any] {
    let nameResult = runtimeKVC(object, "name")
    let inputsResult = runtimeKVC(object, "inputKeys")
    let outputsResult = runtimeKVC(object, "outputKeys")
    let inputKeys = (SafeValueForKey(object, "inputKeys") as? [String]) ?? []
    var inputs: [String: Any] = [:]
    for key in inputKeys { inputs[key] = runtimeKVC(object, key) }
    return ["class": NSStringFromClass(type(of: object)),
            "name": nameResult["value"] ?? nameResult["error"] ?? NSNull(),
            "inputKeys": inputsResult["value"] ?? inputsResult["error"] ?? NSNull(),
            "outputKeys": outputsResult["value"] ?? outputsResult["error"] ?? NSNull(),
            "inputs": inputs,
            "properties": runtimeProperties(object, classOnly: true)]
}

private func runtimeSDFObject(_ object: AnyObject, depth: Int = 0) -> [String: Any] {
    var properties: [String: Any] = [:]
    var current: AnyClass? = type(of: object)
    while let cls = current, cls !== NSObject.self {
        var count: UInt32 = 0
        if let list = class_copyPropertyList(cls, &count) {
            for index in 0..<Int(count) {
                let key = String(cString: property_getName(list[index]))
                guard let raw = SafeValueForKey(object, key) else {
                    let result = runtimeKVC(object, key)
                    if key.hasPrefix("_"), result["error"] != nil { continue }
                    properties[key] = result
                    continue
                }
                if depth < 2, let nested = raw as AnyObject?,
                   NSStringFromClass(type(of: nested)).hasPrefix("CASDF") {
                    properties[key] = ["value": runtimeValue(raw) ?? NSNull(),
                                       "object": runtimeSDFObject(nested, depth: depth + 1)]
                } else {
                    properties[key] = ["value": runtimeValue(raw) ?? NSNull()]
                }
            }
            free(list)
        }
        current = class_getSuperclass(cls)
    }
    return ["class": NSStringFromClass(type(of: object)), "properties": properties]
}

// Shared runtime layer-property dump for menu and grouping probes. It preserves the
// property/filter/SDF detail while allowing callers to choose their tree depth.
private func layerPropertyDump(_ root: CALayer, depth: Int = 0, maximumDepth: Int = 16,
                               path: String = "0", includeAllLayers: Bool = false) -> [[String: Any]] {
    var entries: [[String: Any]] = []
    let cls = NSStringFromClass(type(of: root))
    let layerFilters = (root.filters ?? []).compactMap { $0 as AnyObject? }
    let backgroundFilters = (root.backgroundFilters ?? []).compactMap { $0 as AnyObject? }
    var compositing: [AnyObject] = []
    if let value = root.compositingFilter as AnyObject? { compositing = [value] }
    let filters = layerFilters + compositing + backgroundFilters
    let matchesClass = cls.hasPrefix("CASDF") || cls.hasPrefix("CABackdrop") ||
        cls.hasPrefix("SwiftUI.SDF") || cls.contains("Portal")
    if includeAllLayers || matchesClass || !filters.isEmpty {
        var entry: [String: Any] = ["path": path, "class": cls, "frame": probeRect(root.frame),
                                    "properties": runtimeProperties(root, upTo: CALayer.self),
                                    "filters": filters.map(runtimeFilter), "effect": [:]]
        if cls.hasPrefix("CASDF"), let effect = SafeValueForKey(root, "effect") as AnyObject? {
            entry["effect"] = runtimeSDFObject(effect)
        }
        entries.append(entry)
    }
    if depth < maximumDepth {
        for (index, child) in (root.sublayers ?? []).enumerated() {
            entries.append(contentsOf: layerPropertyDump(child, depth: depth + 1,
                                                         maximumDepth: maximumDepth,
                                                         path: "\(path)/\(index)",
                                                         includeAllLayers: includeAllLayers))
        }
    }
    return entries
}

private func ownServerWindows() -> [[String: Any]] {
    let pid = Int(ProcessInfo.processInfo.processIdentifier)
    guard let list = CGWindowListCopyWindowInfo([.optionOnScreenOnly], kCGNullWindowID) as? [[String: Any]] else {
        return []
    }
    return list.compactMap { info -> [String: Any]? in
        guard (info[kCGWindowOwnerPID as String] as? Int) == pid else { return nil }
        return ["number": info[kCGWindowNumber as String] ?? NSNull(),
                "layer": info[kCGWindowLayer as String] ?? NSNull(),
                "alpha": info[kCGWindowAlpha as String] ?? NSNull(),
                "bounds": info[kCGWindowBounds as String] ?? NSNull()]
    }
}

private func primaryScreenFrame() -> CGRect {
    NSScreen.screens.first?.frame ?? CGRect(x: 0, y: 0, width: 1024, height: 768)
}

// Display composite cropped to `rect` (AppKit global coordinates). Same capture path as the image
// scenarios, so lifted overlay windows and menu shadows are included.
private func captureScreen(_ rect: CGRect, to url: URL) -> [String: Any] {
    let screenFrame = primaryScreenFrame()
    let semaphore = DispatchSemaphore(value: 0)
    let image = Box<CGImage?>(nil)
    let failure = Box<String?>(nil)
    Task.detached {
        do {
            let content = try await SCShareableContent.current
            guard let display = content.displays.first else {
                throw NSError(domain: "DeepProbes", code: 1,
                              userInfo: [NSLocalizedDescriptionKey: "display absent from ScreenCaptureKit list"])
            }
            let filter = SCContentFilter(display: display, excludingWindows: [])
            let config = SCStreamConfiguration()
            config.width = display.width
            config.height = display.height
            config.showsCursor = false
            image.value = try await SCScreenshotManager.captureImage(contentFilter: filter, configuration: config)
        } catch { failure.value = String(describing: error) }
        semaphore.signal()
    }
    guard semaphore.wait(timeout: .now() + 8) == .success, let full = image.value else {
        return ["error": failure.value ?? "capture timed out"]
    }
    let scale = CGFloat(full.width) / screenFrame.width
    let crop = CGRect(x: floor((rect.minX - screenFrame.minX) * scale),
                      y: floor((screenFrame.maxY - rect.maxY) * scale),
                      width: ceil(rect.width * scale), height: ceil(rect.height * scale))
    guard let clipped = full.cropping(to: crop) else { return ["error": "crop outside image \(crop)"] }
    return ["file": url.lastPathComponent, "written": writePNG(clipped, to: url),
            "pixelScale": scale, "screenRect": probeRect(rect), "cropPixels": probeRect(crop),
            "imagePixels": ["width": clipped.width, "height": clipped.height]]
}

// View drawing re-rendered into a bitmap at `scale`. Tests whether AppKit's drawing gives HiDPI
// references on a 1x runner; backdrop and portal layers are not expected to appear.
private func cacheRender(_ view: NSView, scale: CGFloat, to url: URL) -> [String: Any] {
    let bounds = view.bounds
    guard let rep = NSBitmapImageRep(bitmapDataPlanes: nil,
                                     pixelsWide: Int(ceil(bounds.width * scale)),
                                     pixelsHigh: Int(ceil(bounds.height * scale)),
                                     bitsPerSample: 8, samplesPerPixel: 4, hasAlpha: true, isPlanar: false,
                                     colorSpaceName: .deviceRGB, bytesPerRow: 0, bitsPerPixel: 0) else {
        return ["error": "bitmap rep unavailable"]
    }
    rep.size = bounds.size
    view.cacheDisplay(in: bounds, to: rep)
    guard let cg = rep.cgImage else { return ["error": "bitmap rep has no CGImage"] }
    return ["file": url.lastPathComponent, "written": writePNG(cg, to: url), "scale": scale,
            "imagePixels": ["width": cg.width, "height": cg.height]]
}

private func newWindows(excluding baseline: Set<Int>) -> [NSWindow] {
    NSApp.windows.filter { $0.isVisible && !baseline.contains($0.windowNumber) }
}

private func windowEntry(_ w: NSWindow) -> [String: Any] {
    var entry: [String: Any] = ["number": w.windowNumber, "class": NSStringFromClass(type(of: w)),
                                "frame": probeRect(w.frame), "alphaValue": w.alphaValue]
    if let layer = w.contentView?.superview?.layer ?? w.contentView?.layer {
        let p = layer.presentation() ?? layer
        let t = p.transform
        entry["rootOpacity"] = p.opacity
        entry["rootBounds"] = probeRect(p.bounds)
        entry["rootTransform"] = [t.m11, t.m12, t.m21, t.m22, t.m41, t.m42]
    }
    return entry
}

// MARK: - Slider tick marks

private func probeSliderTicks(window: NSWindow, root: NSView, folder: URL, recorder: ProbeRecorder) {
    let variants: [(String, Int, Bool)] = [("plain", 0, false), ("ticks", 5, false),
                                           ("tickOnly", 5, true), ("ticks11", 11, false)]
    for sizeName in ["mini", "small", "regular", "large", "extraLarge"] {
        guard let size = controlSize(sizeName) else { continue }
        for (variant, ticks, only) in variants {
            for (positionName, position) in [("below", NSSlider.TickMarkPosition.below), ("above", .above)] {
                if ticks == 0 && positionName == "above" { continue }
                let id = "slider.\(sizeName).\(variant).\(positionName)"
                var madeContainer: NSView?
                var made: NSSlider?
                guard recorder.guarded(id, {
                    let container = NSView(frame: CGRect(x: 10, y: 10, width: 240, height: 64))
                    let s = NSSlider(value: 0.4, minValue: 0, maxValue: 1, target: nil, action: nil)
                    s.controlSize = size
                    s.numberOfTickMarks = ticks
                    s.allowsTickMarkValuesOnly = only
                    s.tickMarkPosition = position
                    s.sizeToFit()
                    s.frame = CGRect(x: 20, y: 20, width: 200, height: s.frame.height)
                    container.addSubview(s)
                    root.addSubview(container)
                    madeContainer = container
                    made = s
                }) else { continue }
                recorder.guarded("\(id).measure", {
                    guard let s = made, let container = madeContainer, let cell = s.cell as? NSSliderCell else {
                        recorder.missing("\(id).measure", "slider cell unavailable"); return
                    }
                    window.displayIfNeeded(); settle(); settle()
                    let toScreen: (CGRect) -> CGRect = { window.convertToScreen(s.convert($0, to: nil)) }
                    recorder.put("\(id).value", s.doubleValue)
                    recorder.put("\(id).frameScreen", probeRect(toScreen(s.bounds)))
                    recorder.put("\(id).knobRectScreen", probeRect(toScreen(cell.knobRect(flipped: s.isFlipped))))
                    recorder.put("\(id).barRectScreen", probeRect(toScreen(cell.barRect(flipped: s.isFlipped))))
                    if ticks > 0 {
                        recorder.put("\(id).tickRectsScreen",
                                     (0..<ticks).map { probeRect(toScreen(cell.rectOfTickMark(at: $0))) })
                    }
                    recorder.putOptional("\(id).layers", "slider has no layer",
                                         s.layer.map { deepLayer($0, depth: 0, maximumDepth: 12) })
                    let shotRect = window.convertToScreen(container.convert(container.bounds, to: nil))
                    recorder.put("\(id).screenshot", captureScreen(shotRect, to: folder.appendingPathComponent("\(id).png")))
                    recorder.put("\(id).cache2x", cacheRender(container, scale: 2,
                                                              to: folder.appendingPathComponent("\(id)@2x-cache.png")))
                    container.removeFromSuperview()
                })
            }
        }
    }
}

private func probeVerticalSliderTicks(window: NSWindow, root: NSView, folder: URL, recorder: ProbeRecorder) {
    for sizeName in ["mini", "small", "regular", "large"] {
        guard let size = controlSize(sizeName) else { continue }
        for (positionName, position) in [("leading", NSSlider.TickMarkPosition.leading), ("trailing", .trailing)] {
            let id = "sliderV.\(sizeName).\(positionName)"
            var madeContainer: NSView?
            var made: NSSlider?
            guard recorder.guarded(id, {
                let container = NSView(frame: CGRect(x: 10, y: 10, width: 64, height: 240))
                let s = NSSlider(value: 0.4, minValue: 0, maxValue: 1, target: nil, action: nil)
                s.controlSize = size
                s.isVertical = true
                s.numberOfTickMarks = 5
                s.tickMarkPosition = position
                s.frame = CGRect(x: 20, y: 20, width: 28, height: 200)
                container.addSubview(s)
                root.addSubview(container)
                madeContainer = container
                made = s
            }) else { continue }
            recorder.guarded("\(id).measure", {
                guard let s = made, let container = madeContainer, let cell = s.cell as? NSSliderCell else {
                    recorder.missing("\(id).measure", "slider cell unavailable"); return
                }
                window.displayIfNeeded(); settle(); settle()
                let toScreen: (CGRect) -> CGRect = { window.convertToScreen(s.convert($0, to: nil)) }
                recorder.put("\(id).value", s.doubleValue)
                recorder.put("\(id).frameScreen", probeRect(toScreen(s.bounds)))
                recorder.put("\(id).knobRectScreen", probeRect(toScreen(cell.knobRect(flipped: s.isFlipped))))
                recorder.put("\(id).barRectScreen", probeRect(toScreen(cell.barRect(flipped: s.isFlipped))))
                recorder.put("\(id).tickRectsScreen", (0..<5).map { probeRect(toScreen(cell.rectOfTickMark(at: $0))) })
                recorder.putOptional("\(id).layers", "slider has no layer",
                                     s.layer.map { deepLayer($0, depth: 0, maximumDepth: 12) })
                let shotRect = window.convertToScreen(container.convert(container.bounds, to: nil))
                recorder.put("\(id).screenshot", captureScreen(shotRect, to: folder.appendingPathComponent("\(id).png")))
                recorder.put("\(id).cache2x", cacheRender(container, scale: 2,
                                                            to: folder.appendingPathComponent("\(id)@2x-cache.png")))
                container.removeFromSuperview()
            })
        }
    }
}

// MARK: - Slider over-drag timeline

private func postMouse(_ type: NSEvent.EventType, at p: CGPoint, window: NSWindow) {
    guard let e = NSEvent.mouseEvent(with: type, location: p, modifierFlags: [],
                                     timestamp: ProcessInfo.processInfo.systemUptime,
                                     windowNumber: window.windowNumber, context: nil, eventNumber: 0,
                                     clickCount: 1, pressure: type == .leftMouseUp ? 0 : 1) else { return }
    NSApp.postEvent(e, atStart: false)
}

private func sendMouse(_ type: NSEvent.EventType, at p: CGPoint, window: NSWindow,
                       recorder: ProbeRecorder, id: String) {
    guard let e = NSEvent.mouseEvent(with: type, location: p, modifierFlags: [],
                                     timestamp: ProcessInfo.processInfo.systemUptime,
                                     windowNumber: window.windowNumber, context: nil, eventNumber: 0,
                                     clickCount: 1, pressure: type == .leftMouseUp ? 0 : 1) else { return }
    recorder.guarded("\(id).event.\(type.rawValue)", { window.sendEvent(e) })
}

private func probeSliderDrag(window: NSWindow, root: NSView, folder: URL, recorder: ProbeRecorder) {
    for (name, direction) in [("maxEnd", CGFloat(1)), ("minEnd", CGFloat(-1))] {
        let id = "sliderDrag.regular.\(name)"
        let container = NSView(frame: CGRect(x: 60, y: 60, width: 320, height: 80))
        var made: NSSlider?
        guard recorder.guarded(id, {
            let s = NSSlider(value: 0.5, minValue: 0, maxValue: 1, target: nil, action: nil)
            s.controlSize = .regular
            s.sizeToFit()
            s.frame = CGRect(x: 60, y: 30, width: 200, height: s.frame.height)
            container.addSubview(s)
            root.addSubview(container)
            made = s
        }), let s = made, let cell = s.cell as? NSSliderCell else { continue }
        recorder.guarded("\(id).display", { window.displayIfNeeded() })
        settle(); settle()
        let knob = cell.knobRect(flipped: s.isFlipped)
        let bar = cell.barRect(flipped: s.isFlipped)
        let start = s.convert(CGPoint(x: knob.midX, y: knob.midY), to: nil)
        let endX = s.convert(CGPoint(x: direction > 0 ? bar.maxX : bar.minX, y: knob.midY), to: nil).x
        recorder.put("\(id).startWindowPoint", ["x": start.x, "y": start.y])
        recorder.put("\(id).barEndWindowX", endX)
        // Drag path: to the bar end, then 30, 60 and 100 pt beyond it; hold; release.
        let steps: [(TimeInterval, CGFloat)] = [(0.10, (endX + start.x) / 2), (0.20, endX),
            (0.30, endX + 30 * direction), (0.40, endX + 60 * direction), (0.50, endX + 100 * direction)]
        let samples = Box<[[String: Any]]>([])
        let baseline = Set(NSApp.windows.map { $0.windowNumber })
        let began = Date()
        let shots = Box<[String: Any]>([:])
        let sampler = Timer(timeInterval: 1.0 / 60.0, repeats: true) { timer in
            let t = Date().timeIntervalSince(began)
            var error: NSString?
            _ = SafeInvoke({
                var layers: [[String: Any]] = []
                if let layer = s.layer { presentationSample(layer, path: "0", depth: 0, maximumDepth: 8, into: &layers) }
                var overlays: [[String: Any]] = []
                for w in newWindows(excluding: baseline) {
                    var entry = windowEntry(w)
                    var overlayLayers: [[String: Any]] = []
                    if let layer = w.contentView?.layer {
                        presentationSample(layer, path: "0", depth: 0, maximumDepth: 8, into: &overlayLayers)
                    }
                    entry["layers"] = overlayLayers
                    overlays.append(entry)
                }
                samples.value.append(["t": t, "doubleValue": s.doubleValue, "layers": layers,
                                      "overlayWindows": overlays])
                return NSNull()
            }, &error)
            if let error { samples.value.append(["t": t, "error": error as String]) }
            if t > 2.0 { timer.invalidate() }
        }
        RunLoop.main.add(sampler, forMode: .common)
        var timers: [Timer] = [sampler]
        for (delay, x) in steps {
            let timer = Timer(timeInterval: delay, repeats: false) { _ in
                sendMouse(.leftMouseDragged, at: CGPoint(x: x, y: start.y), window: window,
                          recorder: recorder, id: id)
            }
            RunLoop.main.add(timer, forMode: .common); timers.append(timer)
        }
        let holdShot = Timer(timeInterval: 0.75, repeats: false) { _ in
            let rect = window.convertToScreen(container.convert(container.bounds, to: nil)).insetBy(dx: -60, dy: -20)
            shots.value["held"] = captureScreen(rect, to: folder.appendingPathComponent("\(id).held.png"))
        }
        RunLoop.main.add(holdShot, forMode: .common); timers.append(holdShot)
        let release = Timer(timeInterval: 1.0, repeats: false) { _ in
            sendMouse(.leftMouseUp, at: CGPoint(x: endX + 100 * direction, y: start.y), window: window,
                      recorder: recorder, id: id)
        }
        RunLoop.main.add(release, forMode: .common); timers.append(release)
        let downEvent = NSEvent.mouseEvent(with: .leftMouseDown, location: start, modifierFlags: [],
                                           timestamp: ProcessInfo.processInfo.systemUptime,
                                           windowNumber: window.windowNumber, context: nil, eventNumber: 0,
                                           clickCount: 1, pressure: 1)
        var tracking = "sendEvent gesture"
        var downReturnedWithin20ms = false
        if let downEvent {
            let sent = ProcessInfo.processInfo.systemUptime
            recorder.guarded("\(id).sendEvent", { window.sendEvent(downEvent) })
            downReturnedWithin20ms = ProcessInfo.processInfo.systemUptime - sent < 0.02
            tracking = downReturnedWithin20ms ? "sendEvent gesture" : "sendEvent tracking loop"
        }
        recorder.put("\(id).tracking", tracking)
        recorder.put("\(id).mouseDownReturnedWithin20ms", downReturnedWithin20ms)
        recorder.put("\(id).trackingReturnedAt", Date().timeIntervalSince(began))
        // Settle after release while the sampler keeps running, then a late screenshot.
        let settleEnd = began.addingTimeInterval(1.6)
        while Date() < settleEnd { RunLoop.main.run(until: Date().addingTimeInterval(1.0 / 120.0)) }
        let rect = window.convertToScreen(container.convert(container.bounds, to: nil)).insetBy(dx: -60, dy: -20)
        shots.value["released"] = captureScreen(rect, to: folder.appendingPathComponent("\(id).released.png"))
        let drainEnd = began.addingTimeInterval(2.1)
        while Date() < drainEnd { RunLoop.main.run(until: Date().addingTimeInterval(1.0 / 120.0)) }
        timers.forEach { $0.invalidate() }
        recorder.put("\(id).finalValue", s.doubleValue)
        recorder.put("\(id).timeline", samples.value)
        recorder.put("\(id).screenshots", shots.value)
        recorder.guarded("\(id).cleanup", { container.removeFromSuperview() })
    }
}

// MARK: - Open menus

private func itemViewCenters(_ view: NSView, into out: inout [(String, CGPoint)]) {
    let name = NSStringFromClass(type(of: view))
    let frame = view.convert(view.bounds, to: nil)
    if name.contains("Item") && frame.height >= 10 && frame.height <= 40 {
        out.append((name, CGPoint(x: frame.midX, y: frame.midY)))
    }
    for child in view.subviews { itemViewCenters(child, into: &out) }
}

private func probeOpenMenu(name: String, menu: NSMenu, anchor: NSView, window: NSWindow, folder: URL,
                           recorder: ProbeRecorder, present: @escaping () -> Void) {
    let id = "openMenu.\(name)"
    let baseline = Set(NSApp.windows.map { $0.windowNumber })
    let began = Date()
    let openTimeline = Box<[[String: Any]]>([])
    let found = Box<[Int]>([])
    let sampler = Timer(timeInterval: 1.0 / 60.0, repeats: true) { timer in
        let t = Date().timeIntervalSince(began)
        var error: NSString?
        _ = SafeInvoke({
            openTimeline.value.append(["t": t, "windows": newWindows(excluding: baseline).map(windowEntry),
                                       "server": ownServerWindows()])
            return NSNull()
        }, &error)
        if let error { openTimeline.value.append(["t": t, "error": error as String]) }
        if t > 0.6 { timer.invalidate() }
    }
    RunLoop.main.add(sampler, forMode: .common)
    let inspect = Timer(timeInterval: 0.7, repeats: false) { _ in
        let windows = newWindows(excluding: baseline)
        found.value = windows.map { $0.windowNumber }
        var glassLayerEntries: [[String: Any]] = []
        recorder.put("\(id).windows", windows.map { w -> [String: Any] in
            var entry = windowEntry(w)
            entry["level"] = w.level.rawValue
            entry["hasShadow"] = w.hasShadow
            entry["isOpaque"] = w.isOpaque
            entry["backgroundColor"] = safeDescription(w.backgroundColor) ?? NSNull()
            if let frameView = w.contentView?.superview ?? w.contentView {
                entry["views"] = viewTree(frameView, depth: 0, maximumDepth: 12)
                entry["layers"] = frameView.layer.map { deepLayer($0, depth: 0, maximumDepth: 14) as Any } ?? NSNull()
                if name == "context" || name == "popup.regular", let layer = frameView.layer {
                    glassLayerEntries.append(contentsOf: layerPropertyDump(layer))
                }
            }
            return entry
        })
        if name == "context" || name == "popup.regular" {
            let key = "\(id).layerProperties"
            recorder.put(key, glassLayerEntries)
            if name == "context" {
                recorder.guarded("\(key).write", {
                    try? writeJSON(glassLayerEntries,
                                   to: folder.appendingPathComponent("openMenu.context.layerProperties.json"))
                })
            }
        }
        recorder.put("\(id).menuSize", probeSize(menu.size))
        recorder.put("\(id).menuFont", fontJSON(menu.font))
        var union = anchor.window.map { $0.convertToScreen(anchor.convert(anchor.bounds, to: nil)) } ?? .zero
        for w in windows { union = union.union(w.frame) }
        recorder.put("\(id).screenshot", captureScreen(union.insetBy(dx: -40, dy: -40),
                                                       to: folder.appendingPathComponent("\(id).open.png")))
        // Hover the second item view to capture the selection highlight.
        var centers: [(String, CGPoint)] = []
        if let w = windows.first, let frameView = w.contentView?.superview ?? w.contentView {
            itemViewCenters(frameView, into: &centers)
            recorder.put("\(id).itemViews", centers.map { ["class": $0.0, "x": $0.1.x, "y": $0.1.y] as [String: Any] })
            if centers.count > 1 {
                let target = centers[1].1
                postMouse(.mouseMoved, at: target, window: w)
                let global = w.convertToScreen(CGRect(origin: target, size: .zero)).origin
                let cg = CGPoint(x: global.x, y: primaryScreenFrame().maxY - global.y)
                recorder.put("\(id).hoverTarget", ["windowX": target.x, "windowY": target.y,
                                                   "globalX": cg.x, "globalY": cg.y,
                                                   "axTrusted": AXIsProcessTrusted()] as [String: Any])
                CGWarpMouseCursorPosition(cg)
                CGEvent(mouseEventSource: nil, mouseType: .mouseMoved, mouseCursorPosition: cg,
                        mouseButton: .left)?.post(tap: .cghidEventTap)
            } else {
                recorder.missing("\(id).hoverTarget", "fewer than two item views found")
            }
        }
    }
    RunLoop.main.add(inspect, forMode: .common)
    let highlighted = Timer(timeInterval: 1.05, repeats: false) { _ in
        recorder.putOptional("\(id).highlightedItem", "no highlighted item", menu.highlightedItem?.title)
        var union = CGRect.null
        for w in newWindows(excluding: baseline) { union = union.union(w.frame) }
        if !union.isNull {
            recorder.put("\(id).highlightScreenshot",
                         captureScreen(union.insetBy(dx: -40, dy: -40),
                                       to: folder.appendingPathComponent("\(id).highlight.png")))
            if let w = newWindows(excluding: baseline).first,
               let frameView = w.contentView?.superview ?? w.contentView {
                recorder.put("\(id).highlightLayers",
                             frameView.layer.map { deepLayer($0, depth: 0, maximumDepth: 14) as Any } ?? NSNull())
            }
        } else {
            recorder.missing("\(id).highlightScreenshot", "menu window gone")
        }
    }
    RunLoop.main.add(highlighted, forMode: .common)
    let cancel = Timer(timeInterval: 1.4, repeats: false) { _ in menu.cancelTracking() }
    RunLoop.main.add(cancel, forMode: .common)
    let fallback = Timer(timeInterval: 4.0, repeats: false) { _ in menu.cancelTrackingWithoutAnimation() }
    RunLoop.main.add(fallback, forMode: .common)
    parkCursor()
    recorder.guarded("\(id).present", present)
    let closedAt = Date()
    if recorder.values["\(id).windows"] == nil {
        recorder.missing("\(id).windows", "inspect timer did not fire during menu tracking")
    }
    recorder.put("\(id).trackingReturnedAt", closedAt.timeIntervalSince(began))
    // Close timeline: the windows found while open, sampled until they leave the screen.
    var closeTimeline: [[String: Any]] = []
    let watched = Set(found.value)
    while Date().timeIntervalSince(closedAt) < 0.6 {
        RunLoop.main.run(until: Date().addingTimeInterval(1.0 / 120.0))
        var error: NSString?
        let sample = SafeInvoke({
            let windows = NSApp.windows.filter { watched.contains($0.windowNumber) }
            return ["t": Date().timeIntervalSince(closedAt),
                    "windows": windows.map { w -> [String: Any] in
                        var e = windowEntry(w); e["isVisible"] = w.isVisible; return e
                    },
                    "server": ownServerWindows().filter { entry in
                        guard let number = entry["number"] as? Int else { return false }
                        return watched.contains(number)
                    }] as [String: Any]
        }, &error)
        if let sample { closeTimeline.append(sample as? [String: Any] ?? [:]) }
        else if let error { closeTimeline.append(["error": error as String]) }
    }
    [sampler, inspect, highlighted, cancel, fallback].forEach { $0.invalidate() }
    recorder.put("\(id).openTimeline", openTimeline.value)
    recorder.put("\(id).closeTimeline", closeTimeline)
}

private func probeMenusOpen(window: NSWindow, root: NSView, folder: URL, recorder: ProbeRecorder) {
    // Context menu: the `menu` scenario's item set plus a disabled item and a section header.
    var context: NSMenu?
    if recorder.guarded("openMenu.context.setup", {
        let menu = NSMenu(title: "Probe menu")
        menu.addItem(NSMenuItem.sectionHeader(title: "Section"))
        menu.addItem(withTitle: "Plain item", action: nil, keyEquivalent: "")
        let shortcut = menu.addItem(withTitle: "Run", action: nil, keyEquivalent: "r")
        shortcut.keyEquivalentModifierMask = .command
        let checked = menu.addItem(withTitle: "Checked", action: nil, keyEquivalent: "")
        checked.state = .on
        let disabled = NSMenuItem(title: "Disabled", action: nil, keyEquivalent: "")
        disabled.isEnabled = false
        menu.autoenablesItems = false
        menu.addItem(disabled)
        menu.addItem(NSMenuItem.separator())
        let parent = NSMenuItem(title: "Submenu", action: nil, keyEquivalent: "")
        let child = NSMenu(title: "Submenu")
        child.addItem(withTitle: "Child", action: nil, keyEquivalent: "")
        menu.addItem(parent); menu.setSubmenu(child, for: parent)
        let imageItem = menu.addItem(withTitle: "Image", action: nil, keyEquivalent: "")
        imageItem.image = NSImage(systemSymbolName: "star", accessibilityDescription: nil)
        context = menu
    }), let menu = context {
        let anchor = NSView(frame: CGRect(x: 40, y: 220, width: 1, height: 1))
        root.addSubview(anchor)
        probeOpenMenu(name: "context", menu: menu, anchor: anchor, window: window, folder: folder,
                      recorder: recorder) {
            _ = menu.popUp(positioning: nil, at: CGPoint(x: 40, y: 220), in: root)
        }
        anchor.removeFromSuperview()
    }
    for (name, pullsDown) in [("popup", false), ("pulldown", true)] {
        for sizeName in ["mini", "small", "regular", "large", "extraLarge"] {
            guard let size = controlSize(sizeName) else { continue }
            let id = "\(name).\(sizeName)"
            var made: NSPopUpButton?
            guard recorder.guarded("openMenu.\(id).setup", {
                let p = NSPopUpButton(frame: .zero, pullsDown: pullsDown)
                if pullsDown {
                    p.addItem(withTitle: "Actions")
                    p.addItems(withTitles: ["Duplicate", "Rename", "Move to Trash"])
                } else {
                    p.addItems(withTitles: ["Automatic", "Blue", "Pink", "Yellow"])
                    p.selectItem(at: 2)
                }
                p.controlSize = size
                p.font = NSFont.systemFont(ofSize: NSFont.systemFontSize(for: size))
                p.sizeToFit()
                p.frame.origin = CGPoint(x: 120, y: 140)
                root.addSubview(p)
                made = p
            }), let p = made, let menu = p.menu else { continue }
            recorder.guarded("openMenu.\(id).display", { window.displayIfNeeded() })
            settle()
            let buttonScreen = window.convertToScreen(p.convert(p.bounds, to: nil))
            recorder.put("openMenu.\(id).buttonFrameScreen", probeRect(buttonScreen))
            recorder.put("openMenu.\(id).buttonFont", fontJSON(p.font))
            recorder.put("openMenu.\(id).closedScreenshot",
                         captureScreen(buttonScreen.insetBy(dx: -20, dy: -12),
                                       to: folder.appendingPathComponent("openMenu.\(id).closed.png")))
            recorder.put("openMenu.\(id).buttonCache2x",
                         cacheRender(p, scale: 2, to: folder.appendingPathComponent("openMenu.\(id).closed@2x-cache.png")))
            probeOpenMenu(name: id, menu: menu, anchor: p, window: window, folder: folder, recorder: recorder) {
                p.performClick(nil)
            }
            recorder.guarded("openMenu.\(id).cleanup", { p.removeFromSuperview() })
        }
    }
}

// MARK: - Entry

private func windowIsOnScreen(_ window: NSWindow) -> Bool {
    ownServerWindows().contains { ($0["number"] as? Int) == window.windowNumber }
}

// The scenario path's activation sequence (main.swift `run`): the first probe run showed the probe
// window absent from the on-screen window list, so screenshots were black.
private func bringOnScreen(_ window: NSWindow, recorder: ProbeRecorder) {
    let began = Date()
    var askedLaunchServices = false
    recorder.guarded("deep.activation", {
        window.makeKeyAndOrderFront(nil)
        window.orderFrontRegardless()
        NSApp.activate(ignoringOtherApps: true)
        _ = NSRunningApplication.current.activate(options: [.activateAllWindows])
    })
    repeat {
        RunLoop.main.run(until: Date().addingTimeInterval(0.15))
        if windowIsOnScreen(window) && NSApp.isActive && window.isKeyWindow { break }
        if !askedLaunchServices {
            askedLaunchServices = true
            let launcher = Process()
            launcher.executableURL = URL(fileURLWithPath: "/usr/bin/open")
            launcher.arguments = ["-a", Bundle.main.bundleURL.path]
            if (try? launcher.run()) != nil { launcher.waitUntilExit() }
        }
        recorder.guarded("deep.activation.retry", {
            NSApp.unhide(nil)
            NSApp.activate(ignoringOtherApps: true)
            _ = NSRunningApplication.current.activate(options: [.activateAllWindows])
            window.makeKeyAndOrderFront(nil)
            window.orderFrontRegardless()
        })
    } while Date().timeIntervalSince(began) < 5
    RunLoop.main.run(until: Date().addingTimeInterval(0.5))
    parkCursor()
    recorder.put("deep.window", ["onScreen": windowIsOnScreen(window), "isVisible": window.isVisible,
                                 "isKey": window.isKeyWindow, "appActive": NSApp.isActive,
                                 "appHidden": NSApp.isHidden, "occlusionVisible": window.occlusionState.contains(.visible),
                                 "frame": probeRect(window.frame), "number": window.windowNumber,
                                 "activationSeconds": Date().timeIntervalSince(began)] as [String: Any])
}

// Moves the pointer to the bottom-right corner so it does not hover a control or menu item.
private func parkCursor() {
    let screen = primaryScreenFrame()
    CGWarpMouseCursorPosition(CGPoint(x: screen.maxX - 12, y: screen.maxY - 12))
}

// Stable raster references for every control used by the getter probes. The screen
// capture keeps the native 1x result; cacheDisplay gives a same-size 2x reference.
private func probeControlRenders(window: NSWindow, root: NSView, folder: URL, recorder: ProbeRecorder) {
    let kinds = ["button", "checkbox", "radio", "popup", "pulldown", "textfield", "search-empty",
                 "search-abc", "stepper", "slider", "progress", "switch", "segmented",
                 "colorwell-default", "colorwell-minimal", "colorwell-expanded", "combobox",
                 "datepicker", "levelindicator", "pathcontrol", "disclosure"]
    let sizes = ["mini", "small", "regular", "large", "extraLarge"]
    let renderFolder = folder.appendingPathComponent("render", isDirectory: true)
    do { try FileManager.default.createDirectory(at: renderFolder, withIntermediateDirectories: true) }
    catch { recorder.missing("render.folder", "could not create render folder: \(error)"); return }

    for sizeName in sizes {
        guard let size = controlSize(sizeName) else { continue }
        for kind in kinds {
            let states = (kind == "checkbox" || kind == "radio") ? ["off", "on", "mixed"]
                : kind == "switch" ? ["off", "on"]
                : kind == "search-empty" ? ["empty"]
                : kind == "search-abc" ? ["abc"] : ["default"]
            for state in states {
                let madeState = kind == "search-empty" ? "off" : kind == "search-abc" ? "on" : state
                let publicKind = kind.hasPrefix("search-") ? "searchfield" : kind
                let suffix = kind == "search-empty" ? ".empty" : kind == "search-abc" ? ".abc"
                    : state == "default" ? "" : ".\(state)"
                captureControlRender(kind: kind, sizeName: sizeName, size: size, state: madeState,
                                     id: "render.\(publicKind).\(sizeName)\(suffix)",
                                     disabled: false, window: window, root: root,
                                     folder: renderFolder, recorder: recorder)
            }
        }
    }
    let disabled: [(String, String)] = [("button", "default"), ("checkbox", "on"), ("popup", "default"),
                                        ("segmented", "default"), ("switch", "on")]
    guard let regular = controlSize("regular") else { return }
    for (kind, state) in disabled {
        captureControlRender(kind: kind, sizeName: "regular", size: regular, state: state,
                             id: "render.\(kind).regular\(state == "default" ? "" : ".\(state)").disabled",
                             disabled: true, window: window, root: root,
                             folder: renderFolder, recorder: recorder)
    }
}

private final class GroupingToolbarDelegate: NSObject, NSToolbarDelegate {
    let groupID = NSToolbarItem.Identifier("grouping.toolbar.group")
    let thirdID = NSToolbarItem.Identifier("grouping.toolbar.third")
    let childIDs = [NSToolbarItem.Identifier("grouping.toolbar.first"),
                    NSToolbarItem.Identifier("grouping.toolbar.second")]

    func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        [groupID, thirdID, .flexibleSpace]
    }

    func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        [groupID, thirdID]
    }

    func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier,
                 willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
        if itemIdentifier == groupID {
            let group = NSToolbarItemGroup(itemIdentifier: groupID)
            group.label = "Grouped glass"
            group.paletteLabel = "Grouped glass"
            group.subitems = zip(childIDs, ["First", "Second"]).map { identifier, label in
                let item = NSToolbarItem(itemIdentifier: identifier)
                item.label = label
                item.paletteLabel = label
                item.view = NSButton(title: label, target: nil, action: nil)
                return item
            }
            return group
        }
        guard itemIdentifier == thirdID else { return nil }
        let item = NSToolbarItem(itemIdentifier: thirdID)
        item.label = "Third"
        item.paletteLabel = "Third"
        item.view = NSButton(title: "Third", target: nil, action: nil)
        return item
    }
}

@available(macOS 26.0, *)
private func groupingCapsule() -> some View {
    Color.clear.frame(width: 60, height: 36).glassEffect(.regular, in: .capsule)
}

@available(macOS 26.0, *)
private func probeGlassGrouping(window: NSWindow, root: NSView, folder: URL, recorder: ProbeRecorder) {
    var cases: [(String, Int?, Int)] = []
    for spacing in [0, 8, 24] {
        for gap in [0, 6, 16, 40] {
            cases.append(("grouping.swiftui.s\(spacing).g\(gap)", spacing, gap))
        }
    }
    for gap in [6, 40] { cases.append(("grouping.swiftui.none.g\(gap)", nil, gap)) }

    for (id, spacing, gap) in cases {
        var box: NSView?
        var host: NSHostingView<AnyView>?
        guard recorder.guarded(id, {
            let content = HStack(spacing: CGFloat(gap)) { groupingCapsule(); groupingCapsule() }
            let view: AnyView
            if let spacing {
                view = AnyView(GlassEffectContainer(spacing: CGFloat(spacing)) { content })
            } else {
                view = AnyView(content)
            }
            let made = NSHostingView(rootView: view)
            made.frame = CGRect(x: 12, y: 12, width: 190, height: 72)
            let background = NSView(frame: CGRect(x: 10, y: 10, width: 214, height: 96))
            background.wantsLayer = true
            background.layer?.backgroundColor = NSColor(calibratedWhite: 0.52, alpha: 1).cgColor
            background.addSubview(made)
            root.addSubview(background)
            box = background; host = made
        }), let box, let host else { continue }
        window.displayIfNeeded(); settle(); settle()
        let base = folder.appendingPathComponent(id)
        recorder.put("\(id).layers", host.layer.map {
            layerPropertyDump($0, maximumDepth: 20, includeAllLayers: true)
        } ?? ["error": "hosting view has no layer"])
        let shotRect = window.convertToScreen(box.convert(box.bounds, to: nil))
        recorder.put("\(id).screenshot", captureScreen(shotRect, to: base.appendingPathExtension("png")))
        recorder.put("\(id).cache2x", cacheRender(box, scale: 2,
                                                   to: folder.appendingPathComponent("\(id)@2x-cache.png")))
        box.removeFromSuperview()
    }

    let toolbarID = "grouping.toolbar"
    let baseline = Set(NSApp.windows.map { $0.windowNumber })
    var toolbarWindow: NSWindow?
    var toolbarDelegate: GroupingToolbarDelegate?
    guard recorder.guarded(toolbarID, {
        let made = NSWindow(contentRect: CGRect(x: 260, y: 360, width: 500, height: 240),
                            styleMask: [.titled, .closable], backing: .buffered, defer: false)
        made.title = "Glass grouping toolbar"
        made.titlebarAppearsTransparent = false
        made.toolbarStyle = .unified
        let content = NSView(frame: made.contentView?.bounds ?? .zero)
        content.wantsLayer = true
        content.layer?.backgroundColor = NSColor(calibratedWhite: 0.52, alpha: 1).cgColor
        made.contentView = content
        let delegate = GroupingToolbarDelegate()
        let toolbar = NSToolbar(identifier: "grouping.toolbar")
        toolbar.delegate = delegate
        toolbar.displayMode = .iconAndLabel
        made.toolbar = toolbar
        made.center()
        made.makeKeyAndOrderFront(nil)
        toolbarWindow = made; toolbarDelegate = delegate
    }), let toolbarWindow else { return }
    _ = toolbarDelegate // Keep the toolbar delegate alive for the capture.
    _ = baseline
    toolbarWindow.displayIfNeeded(); settle(); settle()
    if let titlebarContainer = toolbarWindow.contentView?.superview ?? toolbarWindow.contentView,
       let layer = titlebarContainer.layer {
        recorder.put("\(toolbarID).layers", layerPropertyDump(layer, maximumDepth: 20,
                                                               includeAllLayers: true))
    } else {
        recorder.put("\(toolbarID).layers", ["error": "titlebar container has no layer"])
    }
    recorder.put("\(toolbarID).screenshot", captureScreen(toolbarWindow.frame,
                 to: folder.appendingPathComponent("grouping.toolbar.png")))
    toolbarWindow.orderOut(nil)
    for created in NSApp.windows where !baseline.contains(created.windowNumber) { created.orderOut(nil) }
}

private func probeGlassGroupingUnavailable(folder: URL, recorder: ProbeRecorder) {
    let ids = ([0, 8, 24].flatMap { s in [0, 6, 16, 40].map { "grouping.swiftui.s\(s).g\($0)" } }
               + [6, 40].map { "grouping.swiftui.none.g\($0)" })
    for id in ids {
        for suffix in ["layers", "screenshot", "cache2x"] {
            recorder.put("\(id).\(suffix)", ["error": "GlassEffectContainer/.glassEffect unavailable on this macOS runtime"])
        }
    }
    recorder.put("grouping.toolbar.layers", ["error": "glass grouping probe unavailable"])
    recorder.put("grouping.toolbar.screenshot", ["error": "glass grouping probe unavailable"])
    _ = folder
}

private func captureControlRender(kind: String, sizeName: String, size: NSControl.ControlSize,
                                  state: String, id: String, disabled: Bool, window: NSWindow,
                                  root: NSView, folder: URL, recorder: ProbeRecorder) {
    var container: NSView?
    var control: NSView?
    guard recorder.guarded(id, {
        guard let made = makeProbeControl(kind, size: size, state: state) else {
            recorder.missing(id, "control unavailable"); return
        }
        if disabled, let native = made as? NSControl { native.isEnabled = false }
        let frame = made.frame
        let box = NSView(frame: CGRect(x: 10, y: 10, width: frame.width + 48, height: frame.height + 48))
        made.frame = CGRect(origin: CGPoint(x: 24, y: 24), size: frame.size)
        box.addSubview(made)
        root.addSubview(box)
        container = box; control = made
    }), let container, let control else { return }
    window.displayIfNeeded(); settle(); settle()
    let controlFrame = probeRect(control.frame)
    recorder.put("\(id).controlFrame", controlFrame)
    let shotRect = window.convertToScreen(container.convert(container.bounds, to: nil))
    recorder.put("\(id).screenshot", captureScreen(shotRect,
                 to: folder.appendingPathComponent("\(id).png")))
    recorder.put("\(id).cache2x", cacheRender(container, scale: 2,
                 to: folder.appendingPathComponent("\(id)@2x.png")))
    container.removeFromSuperview()
}

// Push button measurements and role appearances.
private func probePushButtons(window: NSWindow, root: NSView, folder: URL, recorder: ProbeRecorder) {
    let sizes = ["mini", "small", "regular", "large", "extraLarge"]
    let titles: [(String, String)] = [("OK", "ok"), ("A", "a"), ("Cancel", "cancel"),
                                     ("Button", "button"), ("Save Changes", "saveChanges")]
    for sizeName in sizes {
        guard let size = controlSize(sizeName) else { continue }
        for (title, slug) in titles {
            let id = "pushWidth.\(sizeName).\(slug)"
            guard recorder.guarded(id, {
                let button = NSButton(title: title, target: nil, action: nil)
                button.bezelStyle = .push
                button.controlSize = size
                button.font = NSFont.systemFont(ofSize: NSFont.systemFontSize(for: size))
                button.sizeToFit()
                recorder.put("\(id).frame", probeRect(button.frame))
                recorder.put("\(id).intrinsicContentSize", probeSize(button.intrinsicContentSize))
                let insets = button.alignmentRectInsets
                recorder.put("\(id).alignmentRectInsets", ["top": insets.top, "left": insets.left,
                             "bottom": insets.bottom, "right": insets.right])
                if let cell = button.cell as? NSButtonCell {
                    recorder.put("\(id).titleRect", probeRect(cell.titleRect(forBounds: button.bounds)))
                } else {
                    recorder.missing("\(id).titleRect", "button cell unavailable")
                }
            }) else { continue }
        }
    }

    let roleVariants = ["plain", "default", "destructive", "destructiveDefault", "tinted"]
    let roles = [("Delete", "Delete"), ("OK", "OK")]
    let imageFolder = folder.appendingPathComponent("roles", isDirectory: true)
    do { try FileManager.default.createDirectory(at: imageFolder, withIntermediateDirectories: true) }
    catch { recorder.missing("role.folder", "could not create role folder: \(error)"); return }

    bringOnScreen(window, recorder: recorder)
    func roleWindowState() -> [String: Bool] {
        ["isKey": window.isKeyWindow, "isMain": window.isMainWindow, "appActive": NSApp.isActive]
    }
    recorder.put("role.windowState", roleWindowState())
    if !window.isKeyWindow {
        window.makeKey()
        RunLoop.main.run(until: Date().addingTimeInterval(0.3))
        recorder.put("role.windowStateRetry", roleWindowState())
    }
    window.displayIfNeeded(); settle(); settle()
    for sizeName in ["regular", "large"] {
        guard let size = controlSize(sizeName) else { continue }
        for (title, titleSlug) in roles {
            for variant in roleVariants {
                let id = "role.\(sizeName).\(titleSlug).\(variant)"
                var container: NSView?
                var button: NSButton?
                guard recorder.guarded(id, {
                    let made = NSButton(title: title, target: nil, action: nil)
                    made.bezelStyle = .push
                    made.controlSize = size
                    made.font = NSFont.systemFont(ofSize: NSFont.systemFontSize(for: size))
                    switch variant {
                    case "default": made.keyEquivalent = "\r"
                    case "destructive": made.hasDestructiveAction = true
                    case "destructiveDefault":
                        made.hasDestructiveAction = true
                        made.keyEquivalent = "\r"
                    case "tinted": made.bezelColor = .systemRed
                    default: break
                    }
                    made.sizeToFit()
                    let box = NSView(frame: CGRect(x: 10, y: 10,
                                                   width: made.frame.width + 48,
                                                   height: made.frame.height + 48))
                    made.frame = CGRect(origin: CGPoint(x: 24, y: 24), size: made.frame.size)
                    box.addSubview(made)
                    root.addSubview(box)
                    container = box; button = made
                }), let container, let button else { continue }
                window.displayIfNeeded(); settle(); settle()
                recorder.put("\(id).frame", probeRect(button.frame))
                if let cell = button.cell as? NSButtonCell {
                    recorder.put("\(id).titleRect", probeRect(cell.titleRect(forBounds: button.bounds)))
                } else {
                    recorder.missing("\(id).titleRect", "button cell unavailable")
                }
                let shotRect = window.convertToScreen(container.convert(container.bounds, to: nil))
                recorder.put("\(id).isKeyWindow", window.isKeyWindow)
                recorder.put("\(id).screenshot", captureScreen(shotRect,
                             to: imageFolder.appendingPathComponent("\(id).png")))
                recorder.put("\(id).cache2x", cacheRender(container, scale: 2,
                             to: imageFolder.appendingPathComponent("\(id)@2x-cache.png")))
                container.removeFromSuperview()
            }
        }
    }

    let swiftUIVariants = ["plain", "destructive", "prominent", "destructiveProminent", "cancel", "defaultAction"]
    for sizeName in ["regular", "large"] {
        guard let size = controlSize(sizeName) else { continue }
        for (title, titleSlug) in roles {
            for variant in swiftUIVariants {
                let id = "swiftuiRole.\(sizeName).\(titleSlug).\(variant)"
                var container: NSView?
                var hostingView: NSHostingView<AnyView>?
                guard recorder.guarded(id, {
                    let button: AnyView
                    switch variant {
                    case "destructive": button = AnyView(Button(title, role: .destructive) {})
                    case "prominent": button = AnyView(Button(title) {}.buttonStyle(.borderedProminent))
                    case "destructiveProminent": button = AnyView(Button(title, role: .destructive) {}.buttonStyle(.borderedProminent))
                    case "cancel": button = AnyView(Button(title, role: .cancel) {})
                    case "defaultAction": button = AnyView(Button(title) {}.keyboardShortcut(.defaultAction))
                    default: button = AnyView(Button(title) {})
                    }
                    let made = NSHostingView(rootView: AnyView(
                        button.controlSize(sizeName == "regular" ? .regular : .large)))
                    made.frame = CGRect(origin: .zero, size: made.fittingSize)
                    let box = NSView(frame: CGRect(x: 10, y: 10,
                                                   width: made.frame.width + 48,
                                                   height: made.frame.height + 48))
                    made.frame.origin = CGPoint(x: 24, y: 24)
                    box.addSubview(made)
                    root.addSubview(box)
                    container = box; hostingView = made
                }), let container, let hostingView else { continue }
                window.displayIfNeeded(); settle(); settle()
                recorder.put("\(id).frame", probeRect(hostingView.frame))
                let shotRect = window.convertToScreen(container.convert(container.bounds, to: nil))
                recorder.put("\(id).isKeyWindow", window.isKeyWindow)
                recorder.put("\(id).screenshot", captureScreen(shotRect,
                             to: imageFolder.appendingPathComponent("\(id).png")))
                recorder.put("\(id).cache2x", cacheRender(container, scale: 2,
                             to: imageFolder.appendingPathComponent("\(id)@2x-cache.png")))
                container.removeFromSuperview()
            }
        }
    }
}

func runDeepProbes(window: NSWindow, root: NSView, output: URL) throws {
    let recorder = ProbeRecorder()
    bringOnScreen(window, recorder: recorder)
    let folder = output.appendingPathComponent("deep", isDirectory: true)
    try FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
    let url = output.appendingPathComponent("deep.json")
    recorder.put("deep.axTrusted", AXIsProcessTrusted())
    recorder.put("deep.backingScale", window.backingScaleFactor)
    probeSliderTicks(window: window, root: root, folder: folder, recorder: recorder)
    probeVerticalSliderTicks(window: window, root: root, folder: folder, recorder: recorder)
    try? writeJSON(recorder.values, to: url)
    record("deep probes slider ticks complete count=\(recorder.values.count)")
    probeSliderDrag(window: window, root: root, folder: folder, recorder: recorder)
    try? writeJSON(recorder.values, to: url)
    record("deep probes slider drag complete count=\(recorder.values.count)")
    probeMenusOpen(window: window, root: root, folder: folder, recorder: recorder)
    probeControlRenders(window: window, root: root, folder: folder, recorder: recorder)
    probePushButtons(window: window, root: root, folder: folder, recorder: recorder)
    if #available(macOS 26.0, *) {
        probeGlassGrouping(window: window, root: root, folder: folder, recorder: recorder)
    } else {
        probeGlassGroupingUnavailable(folder: folder, recorder: recorder)
    }
    try writeJSON(recorder.values, to: url)
    record("deep probes complete count=\(recorder.values.count)")
}
