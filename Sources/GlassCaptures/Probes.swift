import AppKit
import QuartzCore
import SafeKVC
import ObjectiveC.runtime

// Runtime probes: values returned by the real AppKit on the runner, recorded as JSON. Every probe runs
// through SafeInvoke so an Objective-C exception becomes an explicit error instead of killing the pass.
private final class ProbeRecorder {
    var values: [String: [String: Any]] = [:]

    func put(_ id: String, _ value: @autoclosure () -> Any?) {
        var error: NSString?
        let result = SafeInvoke({ value() }, &error)
        if let error { values[id] = ["value": NSNull(), "error": error as String] }
        else if let result { values[id] = ["value": result, "error": NSNull()] }
        else { values[id] = ["value": NSNull(), "error": "nil result"] }
    }

    func missing(_ id: String, _ reason: String) {
        values[id] = ["value": NSNull(), "error": reason]
    }

    // Runs side-effecting setup that may raise; returns false (and records `id`) on an exception.
    func guarded(_ id: String, _ body: () -> Void) -> Bool {
        var error: NSString?
        _ = SafeInvoke({ body(); return NSNull() }, &error)
        if let error { missing(id, "setup raised \(error)"); return false }
        return true
    }
}

private func probeRect(_ r: CGRect) -> [String: CGFloat] {
    ["x": r.minX, "y": r.minY, "width": r.width, "height": r.height]
}
private func probeSize(_ s: CGSize) -> [String: CGFloat] { ["width": s.width, "height": s.height] }
private func probeInsets(_ i: NSEdgeInsets) -> [String: CGFloat] {
    ["top": i.top, "left": i.left, "bottom": i.bottom, "right": i.right]
}
private func probeLayer(_ layer: CALayer, depth: Int = 0) -> [String: Any] {
    var d = layerJSON(layer, depth: depth)
    d["backgroundColor"] = layer.backgroundColor.map { safeDescription($0) as Any } ?? NSNull()
    d["borderColor"] = layer.borderColor.map { safeDescription($0) as Any } ?? NSNull()
    d["borderWidth"] = layer.borderWidth
    d["contentsPresent"] = layer.contents != nil
    d["sublayers"] = (layer.sublayers ?? []).map { probeLayer($0, depth: depth + 1) }
    return d
}

// Resolves a (possibly dynamic, catalog-backed) colour in `appearance`. Dynamic colours must not be
// asked for `colorSpace` or components directly; converting inside the drawing appearance resolves
// them. Extended sRGB keeps wide-gamut and >1 components unclamped.
private func probeColor(_ color: NSColor, appearance: NSAppearance) -> [String: Any] {
    var result: [String: Any] = [:]
    appearance.performAsCurrentDrawingAppearance {
        let type: String
        switch color.type {
        case .componentBased: type = "componentBased"
        case .catalog: type = "catalog"
        case .pattern: type = "pattern"
        @unknown default: type = "unknown"
        }
        result["type"] = type
        if let c = color.usingColorSpace(.extendedSRGB) {
            result["extendedSRGB"] = ["r": c.redComponent, "g": c.greenComponent,
                                      "b": c.blueComponent, "a": c.alphaComponent]
        } else { result["extendedSRGB"] = NSNull() }
        if let resolved = color.usingType(.componentBased) {
            result["resolvedColorSpace"] = resolved.colorSpace.localizedName ?? "unnamed"
        }
    }
    return result
}

private func semanticColor(_ name: String) -> NSColor? {
    let selector = NSSelectorFromString(name)
    guard NSColor.responds(to: selector), let unmanaged = NSColor.perform(selector) else { return nil }
    return unmanaged.takeUnretainedValue() as? NSColor
}

private func fontJSON(_ font: NSFont?) -> Any? {
    guard let font else { return nil }
    return ["name": font.fontName, "pointSize": font.pointSize]
}

private func controlSize(_ name: String) -> NSControl.ControlSize? {
    switch name {
    case "mini": return .mini
    case "small": return .small
    case "regular": return .regular
    case "large": return .large
    case "extraLarge": return .extraLarge
    default: return nil
    }
}

private func settle() { RunLoop.main.run(until: Date().addingTimeInterval(0.05)) }

private func captureControl(_ control: NSView, id: String, recorder: ProbeRecorder) {
    recorder.put("\(id).frame", probeRect(control.frame))
    recorder.put("\(id).intrinsicContentSize", probeSize(control.intrinsicContentSize))
    recorder.put("\(id).fittingSize", probeSize(control.fittingSize))
    recorder.put("\(id).alignmentRectInsets", probeInsets(control.alignmentRectInsets))
    recorder.put("\(id).firstBaselineOffsetFromTop", control.firstBaselineOffsetFromTop)
    recorder.put("\(id).lastBaselineOffsetFromBottom", control.lastBaselineOffsetFromBottom)
    if let layer = control.layer { recorder.put("\(id).layers", probeLayer(layer)) }
    else { recorder.missing("\(id).layers", "control has no layer") }
}

private func makeProbeControl(_ kind: String, size: NSControl.ControlSize, state: String) -> NSView? {
    let c: NSView
    switch kind {
    case "button":
        let b = NSButton(title: "Button", target: nil, action: nil); b.bezelStyle = .rounded; c = b
    case "checkbox": c = NSButton(checkboxWithTitle: "Checkbox", target: nil, action: nil)
    case "radio": c = NSButton(radioButtonWithTitle: "Radio", target: nil, action: nil)
    case "popup":
        let p = NSPopUpButton(frame: .zero, pullsDown: false)
        p.addItems(withTitles: ["Automatic", "Blue", "Pink", "Yellow"]); p.selectItem(at: 2); c = p
    case "pulldown":
        let p = NSPopUpButton(frame: .zero, pullsDown: true)
        p.addItem(withTitle: "Actions"); p.addItems(withTitles: ["Duplicate", "Rename", "Move to Trash"]); c = p
    case "textfield":
        let t = NSTextField(string: "Value"); t.isEditable = true; t.isBezeled = true; c = t
    case "search-empty", "search-abc": c = NSSearchField(string: kind == "search-abc" ? "abc" : "")
    case "stepper": c = NSStepper()
    case "slider": c = NSSlider(value: 0.5, minValue: 0, maxValue: 1, target: nil, action: nil)
    case "progress":
        let p = NSProgressIndicator(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        p.style = .bar; p.isIndeterminate = false; p.minValue = 0; p.maxValue = 100; p.doubleValue = 30; c = p
    case "switch": let s = NSSwitch(); s.state = state == "on" ? .on : .off; c = s
    case "segmented":
        let s = NSSegmentedControl(labels: ["One", "Two", "Three"], trackingMode: .selectOne,
                                   target: nil, action: nil)
        s.selectedSegment = 1; c = s
    default: return nil
    }
    if let control = c as? NSControl { control.controlSize = size }
    if let p = c as? NSProgressIndicator { p.controlSize = size }
    if let b = c as? NSButton, kind == "checkbox" || kind == "radio" {
        b.allowsMixedState = true
        b.state = state == "on" ? .on : state == "mixed" ? .mixed : .off
    }
    // Size to content, then fix the width of controls whose geometry depends on it.
    if let control = c as? NSControl { control.sizeToFit() }
    else { c.frame.size = c.fittingSize }
    if kind == "slider" { c.frame.size.width = 200 }
    if kind == "progress" { c.frame.size.width = 200 }
    if kind.hasPrefix("search") || kind == "textfield" { c.frame.size.width = 200 }
    return c
}

private func controlExtras(_ control: NSView, id: String, recorder: ProbeRecorder) {
    if let popup = control as? NSPopUpButton, let cell = popup.cell as? NSPopUpButtonCell {
        let b = popup.bounds
        recorder.put("\(id).titleRect", probeRect(cell.titleRect(forBounds: b)))
        recorder.put("\(id).imageRect", probeRect(cell.imageRect(forBounds: b)))
        recorder.put("\(id).drawingRect", probeRect(cell.drawingRect(forBounds: b)))
    }
    if let search = control as? NSSearchField, let cell = search.cell as? NSSearchFieldCell {
        for width: CGFloat in [120, 200, 300] {
            let b = CGRect(x: 0, y: 0, width: width, height: search.frame.height)
            let suffix = "w\(Int(width))"
            recorder.put("\(id).searchButtonRect.\(suffix)", probeRect(cell.searchButtonRect(forBounds: b)))
            recorder.put("\(id).cancelButtonRect.\(suffix)", probeRect(cell.cancelButtonRect(forBounds: b)))
            recorder.put("\(id).searchTextRect.\(suffix)", probeRect(cell.searchTextRect(forBounds: b)))
        }
    }
    if let slider = control as? NSSlider, let cell = slider.cell as? NSSliderCell {
        recorder.put("\(id).knobRect", probeRect(cell.knobRect(flipped: slider.isFlipped)))
        recorder.put("\(id).barRect", probeRect(cell.barRect(flipped: slider.isFlipped)))
        recorder.put("\(id).knobThickness", cell.knobThickness)
        for only in [false, true] {
            let variant = only ? "tickOnly" : "ticks"
            for (positionName, position) in [("below", NSSlider.TickMarkPosition.below), ("above", .above)] {
                let key = "\(id).\(variant).\(positionName)"
                guard recorder.guarded(key, {
                    slider.numberOfTickMarks = 5
                    slider.allowsTickMarkValuesOnly = only
                    slider.tickMarkPosition = position
                    slider.sizeToFit()
                    slider.frame.size.width = 200
                }) else { continue }
                settle()
                recorder.put("\(key).frame", probeRect(slider.frame))
                recorder.put("\(key).knobRect", probeRect(cell.knobRect(flipped: slider.isFlipped)))
                recorder.put("\(key).barRect", probeRect(cell.barRect(flipped: slider.isFlipped)))
                for i in 0..<5 {
                    recorder.put("\(key).rectOfTickMark.\(i)", probeRect(cell.rectOfTickMark(at: i)))
                }
            }
        }
    }
    if let segmented = control as? NSSegmentedControl {
        for i in 0..<segmented.segmentCount {
            recorder.put("\(id).widthForSegment.\(i)", segmented.width(forSegment: i))
        }
    }
}

private func probeScroller(id: String, window: NSWindow, recorder: ProbeRecorder) {
    let scroll = NSScrollView(frame: CGRect(x: 100, y: 40, width: 180, height: 220))
    let doc = NSView(frame: CGRect(x: 0, y: 0, width: 160, height: 660))
    guard recorder.guarded("\(id).setup", {
        scroll.hasVerticalScroller = true
        scroll.hasHorizontalScroller = false
        scroll.scrollerStyle = .overlay
        scroll.documentView = doc
        window.contentView?.addSubview(scroll)
        scroll.contentView.scroll(to: CGPoint(x: 0, y: 220))
        scroll.reflectScrolledClipView(scroll.contentView)
        scroll.flashScrollers()
    }) else { return }
    settle()
    guard let scroller = scroll.verticalScroller else {
        recorder.missing("\(id).scroller", "vertical scroller unavailable"); return
    }
    recorder.put("\(id).frame", probeRect(scroller.frame))
    recorder.put("\(id).knobRect", probeRect(scroller.rect(for: .knob)))
    recorder.put("\(id).knobSlotRect", probeRect(scroller.rect(for: .knobSlot)))
    recorder.put("\(id).knobProportion", scroller.knobProportion)
    if let layer = scroller.layer { recorder.put("\(id).layers", probeLayer(layer)) }
    else { recorder.missing("\(id).layers", "scroller has no layer") }
    guard let imp = SafeValueForKey(scroller, "scrollerImp") as AnyObject? else {
        recorder.missing("\(id).scrollerImp", "scrollerImp unavailable"); return
    }
    recorder.put("\(id).scrollerImp", NSStringFromClass(type(of: imp)))
    // Read-only getters; KVC boxes the CGFloat results.
    for key in ["trackWidth", "trackSideInset", "trackBoxWidth", "knobMinLength", "knobEndInset",
                "knobAlpha", "trackAlpha", "expansionTransitionProgress"] {
        if let value = SafeValueForKey(imp, key) { recorder.put("\(id).\(key)", safeDescription(value)) }
        else { recorder.missing("\(id).\(key)", "KVC value unavailable") }
    }
}

func runProbes(appearance: String, output: String) throws {
    let recorder = ProbeRecorder()
    let appAppearance = NSAppearance(named: appearance == "dark" ? .darkAqua : .aqua)!
    NSApp.appearance = appAppearance
    let folder = URL(fileURLWithPath: output, isDirectory: true)
    try FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
    let probesURL = folder.appendingPathComponent("probes.json")
    record("probe start appearance=\(appearance) output=\(output)")

    // Fonts and metric class methods.
    for sizeName in ["mini", "small", "regular", "large", "extraLarge"] {
        let size = controlSize(sizeName)!
        recorder.put("font.systemFontSize.\(sizeName)", NSFont.systemFontSize(for: size))
    }
    recorder.put("font.smallSystemFontSize", NSFont.smallSystemFontSize)
    recorder.put("font.systemFontSize", NSFont.systemFontSize)
    recorder.put("font.labelFontSize", NSFont.labelFontSize)
    recorder.put("font.toolTipsFont", fontJSON(NSFont.toolTipsFont(ofSize: 0)))
    recorder.put("font.menuFont", fontJSON(NSFont.menuFont(ofSize: 0)))
    recorder.put("font.menuBarFont", fontJSON(NSFont.menuBarFont(ofSize: 0)))
    for sizeName in ["regular", "small", "mini"] {
        let size = controlSize(sizeName)!
        for (styleName, style) in [("overlay", NSScroller.Style.overlay), ("legacy", .legacy)] {
            recorder.put("scroller.width.\(sizeName).\(styleName)",
                         NSScroller.scrollerWidth(for: size, scrollerStyle: style))
        }
    }
    try? writeJSON(recorder.values, to: probesURL)
    record("probe metrics complete count=\(recorder.values.count)")

    // Semantic colours, resolved in this pass's appearance.
    let colors = ["labelColor", "secondaryLabelColor", "tertiaryLabelColor", "quaternaryLabelColor",
                  "quinaryLabelColor", "systemFillColor", "secondarySystemFillColor",
                  "tertiarySystemFillColor", "quaternarySystemFillColor", "quinarySystemFillColor",
                  "textColor", "placeholderTextColor", "selectedTextColor", "textBackgroundColor",
                  "selectedTextBackgroundColor", "keyboardFocusIndicatorColor",
                  "unemphasizedSelectedTextColor", "unemphasizedSelectedTextBackgroundColor",
                  "linkColor", "separatorColor", "gridColor", "headerTextColor", "controlColor",
                  "controlBackgroundColor", "controlTextColor", "selectedControlColor",
                  "selectedControlTextColor", "alternateSelectedControlTextColor",
                  "selectedContentBackgroundColor", "unemphasizedSelectedContentBackgroundColor",
                  "selectedMenuItemTextColor", "disabledControlTextColor", "windowBackgroundColor",
                  "windowFrameTextColor", "underPageBackgroundColor", "findHighlightColor",
                  "highlightColor", "shadowColor", "textInsertionPointColor", "controlAccentColor",
                  "systemRedColor", "systemOrangeColor", "systemYellowColor", "systemGreenColor",
                  "systemMintColor", "systemTealColor", "systemCyanColor", "systemBlueColor",
                  "systemIndigoColor", "systemPurpleColor", "systemPinkColor", "systemBrownColor",
                  "systemGrayColor", "scrubberTexturedBackground"]
    for name in colors {
        let id = "color.\(name)"
        guard let color = semanticColor(name) else {
            recorder.missing(id, "semantic color unavailable on this runtime"); continue
        }
        recorder.put(id, probeColor(color, appearance: appAppearance))
    }
    try? writeJSON(recorder.values, to: probesURL)
    record("probe colors complete count=\(recorder.values.count)")

    // Controls, in a visible window after a run-loop turn so their layers exist.
    let window = NSWindow(contentRect: CGRect(x: 100, y: 100, width: 440, height: 300),
                          styleMask: [.titled], backing: .buffered, defer: false)
    window.isReleasedWhenClosed = false
    window.appearance = appAppearance
    window.title = "Runtime probes"
    let root = NSView(frame: window.contentView?.bounds ?? .zero)
    root.autoresizingMask = [.width, .height]
    root.wantsLayer = true
    window.contentView = root
    window.makeKeyAndOrderFront(nil)
    NSApp.activate(ignoringOtherApps: true)
    settle()
    let kinds = ["button", "checkbox", "radio", "popup", "pulldown", "textfield", "search-empty",
                 "search-abc", "stepper", "slider", "progress", "switch", "segmented"]
    for sizeName in ["mini", "small", "regular", "large", "extraLarge"] {
        let size = controlSize(sizeName)!
        for kind in kinds {
            let states = (kind == "checkbox" || kind == "radio") ? ["off", "on", "mixed"]
                : kind == "switch" ? ["off", "on"] : ["default"]
            for state in states {
                let publicKind = kind.hasPrefix("search") ? "searchfield" : kind
                let suffix = kind == "search-empty" ? ".empty" : kind == "search-abc" ? ".abc"
                    : state == "default" ? "" : ".\(state)"
                let id = "control.\(publicKind).\(sizeName)\(suffix)"
                var made: NSView?
                guard recorder.guarded(id, { made = makeProbeControl(kind, size: size, state: state) }),
                      let c = made else {
                    if recorder.values[id] == nil { recorder.missing(id, "control unavailable") }
                    continue
                }
                c.frame.origin = CGPoint(x: 18, y: 18)
                root.addSubview(c)
                window.displayIfNeeded()
                settle()
                captureControl(c, id: id, recorder: recorder)
                controlExtras(c, id: id, recorder: recorder)
                c.removeFromSuperview()
            }
        }
        try? writeJSON(recorder.values, to: probesURL)
        record("probe controls complete size=\(sizeName) count=\(recorder.values.count)")
    }
    probeScroller(id: "scroller.regular.overlay", window: window, recorder: recorder)
    try writeJSON(recorder.values, to: probesURL)
    record("probe scroller complete count=\(recorder.values.count)")

    let version = ProcessInfo.processInfo.operatingSystemVersion
    let env: [String: Any] = [
        "os": "\(version.majorVersion).\(version.minorVersion).\(version.patchVersion)",
        "osBuild": systemFact("kern.osversion"),
        "effectiveAppearance": window.effectiveAppearance.name.rawValue,
        "increaseContrast": NSWorkspace.shared.accessibilityDisplayShouldIncreaseContrast,
        "reduceTransparency": NSWorkspace.shared.accessibilityDisplayShouldReduceTransparency,
        "reduceMotion": NSWorkspace.shared.accessibilityDisplayShouldReduceMotion,
        "differentiateWithoutColor": NSWorkspace.shared.accessibilityDisplayShouldDifferentiateWithoutColor,
        "accent": probeColor(NSColor.controlAccentColor, appearance: appAppearance),
        "backingScale": window.backingScaleFactor
    ]
    try writeJSON(env, to: folder.appendingPathComponent("env.json"))
    record("probe complete appearance=\(appearance) count=\(recorder.values.count)")
    window.close()
}
