import AppKit
import ApplicationServices
import ImageIO
import SwiftUI
import SafeKVC

private let output = URL(fileURLWithPath: ProcessInfo.processInfo.environment["CAPTURE_OUT"] ?? "out", isDirectory: true)
private let appearance = ProcessInfo.processInfo.environment["CAPTURE_APPEARANCE"] ?? "dark"
private let scenario = ProcessInfo.processInfo.environment["CAPTURE_SCENARIO"] ?? "baseline"
private let shot = "/Users/runner/work/MacShot.app/Contents/MacOS/MacShot"
private let diagnosticModes = ["Composite", "Shape field", "Refraction", "Blur radius", "Backdrop sample",
                               "Edge terms (outer / bleed / key-fill)", "Lighting masks (rim / tint / glow)", "Shadows"]

private final class ProbeState: ObservableObject {
    @Published var tool = 0
    @Published var mode = 0
    @Published var format = 0
    @Published var compare = false
    @Published var actionCounts: [String: Int] = [:]
    func action(_ key: String) { actionCounts[key, default: 0] += 1 }
}

private struct ProbeView: View {
    @StateObject private var state = ProbeState()
    var body: some View {
        ZStack {
            LinearGradient(colors: [.orange, .pink, .purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            Text("Toolbar width allocation probe").font(.title2)
        }
        .frame(minWidth: 180, maxWidth: .infinity, minHeight: 220, maxHeight: .infinity)
        .toolbar {
            if scenario == "single-button" {
                ToolbarItem(placement: .primaryAction) {
                    Button { state.action("plain-button") } label: { Label("Plain action", systemImage: "plus") }
                        .accessibilityIdentifier("plain-button")
                }
            } else {
                ToolbarItemGroup(placement: .navigation) {
                    Button { state.action("back") } label: { Image(systemName: "chevron.backward") }
                        .accessibilityLabel("Back").accessibilityIdentifier("toolbar-back")
                    Button { state.action("forward") } label: { Image(systemName: "chevron.forward") }
                        .accessibilityLabel("Forward").accessibilityIdentifier("toolbar-forward")
                }
                ToolbarItem(placement: .principal) {
                    Picker("Tools", selection: $state.tool) {
                        Text("Material").tag(0); Text("Optics").tag(1); Text("Motion").tag(2)
                    }
                    .pickerStyle(.segmented).accessibilityIdentifier("tools-segmented")
                }
                ToolbarSpacer(.fixed, placement: .principal)
                ToolbarItem(placement: .principal) {
                    Picker("Glass diagnostic view", selection: $state.mode) {
                        ForEach(diagnosticModes.indices, id: \.self) { Text(diagnosticModes[$0]).tag($0) }
                    }
                    .pickerStyle(.menu).labelsHidden().frame(width: 200)
                    .accessibilityIdentifier("diagnostic-picker")
                }
                ToolbarItemGroup(placement: .primaryAction) {
                    Menu {
                        Button("Reset image") { state.action("reset-image") }
                        Button("Align reference") { state.action("align-reference") }
                        Picker("Export format", selection: $state.format) {
                            Text("PNG").tag(0); Text("TIFF").tag(1); Text("JPEG").tag(2)
                        }
                        Divider()
                        Button("Export capture…") { state.action("export-capture") }
                    } label: { Label("More image actions", systemImage: "ellipsis") }
                    .accessibilityIdentifier("more-actions")
                    Button { state.compare.toggle(); state.action("compare") } label: { Text(state.compare ? "Hide reference" : "Compare") }
                        .tint(.orange).buttonStyle(.glassProminent).accessibilityIdentifier("compare-button")
                }
            }
        }
        .background(ProbeStateReader(state: state))
    }
}

private struct ProbeStateReader: NSViewRepresentable {
    let state: ProbeState
    func makeNSView(context: Context) -> NSView {
        let v = NSView()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { ProbeRunner(state: state).start(v) }
        return v
    }
    func updateNSView(_ nsView: NSView, context: Context) {}
}

private struct ProbeRunner {
    let state: ProbeState
    func start(_ host: NSView) {
        guard let window = host.window, let screen = NSScreen.main else { print("GATE_FAIL no-window-or-screen"); NSApp.terminate(nil); return }
        NSApp.setActivationPolicy(.regular); NSApp.activate(ignoringOtherApps: true)
        window.appearance = NSAppearance(named: appearance == "light" ? .aqua : .darkAqua)
        window.title = scenario == "window-title" ? "Ordinary Window Title" : ""
        window.setFrame(NSRect(x: 70, y: screen.frame.maxY - 480, width: 1280, height: 440), display: true)
        window.makeKeyAndOrderFront(nil)
        guard NSApp.isActive && window.isKeyWindow && window.occlusionState.contains(.visible) else {
            print("GATE_FAIL initial active=\(NSApp.isActive) key=\(window.isKeyWindow) visible=\(window.occlusionState.contains(.visible))")
            NSApp.terminate(nil); return
        }
        try? FileManager.default.createDirectory(at: output, withIntermediateDirectories: true)
        print("RUN scenario=\(scenario) appearance=\(appearance) source=SwiftUIToolbarPopupOverlap/main.swift screen=\(screen.frame) scale=\(window.backingScaleFactor)")
        var coarse: [(Int, Set<String>)] = []
        let widths = scenario == "single-button" ? [1280, 820] : [1280, 820] + Array(stride(from: 810, through: 300, by: -10))
        for width in widths {
            guard let sample = measure(width, window: window, screen: screen, capture: [1280, 820].contains(width), state: state) else { continue }
            coarse.append((width, sample.membership))
            if scenario != "single-button" && !sample.membership.contains("tools-segmented") {
                print("SEGMENTED_HIDDEN width=\(width)"); break
            }
        }
        var precise = Set<Int>()
        if scenario != "single-button" {
            for i in 1..<coarse.count where coarse[i].1 != coarse[i - 1].1 {
                for w in max(180, min(coarse[i].0, coarse[i - 1].0) - 10)...(max(coarse[i].0, coarse[i - 1].0) + 10) { precise.insert(w) }
                print("MEMBERSHIP_TRANSITION coarse=\(coarse[i - 1].0)->\(coarse[i].0) removed=\(coarse[i - 1].1.subtracting(coarse[i].1).sorted()) added=\(coarse[i].1.subtracting(coarse[i - 1].1).sorted())")
            }
        }
        for width in precise.sorted() { _ = measure(width, window: window, screen: screen, capture: true, state: state) }
        if scenario == "baseline" {
            window.setFrame(NSRect(x: 70, y: screen.frame.maxY - 480, width: 820, height: 440), display: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) { openMenus(window: window, screen: screen, state: state) }
        } else {
            NSApp.terminate(nil)
        }
    }

    private func measure(_ width: Int, window: NSWindow, screen: NSScreen, capture: Bool, state: ProbeState) -> (membership: Set<String>, object: [String: Any])? {
        window.setFrame(NSRect(x: 70, y: screen.frame.maxY - 480, width: CGFloat(width), height: 440), display: true)
        RunLoop.current.run(until: Date().addingTimeInterval(0.13))
        let ax = AXUIElementCreateApplication(ProcessInfo.processInfo.processIdentifier)
        let all = flatten(ax)
        let toolbar = window.toolbar
        let visible = toolbar?.visibleItems ?? []
        let nativeItems = (toolbar?.items ?? []).enumerated().map { index, item in itemDump(item, index: index, visible: visible.contains(item)) }
        let membership = Set(all.compactMap { id($0) }.filter { !$0.isEmpty })
            .union(visible.compactMap { $0.view?.accessibilityIdentifier() }.filter { !$0.isEmpty })
        let bounds = all.first { role($0) == "AXToolbar" }.map(frame) ?? "unavailable"
        let titleFrame = all.first { title($0).contains("Ordinary Window Title") || title($0).contains("Toolbar") }.map(frame) ?? "unavailable"
        let sample: [String: Any] = [
            "scenario": scenario, "appearance": appearance, "width": width,
            "windowFrame": rect(window.frame), "windowTitle": window.title, "windowKey": window.isKeyWindow,
            "applicationActive": NSApp.isActive, "windowVisible": window.occlusionState.contains(.visible),
            "windowScale": window.backingScaleFactor, "screenFrame": rect(screen.frame), "screenScale": screen.backingScaleFactor,
            "toolbarAXFrame": bounds, "titleAXFrame": titleFrame,
            "availableSectionWidths": "unavailable",
            "overflowViewerFrame": all.first { role($0) == "AXPopover" || role($0) == "AXMenu" }.map(frame) ?? "unavailable",
            "toolbarItems": nativeItems, "ax": all.map(axDump),
            "swiftSelection": ["tools": state.tool, "diagnostic": state.mode, "exportFormat": state.format, "compare": state.compare],
            "actionCounts": state.actionCounts
        ]
        appendJSON(sample, name: "width-\(scenario)-\(appearance)-\(width).json")
        appendMembership(sample, members: membership, items: nativeItems)
        print("WIDTH scenario=\(scenario) appearance=\(appearance) width=\(width) membership=\(membership.sorted()) toolbarBounds=\(bounds) titleFrame=\(titleFrame)")
        if capture { captureFrame(window: window, screen: screen, name: "width-\(scenario)-\(appearance)-\(width)") }
        return (membership, sample)
    }

    private func itemDump(_ item: NSToolbarItem, index: Int, visible: Bool) -> [String: Any] {
        let view = item.view
        return ["sourceOrder": index, "identifier": item.itemIdentifier.rawValue,
                "accessibilityIdentifier": view?.accessibilityIdentifier() ?? "unavailable", "label": item.label,
                "priority": item.visibilityPriority.rawValue, "minSize": size(item.minSize), "maxSize": size(item.maxSize),
                "currentSize": view.map { size($0.frame.size) } ?? "unavailable", "visible": visible,
                "partition": guarded(item, "partition"), "priorityIndex": guarded(item, "priorityIndex"),
                "participation": guarded(item, "participation"), "selection": guarded(item, "selection"),
                "menuFormRepresentation": item.menuFormRepresentation.map { $0.title } ?? "unavailable",
                "layoutRect": guarded(view ?? item, "layoutRect"), "defaultItemPadding": guarded(item, "defaultItemPadding")]
    }

    private func guarded(_ object: AnyObject, _ key: String) -> String {
        guard let value = SafeValueForKey(object, key) else { return "unavailable" }
        return String(describing: value)
    }

    private func openMenus(window: NSWindow, screen: NSScreen, state: ProbeState) {
        let app = AXUIElementCreateApplication(ProcessInfo.processInfo.processIdentifier)
        dumpAX(app, tag: "overflow-before")
        let candidates = flatten(app)
        let overflow = findOverflow(candidates)
        guard let overflow else { print("OVERFLOW_AX unavailable"); NSApp.terminate(nil); return }
        print("OVERFLOW_AX frame=\(frame(overflow)) status=\(AXUIElementPerformAction(overflow, kAXPressAction as CFString).rawValue)")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            let main = AXUIElementCreateApplication(ProcessInfo.processInfo.processIdentifier)
            dumpAX(main, tag: "overflow-main-rows")
            captureFrame(window: window, screen: screen, name: "overflow-\(appearance)")
            let rows = flatten(main).filter { role($0) == "AXMenuItem" }
            for row in rows { print("OVERFLOW_ROW title=\(title(row)) enabled=\(enabled(row)) selected=\(selected(row)) frame=\(frame(row))") }
            inspectPicker(window: window, screen: screen, state: state)
        }
    }

    private func findOverflow(_ candidates: [AXUIElement]) -> AXUIElement? {
        candidates.first { role($0) == "AXMenuButton" && (title($0).localizedCaseInsensitiveContains("overflow") || description($0).localizedCaseInsensitiveContains("toolbar")) }
            ?? candidates.last { role($0) == "AXMenuButton" }
    }

    private func inspectPicker(window: NSWindow, screen: NSScreen, state: ProbeState) {
        let app = AXUIElementCreateApplication(ProcessInfo.processInfo.processIdentifier)
        guard let row = flatten(app).first(where: { role($0) == "AXMenuItem" && title($0).contains("Glass diagnostic") }) else {
            print("MENU_UNAVAILABLE form=diagnostic-picker row=unavailable"); inspectMoreMenu(window: window, screen: screen, state: state); return
        }
        print("MENU_ROW form=diagnostic-picker title=\(title(row)) enabled=\(enabled(row)) selected=\(selected(row))")
        let status = AXUIElementPerformAction(row, kAXPressAction as CFString)
        print("MENU_OPEN form=diagnostic-picker axStatus=\(status.rawValue)")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            let tree = AXUIElementCreateApplication(ProcessInfo.processInfo.processIdentifier)
            dumpAX(tree, tag: "submenu-diagnostic-picker")
            captureFrame(window: window, screen: screen, name: "submenu-diagnostic-picker-\(appearance)")
            let options = flatten(tree).filter { role($0) == "AXMenuItem" }
            for option in options { print("PICKER_OPTION form=diagnostic-picker title=\(title(option)) enabled=\(enabled(option)) selected=\(selected(option))") }
            if let choice = options.first(where: { title($0) == "Shape field" }) { print("PICKER_ACTION form=diagnostic-picker value=Shape field axStatus=\(AXUIElementPerformAction(choice, kAXPressAction as CFString).rawValue)") }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                print("MENU_SELECTION form=diagnostic-picker tools=\(state.tool) diagnostic=\(state.mode) actions=\(state.actionCounts)")
                openOverflowAgain(window: window, screen: screen) { inspectMoreMenu(window: window, screen: screen, state: state) }
            }
        }
    }

    private func openOverflowAgain(window: NSWindow, screen: NSScreen, next: @escaping () -> Void) {
        let app = AXUIElementCreateApplication(ProcessInfo.processInfo.processIdentifier)
        if let overflow = findOverflow(flatten(app)) {
            _ = AXUIElementPerformAction(overflow, kAXPressAction as CFString)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.35, execute: next)
        } else { print("OVERFLOW_AX unavailable-on-reopen"); next() }
    }

    private func inspectMoreMenu(window: NSWindow, screen: NSScreen, state: ProbeState) {
        let app = AXUIElementCreateApplication(ProcessInfo.processInfo.processIdentifier)
        guard let row = flatten(app).first(where: { role($0) == "AXMenuItem" && title($0).contains("More image actions") }) else {
            print("MENU_UNAVAILABLE form=More image actions row=unavailable actions=\(state.actionCounts)"); NSApp.terminate(nil); return
        }
        print("MENU_ROW form=More image actions title=\(title(row)) enabled=\(enabled(row)) selected=\(selected(row))")
        let status = AXUIElementPerformAction(row, kAXPressAction as CFString)
        print("MENU_OPEN form=More image actions axStatus=\(status.rawValue)")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            let tree = AXUIElementCreateApplication(ProcessInfo.processInfo.processIdentifier)
            dumpAX(tree, tag: "submenu-more-actions")
            captureFrame(window: window, screen: screen, name: "submenu-more-actions-\(appearance)")
            for option in flatten(tree).filter({ role($0) == "AXMenuItem" }) {
                print("MENU_OPTION form=More image actions title=\(title(option)) enabled=\(enabled(option)) selected=\(selected(option))")
            }
            if let export = flatten(tree).first(where: { role($0) == "AXMenuItem" && title($0).contains("Export format") }) {
                _ = AXUIElementPerformAction(export, kAXPressAction as CFString)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    let submenu = AXUIElementCreateApplication(ProcessInfo.processInfo.processIdentifier)
                    dumpAX(submenu, tag: "submenu-export-format")
                    captureFrame(window: window, screen: screen, name: "submenu-export-format-\(appearance)")
                    let options = flatten(submenu).filter { role($0) == "AXMenuItem" }
                    for option in options { print("PICKER_OPTION form=export-format title=\(title(option)) enabled=\(enabled(option)) selected=\(selected(option))") }
                    if let choice = options.first(where: { title($0) == "TIFF" }) { _ = AXUIElementPerformAction(choice, kAXPressAction as CFString) }
                    finishMenuActions(window: window, screen: screen, state: state)
                }
            } else { finishMenuActions(window: window, screen: screen, state: state) }
        }
    }

    private func finishMenuActions(window: NSWindow, screen: NSScreen, state: ProbeState) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
            openOverflowAgain(window: window, screen: screen) {
                let app = AXUIElementCreateApplication(ProcessInfo.processInfo.processIdentifier)
                if let row = flatten(app).first(where: { role($0) == "AXMenuItem" && title($0).contains("More image actions") }) {
                    _ = AXUIElementPerformAction(row, kAXPressAction as CFString)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                        let menu = AXUIElementCreateApplication(ProcessInfo.processInfo.processIdentifier)
                        if let reset = flatten(menu).first(where: { role($0) == "AXMenuItem" && title($0) == "Reset image" }) {
                            print("MENU_ACTION action=Reset image enabled=\(enabled(reset)) axStatus=\(AXUIElementPerformAction(reset, kAXPressAction as CFString).rawValue)")
                        } else { print("MENU_ACTION unavailable=Reset image") }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            print("MENU_RESULTS tools=\(state.tool) diagnostic=\(state.mode) exportFormat=\(state.format) actionCounts=\(state.actionCounts)")
                            NSApp.terminate(nil)
                        }
                    }
                } else { print("MENU_ACTION unavailable=More image actions"); NSApp.terminate(nil) }
            }
        }
    }
}

private func role(_ e: AXUIElement) -> String { axString(e, kAXRoleAttribute) }
private func title(_ e: AXUIElement) -> String { axString(e, kAXTitleAttribute) }
private func description(_ e: AXUIElement) -> String { axString(e, kAXDescriptionAttribute) }
private func id(_ e: AXUIElement) -> String { axString(e, "AXIdentifier") }
private func disabled(_ e: AXUIElement) -> Bool { var v: CFTypeRef?; return AXUIElementCopyAttributeValue(e, kAXEnabledAttribute as CFString, &v) == .success && (v as? Bool == false) }
private func enabled(_ e: AXUIElement) -> String { var v: CFTypeRef?; guard AXUIElementCopyAttributeValue(e, kAXEnabledAttribute as CFString, &v) == .success, let v else { return "unavailable" }; return String(describing: v) }
private func axString(_ e: AXUIElement, _ key: String) -> String { var v: CFTypeRef?; guard AXUIElementCopyAttributeValue(e, key as CFString, &v) == .success else { return "" }; return v as? String ?? "" }
private func axChildren(_ e: AXUIElement) -> [AXUIElement] { var v: CFTypeRef?; guard AXUIElementCopyAttributeValue(e, kAXChildrenAttribute as CFString, &v) == .success else { return [] }; return v as? [AXUIElement] ?? [] }
private func flatten(_ e: AXUIElement, depth: Int = 0) -> [AXUIElement] { guard depth < 16 else { return [e] }; return [e] + axChildren(e).flatMap { flatten($0, depth: depth + 1) } }
private func frame(_ e: AXUIElement) -> String {
    var p: CFTypeRef?, s: CFTypeRef?; AXUIElementCopyAttributeValue(e, kAXPositionAttribute as CFString, &p); AXUIElementCopyAttributeValue(e, kAXSizeAttribute as CFString, &s)
    var point = CGPoint.zero, size = CGSize.zero
    if let p { AXValueGetValue(p as! AXValue, .cgPoint, &point) }; if let s { AXValueGetValue(s as! AXValue, .cgSize, &size) }
    return "\(point.x),\(point.y),\(size.width),\(size.height)"
}
private func selected(_ e: AXUIElement) -> String { var v: CFTypeRef?; guard AXUIElementCopyAttributeValue(e, "AXSelected" as CFString, &v) == .success, let v else { return "unavailable" }; return String(describing: v) }
private func axDump(_ e: AXUIElement) -> [String: Any] { ["role": role(e), "title": title(e), "description": description(e), "identifier": id(e), "frame": frame(e), "enabled": enabled(e), "selected": selected(e), "value": axString(e, kAXValueAttribute)] }
private func dumpAX(_ e: AXUIElement, tag: String) { appendJSON(["tag": tag, "tree": flatten(e).map(axDump)], name: "ax-\(tag)-\(scenario)-\(appearance).json"); print("AX_DUMP tag=\(tag) nodes=\(flatten(e).count)") }
private func rect(_ r: CGRect) -> [Double] { [r.origin.x, r.origin.y, r.width, r.height] }
private func size(_ s: CGSize) -> [Double] { [s.width, s.height] }
private func appendJSON(_ value: Any, name: String) { let u = output.appendingPathComponent(name); let d = (try? JSONSerialization.data(withJSONObject: value, options: [.prettyPrinted, .sortedKeys, .fragmentsAllowed])) ?? Data(); try? d.write(to: u, options: .atomic) }
private func appendMembership(_ value: [String: Any], members: Set<String>, items: [[String: Any]]) {
    let path = output.appendingPathComponent("membership.tsv")
    if !FileManager.default.fileExists(atPath: path.path) { try? "scenario\tappearance\twidth\tAXIdentifiers\tNSToolbarItems\n".write(to: path, atomically: true, encoding: .utf8) }
    let ids = members.sorted().joined(separator: ",")
    let names = items.filter { ($0["visible"] as? Bool) == true }.map { "\($0["sourceOrder"] ?? ""):\($0["identifier"] ?? ""):\($0["priority"] ?? "")" }.joined(separator: ",")
    let line = "\(scenario)\t\(appearance)\t\(value["width"] ?? "")\t\(ids)\t\(names)\n"
    if let handle = try? FileHandle(forWritingTo: path) { defer { try? handle.close() }; try? handle.seekToEnd(); try? handle.write(contentsOf: Data(line.utf8)) }
}
private func captureFrame(window: NSWindow, screen: NSScreen, name: String) {
    guard NSApp.isActive, window.isKeyWindow, window.occlusionState.contains(.visible), window.backingScaleFactor > 0 else { print("CAPTURE_GATE_FAIL name=\(name) active=\(NSApp.isActive) key=\(window.isKeyWindow) visible=\(window.occlusionState.contains(.visible)) scale=\(window.backingScaleFactor)"); return }
    let full = output.appendingPathComponent(name + ".png")
    let proc = Process(); proc.executableURL = URL(fileURLWithPath: shot); proc.arguments = [full.path, "0"]
    do { try proc.run(); proc.waitUntilExit() } catch { print("CAPTURE_ERROR name=\(name) error=\(error)"); return }
    guard proc.terminationStatus == 0, let src = CGImageSourceCreateWithURL(full as CFURL, nil), let image = CGImageSourceCreateImageAtIndex(src, 0, nil) else { print("CAPTURE_ERROR name=\(name) exit=\(proc.terminationStatus)"); return }
    let scale = window.backingScaleFactor
    let top = Int((screen.frame.maxY - window.frame.maxY) * scale)
    let cropRect = CGRect(x: Int(window.frame.minX * scale), y: top, width: Int(window.frame.width * scale), height: Int(window.frame.height * scale))
    if let crop = image.cropping(to: cropRect), let dest = CGImageDestinationCreateWithURL(output.appendingPathComponent(name + "-window.png") as CFURL, "public.png" as CFString, 1, nil) {
        CGImageDestinationAddImage(dest, crop, nil)
        if !CGImageDestinationFinalize(dest) { print("CROP_WRITE_FAIL name=\(name)") }
    } else { print("CROP_FAIL name=\(name) crop=\(cropRect) source=\(image.width)x\(image.height)") }
    print("CAPTURE_GATE_PASS name=\(name) active=true key=true visible=true frame=\(window.frame) scale=\(scale) exit=0 dimensions=\(image.width)x\(image.height)")
}

@main private struct ToolbarOverflowWidthApp: App {
    var body: some Scene { WindowGroup { ProbeView() }.windowResizability(.contentSize).commands {} }
}
