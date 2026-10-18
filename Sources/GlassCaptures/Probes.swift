import AppKit
import QuartzCore
import SafeKVC
import ObjectiveC.runtime

// Runtime probes: values returned by the real AppKit on the runner, recorded as JSON. Every probe runs
// through SafeInvoke so an Objective-C exception becomes an explicit error instead of killing the pass.
final class ProbeRecorder {
    var values: [String: [String: Any]] = [:]

    func put(_ id: String, _ value: @autoclosure () -> Any?) {
        var error: NSString?
        let result = SafeInvoke({ value() }, &error)
        if let error { values[id] = ["value": NSNull(), "error": error as String] }
        else if let result { values[id] = ["value": result, "error": NSNull()] }
        else { values[id] = ["value": NSNull(), "error": "nil result"] }
    }

    func putOptional(_ id: String, _ nilReason: String, _ value: @autoclosure () -> Any?) {
        var error: NSString?
        let result = SafeInvoke({ value() }, &error)
        if let error { values[id] = ["value": NSNull(), "error": error as String] }
        else if let result { values[id] = ["value": result, "error": NSNull()] }
        else { values[id] = ["value": NSNull(), "error": nilReason] }
    }

    func missing(_ id: String, _ reason: String) {
        values[id] = ["value": NSNull(), "error": reason]
    }

    // Runs side-effecting setup that may raise; returns false (and records `id`) on an exception.
    @discardableResult
    func guarded(_ id: String, _ body: () -> Void) -> Bool {
        var error: NSString?
        _ = SafeInvoke({ body(); return NSNull() }, &error)
        if let error { missing(id, "setup raised \(error)"); return false }
        return true
    }
}

func probeRect(_ r: CGRect) -> [String: CGFloat] {
    ["x": r.minX, "y": r.minY, "width": r.width, "height": r.height]
}
func probeSize(_ s: CGSize) -> [String: CGFloat] { ["width": s.width, "height": s.height] }
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
private func probeLayer(_ layer: CALayer, depth: Int, maximumDepth: Int) -> [String: Any] {
    var d: [String: Any] = [
        "class": NSStringFromClass(type(of: layer)),
        "name": layer.name as Any? ?? NSNull(),
        "frame": probeRect(layer.frame), "bounds": probeRect(layer.bounds),
        "opacity": layer.opacity, "isHidden": layer.isHidden,
        "masksToBounds": layer.masksToBounds, "cornerRadius": layer.cornerRadius,
        "cornerCurve": layer.cornerCurve.rawValue
    ]
    d["backgroundColor"] = layer.backgroundColor.map { safeDescription($0) as Any } ?? NSNull()
    d["borderColor"] = layer.borderColor.map { safeDescription($0) as Any } ?? NSNull()
    d["borderWidth"] = layer.borderWidth
    d["contentsPresent"] = layer.contents != nil
    d["sublayers"] = depth >= maximumDepth ? [] : (layer.sublayers ?? []).map {
        probeLayer($0, depth: depth + 1, maximumDepth: maximumDepth)
    }
    return d
}

private final class ProbeRows: NSObject, NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int { 5 }
}

private final class ProbeToolbarDelegate: NSObject, NSToolbarDelegate {
    let itemID = NSToolbarItem.Identifier("probe-item")
    func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] { [itemID] }
    func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] { [itemID] }
    func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier,
                 willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
        NSToolbarItem(itemIdentifier: itemIdentifier)
    }
}

// Resolves a (possibly dynamic, catalog-backed) colour in `appearance`. Dynamic colours must not be
// asked for `colorSpace` or components directly; converting inside the drawing appearance resolves
// them. Extended sRGB keeps wide-gamut and >1 components unclamped.
func probeColor(_ color: NSColor, appearance: NSAppearance) -> [String: Any] {
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

func fontJSON(_ font: NSFont?) -> Any? {
    guard let font else { return nil }
    return ["name": font.fontName, "pointSize": font.pointSize]
}

func controlSize(_ name: String) -> NSControl.ControlSize? {
    switch name {
    case "mini": return .mini
    case "small": return .small
    case "regular": return .regular
    case "large": return .large
    case "extraLarge": return .extraLarge
    default: return nil
    }
}

func settle() { RunLoop.main.run(until: Date().addingTimeInterval(0.05)) }

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
    case "colorwell-default", "colorwell-minimal", "colorwell-expanded":
        let w = NSColorWell(frame: .zero)
        w.colorWellStyle = kind == "colorwell-minimal" ? .minimal : kind == "colorwell-expanded" ? .expanded : .default
        c = w
    case "combobox": c = NSComboBox(frame: .zero)
    case "datepicker":
        let d = NSDatePicker(frame: .zero); d.datePickerStyle = .textField; c = d
    case "levelindicator":
        let l = NSLevelIndicator(frame: .zero); l.levelIndicatorStyle = .continuousCapacity; c = l
    case "pathcontrol": c = NSPathControl(frame: .zero)
    case "disclosure":
        let b = NSButton(title: "", target: nil, action: nil); b.bezelStyle = .disclosure
        b.setButtonType(.pushOnPushOff); c = b
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
    if kind == "textfield" || kind.hasPrefix("search-") {
        (c as? NSTextField)?.font = NSFont.systemFont(ofSize: NSFont.systemFontSize(for: size))
    }
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

private func probeScroller(id: String, size: NSControl.ControlSize, window: NSWindow, recorder: ProbeRecorder) {
    let scroll = NSScrollView(frame: CGRect(x: 100, y: 40, width: 180, height: 220))
    let doc = NSView(frame: CGRect(x: 0, y: 0, width: 160, height: 660))
    guard recorder.guarded("\(id).setup", {
        scroll.hasVerticalScroller = true
        scroll.hasHorizontalScroller = false
        scroll.scrollerStyle = .overlay
        scroll.verticalScroller?.controlSize = size
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

private func probeSliderVariants(size: NSControl.ControlSize, sizeName: String,
                                root: NSView, window: NSWindow, recorder: ProbeRecorder) {
    let verticalID = "control.slider.vertical.\(sizeName)"
    var vertical: NSSlider?
    var cell: NSSliderCell?
    guard recorder.guarded(verticalID, {
        let slider = NSSlider(value: 0.5, minValue: 0, maxValue: 1, target: nil, action: nil)
        slider.controlSize = size
        slider.isVertical = true
        slider.frame = CGRect(x: 20, y: 20, width: 28, height: 200)
        cell = slider.cell as? NSSliderCell
        vertical = slider
        root.addSubview(slider)
    }), let slider = vertical, let cell else {
        if recorder.values[verticalID] == nil { recorder.missing(verticalID, "vertical slider unavailable") }
        return
    }
    recorder.guarded("\(verticalID).display", { window.displayIfNeeded() }); settle()
    recorder.put("\(verticalID).knobRect", probeRect(cell.knobRect(flipped: slider.isFlipped)))
    recorder.put("\(verticalID).barRect", probeRect(cell.barRect(flipped: slider.isFlipped)))
    for only in [false, true] {
        let variant = only ? "tickOnly" : "ticks"
        for (positionName, position) in [("below", NSSlider.TickMarkPosition.below), ("above", .above)] {
            let key = "\(verticalID).\(variant).\(positionName)"
            guard recorder.guarded(key, {
                slider.numberOfTickMarks = 5
                slider.allowsTickMarkValuesOnly = only
                slider.tickMarkPosition = position
                slider.frame = CGRect(x: 20, y: 20, width: 28, height: 200)
            }) else { continue }
            settle()
            recorder.put("\(key).frame", probeRect(slider.frame))
            recorder.put("\(key).knobRect", probeRect(cell.knobRect(flipped: slider.isFlipped)))
            recorder.put("\(key).barRect", probeRect(cell.barRect(flipped: slider.isFlipped)))
            for i in 0..<5 { recorder.put("\(key).rectOfTickMark.\(i)", probeRect(cell.rectOfTickMark(at: i))) }
        }
    }
    recorder.guarded("\(verticalID).cleanup", { slider.removeFromSuperview() })

    let circularID = "control.slider.circular.\(sizeName)"
    var circular: NSSlider?
    var circularCell: NSSliderCell?
    guard recorder.guarded(circularID, {
        let knob = NSSlider(value: 0.5, minValue: 0, maxValue: 1, target: nil, action: nil)
        knob.controlSize = size
        knob.sliderType = .circular
        knob.sizeToFit()
        circularCell = knob.cell as? NSSliderCell
        circular = knob
        root.addSubview(knob)
    }), let knob = circular, let circularCell else {
        if recorder.values[circularID] == nil { recorder.missing(circularID, "circular slider unavailable") }
        return
    }
    recorder.guarded("\(circularID).display", { window.displayIfNeeded() }); settle()
    recorder.put("\(circularID).frame", probeRect(knob.frame))
    recorder.put("\(circularID).knobRect", probeRect(circularCell.knobRect(flipped: knob.isFlipped)))
    recorder.putOptional("\(circularID).layers", "circular slider has no layer", {
        guard let layer = knob.layer else { return nil }
        return probeLayer(layer)
    }())
    recorder.guarded("\(circularID).cleanup", { knob.removeFromSuperview() })
}

private func recordMenu(_ menu: NSMenu, name: String, recorder: ProbeRecorder) {
    let id = "menu.\(name)"
    guard recorder.guarded(id, { menu.update() }) else { return }
    recorder.put("\(id).size", probeSize(menu.size))
    recorder.put("\(id).minimumWidth", menu.minimumWidth)
    recorder.put("\(id).font", fontJSON(menu.font))
}

private func probeMenus(recorder: ProbeRecorder) {
    var scenario: NSMenu?
    guard recorder.guarded("menu.scenario.setup", {
        let menu = NSMenu(title: "Probe menu")
        menu.addItem(withTitle: "Plain item", action: nil, keyEquivalent: "")
        let shortcut = menu.addItem(withTitle: "Run", action: nil, keyEquivalent: "r")
        shortcut.keyEquivalentModifierMask = .command
        let checked = menu.addItem(withTitle: "Checked", action: nil, keyEquivalent: "")
        checked.state = .on
        menu.addItem(NSMenuItem.separator())
        let parent = NSMenuItem(title: "Submenu", action: nil, keyEquivalent: "")
        let child = NSMenu(title: "Submenu")
        child.addItem(withTitle: "Child", action: nil, keyEquivalent: "")
        menu.addItem(parent); menu.setSubmenu(child, for: parent)
        let imageItem = menu.addItem(withTitle: "Image", action: nil, keyEquivalent: "")
        imageItem.image = NSImage(size: CGSize(width: 16, height: 16))
        menu.addItem(NSMenuItem.separator())
        scenario = menu
    }), let menu = scenario else {
        if recorder.values["menu.scenario.size"] == nil {
            for field in ["size", "minimumWidth", "font"] { recorder.missing("menu.scenario.\(field)", "menu setup raised or unavailable") }
        }
        return
    }
    recordMenu(menu, name: "scenario", recorder: recorder)

    for (name, pullsDown) in [("popup", false), ("pulldown", true)] {
        let base = "menu.\(name)"
        var control: NSPopUpButton?
        var menu: NSMenu?
        guard recorder.guarded("\(base).setup", {
            let popup = NSPopUpButton(frame: .zero, pullsDown: pullsDown)
            if pullsDown {
                popup.addItem(withTitle: "Actions")
                popup.addItems(withTitles: ["Duplicate", "Rename", "Move to Trash"])
            } else {
                popup.addItems(withTitles: ["Automatic", "Blue", "Pink", "Yellow"])
            }
            menu = popup.menu
            control = popup
        }), let _ = control, let menu else {
            for field in ["size", "minimumWidth", "font"] { recorder.missing("\(base).\(field)", "pop-up menu unavailable") }
            continue
        }
        recordMenu(menu, name: name, recorder: recorder)
    }
}

private func probeWindowChrome(appearance: NSAppearance, recorder: ProbeRecorder) {
    let titled: NSWindow.StyleMask = [.titled, .closable, .miniaturizable, .resizable]
    let definitions: [(String, NSWindow.StyleMask, NSWindow.ToolbarStyle?)] = [
        ("titled", titled, nil),
        ("fullSizeContent", titled.union(.fullSizeContentView), nil),
        ("toolbarAutomatic", titled, .automatic),
        ("toolbarUnified", titled, .unified),
        ("toolbarUnifiedCompact", titled, .unifiedCompact)
    ]
    for (name, mask, toolbarStyle) in definitions {
        let id = "window.\(name)"
        var window: NSWindow?
        var toolbarDelegate: ProbeToolbarDelegate?
        guard recorder.guarded(id, {
            let w = NSWindow(contentRect: CGRect(x: 120, y: 120, width: 420, height: 280),
                             styleMask: mask, backing: .buffered, defer: false)
            w.isReleasedWhenClosed = false
            w.appearance = appearance
            if let toolbarStyle {
                let delegate = ProbeToolbarDelegate()
                let toolbar = NSToolbar(identifier: NSToolbar.Identifier("probe-\(name)"))
                toolbar.delegate = delegate
                toolbar.allowsUserCustomization = false
                toolbar.displayMode = .iconOnly
                toolbar.sizeMode = .regular
                w.toolbar = toolbar
                toolbar.delegate = delegate
                w.toolbarStyle = toolbarStyle
                toolbarDelegate = delegate
            }
            w.makeKeyAndOrderFront(nil)
            window = w
        }) else { continue }
        guard let w = window else { continue }
        settle()
        recorder.put("\(id).frame", probeRect(w.frame))
        recorder.put("\(id).contentLayoutRect", probeRect(w.contentLayoutRect))
        for (label, type) in [("closeButton", NSWindow.ButtonType.closeButton),
                              ("miniaturizeButton", .miniaturizeButton), ("zoomButton", .zoomButton)] {
            let buttonID = "\(id).\(label)Frame"
            recorder.putOptional(buttonID, "standard window button unavailable", {
                guard let button = w.standardWindowButton(type) else { return nil }
                return probeRect(button.convert(button.bounds, to: nil))
            }())
        }
        recorder.putOptional("\(id).titlebarLayers", "titlebar container layer unavailable through KVC", {
            for key in ["titlebarView", "_titlebarView", "_titlebarContainerView"] {
                if let titlebar = SafeValueForKey(w, key) as? NSView, let layer = titlebar.layer {
                    return probeLayer(layer, depth: 0, maximumDepth: 6)
                }
            }
            return nil
        }())
        recorder.guarded("\(id).cleanup", { w.close() })
        _ = toolbarDelegate
    }
}

private func probeTables(root: NSView, recorder: ProbeRecorder) {
    let rows = ProbeRows()
    let styles: [(String, NSTableView.Style)] = [("automatic", .automatic), ("fullWidth", .fullWidth),
        ("inset", .inset), ("sourceList", .sourceList), ("plain", .plain)]
    let rowSizes: [(String, NSTableView.RowSizeStyle)] = [("small", .small), ("medium", .medium), ("large", .large)]
    for (styleName, style) in styles {
        for (rowName, rowStyle) in rowSizes {
            let id = "table.\(styleName).\(rowName)"
            var table: NSTableView?
            var scroll: NSScrollView?
            guard recorder.guarded(id, {
                let t = NSTableView(frame: CGRect(x: 0, y: 0, width: 280, height: 180))
                t.style = style
                t.rowSizeStyle = rowStyle
                t.dataSource = rows
                t.addTableColumn(NSTableColumn(identifier: NSUserInterfaceItemIdentifier("probe-column")))
                t.reloadData()
                let s = NSScrollView(frame: CGRect(x: 10, y: 10, width: 300, height: 190))
                s.hasVerticalScroller = true
                s.documentView = t
                root.addSubview(s)
                table = t; scroll = s
            }), let t = table else {
                for field in ["rowHeight", "intercellSpacing", "rectOfRow", "frameOfCell"] {
                    recorder.missing("\(id).\(field)", "table setup raised or unavailable")
                }
                continue
            }
            recorder.put("\(id).rowHeight", t.rowHeight)
            recorder.put("\(id).intercellSpacing", probeSize(t.intercellSpacing))
            recorder.put("\(id).rectOfRow", probeRect(t.rect(ofRow: 0)))
            recorder.put("\(id).frameOfCell", probeRect(t.frameOfCell(atColumn: 0, row: 0)))
            if let scroll { recorder.guarded("\(id).cleanup", { scroll.removeFromSuperview() }) }
        }
    }
    var outline: NSOutlineView?
    guard recorder.guarded("table.outline.sourceList.setup", {
        let o = NSOutlineView(frame: CGRect(x: 0, y: 0, width: 280, height: 180))
        o.style = .sourceList
        o.addTableColumn(NSTableColumn(identifier: NSUserInterfaceItemIdentifier("probe-column")))
        outline = o
    }) else { recorder.missing("table.outline.sourceList.indentationPerLevel", "outline setup raised"); return }
    if let outline { recorder.put("table.outline.sourceList.indentationPerLevel", outline.indentationPerLevel) }
    else { recorder.missing("table.outline.sourceList.indentationPerLevel", "outline unavailable") }
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
    let window = CaptureWindow(contentRect: CGRect(x: 100, y: 100, width: 440, height: 300),
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
                 "search-abc", "stepper", "slider", "progress", "switch", "segmented",
                 "colorwell-default", "colorwell-minimal", "colorwell-expanded", "combobox",
                 "datepicker", "levelindicator", "pathcontrol", "disclosure"]
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
                if kind == "slider" { probeSliderVariants(size: size, sizeName: sizeName, root: root, window: window, recorder: recorder) }
                recorder.guarded("\(id).cleanup", { c.removeFromSuperview() })
            }
        }
        try? writeJSON(recorder.values, to: probesURL)
        record("probe controls complete size=\(sizeName) count=\(recorder.values.count)")
    }
    probeScroller(id: "scroller.regular.overlay", size: .regular, window: window, recorder: recorder)
    probeScroller(id: "scroller.small.overlay", size: .small, window: window, recorder: recorder)
    probeMenus(recorder: recorder)
    probeTables(root: root, recorder: recorder)
    probeWindowChrome(appearance: appAppearance, recorder: recorder)
    window.makeKeyAndOrderFront(nil)
    NSApp.activate(ignoringOtherApps: true)
    settle()
    // Deep probes get a fresh window ordered in after all getter probes.
    let deepWindow = CaptureWindow(contentRect: CGRect(x: 100, y: 100, width: 440, height: 300),
                                   styleMask: [.titled], backing: .buffered, defer: false)
    deepWindow.isReleasedWhenClosed = false
    deepWindow.appearance = appAppearance
    deepWindow.title = "Deep probes"
    let deepRoot = NSView(frame: deepWindow.contentView?.bounds ?? .zero)
    deepRoot.autoresizingMask = [.width, .height]
    deepRoot.wantsLayer = true
    deepWindow.contentView = deepRoot
    window.orderOut(nil)
    do { try runDeepProbes(window: deepWindow, root: deepRoot, output: folder) }
    catch { record("deep probes failed: \(error)") }
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
