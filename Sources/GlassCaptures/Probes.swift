import AppKit
import QuartzCore
import SafeKVC
import ObjectiveC.runtime

private struct ProbeValue {
    var value: Any
    var error: String? = nil
    var json: [String: Any] { ["value": value, "error": error as Any? ?? NSNull()] }
}

private final class ProbeRecorder {
    var values: [String: [String: Any]] = [:]
    func put(_ id: String, _ value: Any) { values[id] = ProbeValue(value: value).json }
    func attempt(_ id: String, _ body: () throws -> Any) {
        do { put(id, try body()) }
        catch { values[id] = ProbeValue(value: NSNull(), error: String(describing: error)).json }
    }
    func missing(_ id: String, _ reason: String) {
        values[id] = ProbeValue(value: NSNull(), error: reason).json
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
    d["backgroundColor"] = layer.backgroundColor.map { safeDescription($0) } ?? NSNull()
    d["borderColor"] = layer.borderColor.map { safeDescription($0) } ?? NSNull()
    d["borderWidth"] = layer.borderWidth
    d["contentsPresent"] = layer.contents != nil
    d["sublayers"] = (layer.sublayers ?? []).map { probeLayer($0, depth: depth + 1) }
    return d
}

private func probeColor(_ color: NSColor) -> [String: Any]? {
    let original = color.colorSpace.localizedName ?? String(describing: color.colorSpaceName)
    guard let resolved = color.usingColorSpace(.sRGB) else {
        return nil
    }
    return ["color_space": original,
            "sRGB": ["r": resolved.redComponent, "g": resolved.greenComponent,
                     "b": resolved.blueComponent, "a": resolved.alphaComponent]]
}

private func semanticColor(_ name: String) -> NSColor? {
    let selector = NSSelectorFromString(name)
    guard NSColor.responds(to: selector), let unmanaged = NSColor.perform(selector) else { return nil }
    return unmanaged.takeUnretainedValue() as? NSColor
}

private func probeFont(_ recorder: ProbeRecorder, _ id: String, _ body: () -> NSFont?) {
    if let font = body() { recorder.put(id, ["name": font.fontName, "pointSize": font.pointSize]) }
    else { recorder.missing(id, "AppKit returned no font") }
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

private func captureControl(_ control: NSControl, id: String, recorder: ProbeRecorder) {
    control.sizeToFit()
    recorder.put("\(id).frame", probeRect(control.frame))
    recorder.put("\(id).intrinsicContentSize", probeSize(control.intrinsicContentSize))
    recorder.put("\(id).fittingSize", probeSize(control.fittingSize))
    recorder.put("\(id).alignmentRectInsets", probeInsets(control.alignmentRectInsets))
    let cls: AnyObject = control
    for (key, label) in [("firstBaselineOffsetFromTop", "firstBaselineOffsetFromTop"),
                          ("lastBaselineOffsetFromBottom", "lastBaselineOffsetFromBottom")] {
        let selector = NSSelectorFromString(key)
        if cls.responds(to: selector), let value = SafeValueForKey(cls, key) {
            recorder.put("\(id).\(label)", safeDescription(value) ?? NSNull())
        } else { recorder.missing("\(id).\(label)", "selector unavailable") }
    }
    control.wantsLayer = true
    if let layer = control.layer { recorder.put("\(id).layers", probeLayer(layer)) }
    else { recorder.missing("\(id).layers", "control has no layer") }
}

private func makeProbeControl(_ kind: String, size: NSControl.ControlSize, state: String) -> NSControl? {
    let c: NSControl
    switch kind {
    case "button": let b = NSButton(title: "Button", target: nil, action: nil); b.bezelStyle = .rounded; c = b
    case "checkbox": let b = NSButton(checkboxWithTitle: "Checkbox", target: nil, action: nil); c = b
    case "radio": let b = NSButton(radioButtonWithTitle: "Radio", target: nil, action: nil); c = b
    case "popup":
        let p = NSPopUpButton(frame: .zero, pullsDown: false); p.addItems(withTitles: ["Automatic", "Blue", "Pink", "Yellow"]); p.selectItem(at: 2); c = p
    case "pulldown":
        let p = NSPopUpButton(frame: .zero, pullsDown: true); p.addItem(withTitle: "Actions"); p.addItems(withTitles: ["Duplicate", "Rename", "Move to Trash"]); c = p
    case "textfield": let t = NSTextField(string: "Value"); t.isEditable = true; t.isBezeled = true; c = t
    case "search-empty", "search-abc": let s = NSSearchField(string: kind == "search-abc" ? "abc" : ""); c = s
    case "stepper": c = NSStepper()
    case "slider": let s = NSSlider(value: 0.5, minValue: 0, maxValue: 1, target: nil, action: nil); s.frame.size = CGSize(width: 200, height: 28); c = s
    case "progress": let p = NSProgressIndicator(frame: CGRect(x: 0, y: 0, width: 200, height: 20)); p.style = .bar; p.isIndeterminate = false; p.minValue = 0; p.maxValue = 100; p.doubleValue = 30; c = p
    case "switch": let s = NSSwitch(); s.state = state == "on" ? .on : .off; c = s
    case "segmented": let s = NSSegmentedControl(labels: ["One", "Two", "Three"], trackingMode: .selectOne); s.selectedSegment = 1; c = s
    case "scrollview": return nil
    default: return nil
    }
    c.controlSize = size
    if let b = c as? NSButton, kind == "checkbox" || kind == "radio" {
        b.allowsMixedState = true; b.state = state == "on" ? .on : state == "mixed" ? .mixed : .off
    }
    return c
}

private func controlExtras(_ control: NSControl, kind: String, id: String, recorder: ProbeRecorder) {
    if let popup = control as? NSPopUpButton, let cell = popup.cell as? NSPopUpButtonCell {
        let b = popup.bounds
        recorder.put("\(id).titleRect", probeRect(cell.titleRect(forBounds: b)))
        recorder.put("\(id).imageRect", probeRect(cell.imageRect(forBounds: b)))
        recorder.put("\(id).drawingRect", probeRect(cell.drawingRect(forBounds: b)))
    }
    if let search = control as? NSSearchField, let cell = search.cell as? NSSearchFieldCell {
        for width: CGFloat in [120, 200, 300] {
            let b = CGRect(x: 0, y: 0, width: width, height: search.fittingSize.height)
            let suffix = "w\(Int(width))"
            recorder.put("\(id).searchButtonRect.\(suffix)", probeRect(cell.searchButtonRect(forBounds: b)))
            recorder.put("\(id).cancelButtonRect.\(suffix)", probeRect(cell.cancelButtonRect(forBounds: b)))
            recorder.put("\(id).searchTextRect.\(suffix)", probeRect(cell.searchTextRect(forBounds: b)))
        }
    }
    if let slider = control as? NSSlider, let cell = slider.cell as? NSSliderCell {
        recorder.put("\(id).knobRect", probeRect(cell.knobRect(flipped: false)))
        recorder.put("\(id).barRect", probeRect(cell.barRect(flipped: false)))
        recorder.put("\(id).knobThickness", cell.knobThickness)
        slider.numberOfTickMarks = 5
        for only in [false, true] {
            slider.allowsTickMarkValuesOnly = only
            let variant = only ? "tickOnly" : "ticks"
            for i in 0..<5 { recorder.put("\(id).\(variant).rectOfTickMark.\(i)", probeRect(cell.rectOfTickMark(at: i))) }
            for position in [NSSlider.TickMarkPosition.above, .below] {
                slider.tickMarkPosition = position
                recorder.put("\(id).\(variant).tickMarkPosition.\(position == .above ? "above" : "below")", position.rawValue)
            }
        }
    }
    if let segmented = control as? NSSegmentedControl {
        for i in 0..<segmented.segmentCount { recorder.put("\(id).widthForSegment.\(i)", segmented.width(forSegment: i)) }
    }
}

private func probeScroller(id: String, window: NSWindow, recorder: ProbeRecorder) {
    let scroll = NSScrollView(frame: CGRect(x: 100, y: 80, width: 180, height: 220))
    scroll.hasVerticalScroller = true; scroll.hasHorizontalScroller = false
    scroll.scrollerStyle = .overlay
    let doc = NSView(frame: CGRect(x: 0, y: 0, width: 160, height: 660))
    scroll.documentView = doc
    window.contentView?.addSubview(scroll)
    scroll.contentView.scroll(to: CGPoint(x: 0, y: 220)); scroll.reflectScrolledClipView(scroll.contentView)
    window.displayIfNeeded()
    guard let scroller = scroll.verticalScroller else { recorder.missing("\(id).scroller", "vertical scroller unavailable"); return }
    recorder.put("\(id).knobRect", probeRect(scroller.rect(for: .knob)))
    recorder.put("\(id).knobSlotRect", probeRect(scroller.rect(for: .knobSlot)))
    guard let imp = SafeValueForKey(scroller, "scrollerImp") as AnyObject? else { recorder.missing("\(id).scrollerImp", "scrollerImp unavailable"); return }
    for key in ["trackWidth", "trackSideInset", "knobMinLength", "knobEndInset", "knobAlpha", "trackAlpha"] {
        if let value = SafeValueForKey(imp, key) { recorder.put("\(id).\(key)", safeDescription(value) ?? NSNull()) }
        else { recorder.missing("\(id).\(key)", "KVC value unavailable") }
    }
    let selector = NSSelectorFromString("expandedRectForPart:")
    if imp.responds(to: selector), let method = class_getInstanceMethod(type(of: imp), selector) {
        guard method_getNumberOfArguments(method) == 3,
              let returnPointer = method_copyReturnType(method),
              let argumentPointer = method_copyArgumentType(method, 2) else {
            recorder.missing("\(id).expandedRectForPart", "method signature unavailable")
            return
        }
        let returnType = String(cString: returnPointer); free(returnPointer)
        let argumentType = String(cString: argumentPointer); free(argumentPointer)
        guard returnType.hasPrefix("{CGRect") || returnType.hasPrefix("{_NSRect"),
              argumentType == "Q" || argumentType == "q" else {
            recorder.missing("\(id).expandedRectForPart", "unsupported runtime signature \(returnType)(\(argumentType))")
            return
        }
        typealias RectMethod = @convention(c) (AnyObject, Selector, UInt) -> CGRect
        let call = unsafeBitCast(imp.method(for: selector), to: RectMethod.self)
        let rect = call(imp, selector, UInt(NSScroller.Part.knob.rawValue))
        recorder.put("\(id).expandedRectForPart", probeRect(rect))
    } else { recorder.missing("\(id).expandedRectForPart", "selector unavailable") }
}

func runProbes(appearance: String, output: String) throws {
    let recorder = ProbeRecorder()
    let isDark = appearance == "dark"
    let appAppearance = NSAppearance(named: isDark ? .darkAqua : .aqua)!
    NSApp.appearance = appAppearance
    let folder = URL(fileURLWithPath: output, isDirectory: true)
    try FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)

    appAppearance.performAsCurrentDrawingAppearance {
        for sizeName in ["mini", "small", "regular", "large", "extraLarge"] {
            guard let size = controlSize(sizeName) else { recorder.missing("font.systemFontSize.\(sizeName)", "control size unavailable"); continue }
            recorder.put("font.systemFontSize.\(sizeName)", NSFont.systemFontSize(for: size))
        }
        recorder.put("font.smallSystemFontSize", NSFont.smallSystemFontSize)
        recorder.put("font.systemFontSize", NSFont.systemFontSize)
        recorder.put("font.labelFontSize", NSFont.labelFontSize)
        probeFont(recorder, "font.toolTipsFont", { NSFont.toolTipsFont(ofSize: 0) })
        probeFont(recorder, "font.menuFont", { NSFont.menuFont(ofSize: 0) })
        probeFont(recorder, "font.menuBarFont", { NSFont.menuBarFont(ofSize: 0) })
        for sizeName in ["regular", "small", "mini"] {
            let size = controlSize(sizeName)!
            for (styleName, style) in [("overlay", NSScroller.Style.overlay), ("legacy", .legacy)] {
                recorder.put("scroller.width.\(sizeName).\(styleName)", NSScroller.scrollerWidth(for: size, scrollerStyle: style))
            }
        }
        let colors = ["labelColor", "secondaryLabelColor", "tertiaryLabelColor", "quaternaryLabelColor", "quinaryLabelColor",
                      "systemFillColor", "secondarySystemFillColor", "tertiarySystemFillColor", "quaternarySystemFillColor",
                      "textColor", "placeholderTextColor", "selectedTextColor", "textBackgroundColor", "selectedTextBackgroundColor",
                      "keyboardFocusIndicatorColor", "unemphasizedSelectedTextColor", "unemphasizedSelectedTextBackgroundColor",
                      "linkColor", "separatorColor", "gridColor", "headerTextColor", "controlColor", "controlTextColor",
                      "selectedControlColor", "selectedControlTextColor", "alternateSelectedControlColor", "disabledControlTextColor",
                      "windowBackgroundColor", "windowFrameTextColor", "underPageBackgroundColor", "findHighlightColor",
                      "controlAccentColor", "systemRedColor", "systemGreenColor", "systemBlueColor", "systemOrangeColor",
                      "systemYellowColor", "systemBrownColor", "systemPinkColor", "systemPurpleColor", "systemTealColor",
                      "systemIndigoColor", "scrubberTexturedBackground"]
        for name in colors {
            let id = "color.\(name)"
            if let color = semanticColor(name) {
                appAppearance.performAsCurrentDrawingAppearance {
                    if let value = probeColor(color) { recorder.put(id, value) }
                    else { recorder.missing(id, "cannot convert resolved color to sRGB") }
                }
            } else { recorder.missing(id, "semantic color unavailable on this runtime") }
        }
    }

    let window = NSWindow(contentRect: CGRect(x: 100, y: 100, width: 440, height: 300), styleMask: [.titled], backing: .buffered, defer: false)
    window.isReleasedWhenClosed = false; window.appearance = appAppearance; window.title = "Runtime probes"
    let root = NSView(frame: window.contentView?.bounds ?? .zero); root.autoresizingMask = [.width, .height]; window.contentView = root
    window.makeKeyAndOrderFront(nil); NSApp.activate(ignoringOtherApps: true); window.displayIfNeeded()
    for sizeName in ["mini", "small", "regular", "large", "extraLarge"] {
        guard let size = controlSize(sizeName) else { continue }
        for kind in ["button", "checkbox", "radio", "popup", "pulldown", "textfield", "search-empty", "search-abc", "stepper", "slider", "progress", "switch", "segmented"] {
            let states = (kind == "checkbox" || kind == "radio") ? ["off", "on", "mixed"] : kind == "switch" ? ["off", "on"] : ["default"]
            for state in states {
                let publicKind = kind == "search-empty" || kind == "search-abc" ? "searchfield" : kind
                let suffix = kind == "search-empty" ? ".empty" : kind == "search-abc" ? ".abc"
                    : state == "default" ? "" : ".\(state)"
                let id = "control.\(publicKind).\(sizeName)\(suffix)"
                guard let c = makeProbeControl(kind, size: size, state: state) else { recorder.missing(id, "control unavailable"); continue }
                c.frame.origin = CGPoint(x: 18, y: 18); root.addSubview(c); window.displayIfNeeded()
                captureControl(c, id: id, recorder: recorder); controlExtras(c, kind: kind, id: id, recorder: recorder)
                c.removeFromSuperview()
            }
        }
    }
    probeScroller(id: "scroller.regular.overlay", window: window, recorder: recorder)
    window.displayIfNeeded()
    try writeJSON(recorder.values, to: folder.appendingPathComponent("probes.json"))
    let version = ProcessInfo.processInfo.operatingSystemVersion
    let accent = probeColor(NSColor.controlAccentColor).map { ["value": $0, "error": NSNull()] as [String: Any] }
        ?? ["value": NSNull(), "error": "cannot convert accent color to sRGB"]
    let env: [String: Any] = [
        "os": "\(version.majorVersion).\(version.minorVersion).\(version.patchVersion)",
        "osBuild": systemFact("kern.osversion"),
        "effectiveAppearance": window.effectiveAppearance.name.rawValue,
        "increaseContrast": NSWorkspace.shared.accessibilityDisplayShouldIncreaseContrast,
        "reduceTransparency": NSWorkspace.shared.accessibilityDisplayShouldReduceTransparency,
        "reduceMotion": NSWorkspace.shared.accessibilityDisplayShouldReduceMotion,
        "differentiateWithoutColor": NSWorkspace.shared.accessibilityDisplayShouldDifferentiateWithoutColor,
        "accent": accent,
        "backingScale": window.backingScaleFactor
    ]
    try writeJSON(env, to: folder.appendingPathComponent("env.json"))
    window.close()
}
