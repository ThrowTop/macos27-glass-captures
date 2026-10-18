import AppKit
import QuartzCore
import ScreenCaptureKit
import SafeKVC
import ApplicationServices

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
    for sizeName in ["mini", "small", "regular", "large"] {
        guard let size = controlSize(sizeName) else { continue }
        for (variant, ticks, only) in variants {
            for (positionName, position) in [("below", NSSlider.TickMarkPosition.below), ("above", .above)] {
                if ticks == 0 && positionName == "above" { continue }
                let id = "slider.\(sizeName).\(variant).\(positionName)"
                let container = NSView(frame: CGRect(x: 10, y: 10, width: 240, height: 64))
                var made: NSSlider?
                guard recorder.guarded(id, {
                    let s = NSSlider(value: 0.4, minValue: 0, maxValue: 1, target: nil, action: nil)
                    s.controlSize = size
                    s.numberOfTickMarks = ticks
                    s.allowsTickMarkValuesOnly = only
                    s.tickMarkPosition = position
                    s.sizeToFit()
                    s.frame = CGRect(x: 20, y: 20, width: 200, height: s.frame.height)
                    container.addSubview(s)
                    root.addSubview(container)
                    made = s
                }), let s = made, let cell = s.cell as? NSSliderCell else { continue }
                recorder.guarded("\(id).display", { window.displayIfNeeded() })
                settle(); settle()
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
                recorder.guarded("\(id).cleanup", { container.removeFromSuperview() })
            }
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

private func postQuartzMouse(_ type: CGEventType, at p: CGPoint, window: NSWindow,
                             recorder: ProbeRecorder, id: String) {
    recorder.guarded("\(id).event.\(type.rawValue)", {
        let screen = window.convertToScreen(CGRect(origin: p, size: .zero)).origin
        let quartz = CGPoint(x: screen.x, y: primaryScreenFrame().maxY - screen.y)
        CGEvent(mouseEventSource: nil, mouseType: type, mouseCursorPosition: quartz,
                mouseButton: .left)?.post(tap: .cghidEventTap)
    })
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
                postQuartzMouse(.leftMouseDragged, at: CGPoint(x: x, y: start.y), window: window,
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
            postQuartzMouse(.leftMouseUp, at: CGPoint(x: endX + 100 * direction, y: start.y), window: window,
                            recorder: recorder, id: id)
        }
        RunLoop.main.add(release, forMode: .common); timers.append(release)
        postQuartzMouse(.leftMouseDown, at: start, window: window, recorder: recorder, id: id)
        let tracking = "CGEvent.post"
        recorder.put("\(id).tracking", tracking)
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
        recorder.put("\(id).windows", windows.map { w -> [String: Any] in
            var entry = windowEntry(w)
            entry["level"] = w.level.rawValue
            entry["hasShadow"] = w.hasShadow
            entry["isOpaque"] = w.isOpaque
            entry["backgroundColor"] = safeDescription(w.backgroundColor) ?? NSNull()
            if let frameView = w.contentView?.superview ?? w.contentView {
                entry["views"] = viewTree(frameView, depth: 0, maximumDepth: 12)
                entry["layers"] = frameView.layer.map { deepLayer($0, depth: 0, maximumDepth: 14) as Any } ?? NSNull()
            }
            return entry
        })
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

func runDeepProbes(window: NSWindow, root: NSView, output: URL) throws {
    let recorder = ProbeRecorder()
    bringOnScreen(window, recorder: recorder)
    let folder = output.appendingPathComponent("deep", isDirectory: true)
    try FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
    let url = output.appendingPathComponent("deep.json")
    recorder.put("deep.axTrusted", AXIsProcessTrusted())
    recorder.put("deep.backingScale", window.backingScaleFactor)
    probeSliderTicks(window: window, root: root, folder: folder, recorder: recorder)
    try? writeJSON(recorder.values, to: url)
    record("deep probes slider ticks complete count=\(recorder.values.count)")
    probeSliderDrag(window: window, root: root, folder: folder, recorder: recorder)
    try? writeJSON(recorder.values, to: url)
    record("deep probes slider drag complete count=\(recorder.values.count)")
    probeMenusOpen(window: window, root: root, folder: folder, recorder: recorder)
    try writeJSON(recorder.values, to: url)
    record("deep probes complete count=\(recorder.values.count)")
}
