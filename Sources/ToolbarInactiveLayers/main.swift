import AppKit
import SwiftUI
import ApplicationServices
import ScreenCaptureKit
import ImageIO
import UniformTypeIdentifiers
import CoreImage

private let out = URL(fileURLWithPath: CommandLine.arguments.first(where: { $0.hasPrefix("--out=") }).map { String($0.dropFirst(6)) } ?? "out/toolbar-inactive-layers", isDirectory: true)
private let lightRun = CommandLine.arguments.contains("--light")
private let modes = ["Composite", "Shape field", "Refraction", "Blur radius", "Backdrop sample", "Edge terms (outer / bleed / key-fill)", "Lighting masks (rim / tint / glow)", "Shadows"]
private var targetWindow: NSWindow?
private var stateIndex = 0

private struct ViewerReference: View {
    @State private var visibility: NavigationSplitViewVisibility = .all
    @State private var selection: Int? = 0
    @State private var tool = 0
    @State private var mode = 0
    @State private var inspectorPresented = true
    @State private var comparing = false
    @State private var blur = 0.4
    @State private var refraction = 0.6
    @State private var tinted = true

    var body: some View {
        NavigationSplitView(columnVisibility: $visibility) {
            List(selection: $selection) {
                Section("Images") {
                    ForEach(Array(["Golden hour", "Glass test chart", "Lab scene", "Rainbow arch", "Home screen"].enumerated()), id: \.offset) { index, name in
                        Label(name, systemImage: "photo").tag(index)
                    }
                }
            }
            .navigationSplitViewColumnWidth(260)
        } detail: {
            backdrop
                .navigationTitle("")
                .toolbar {
                    ToolbarItemGroup(placement: .navigation) {
                        Button("Undo image edit", systemImage: "chevron.backward") {}
                        Button("Redo image edit", systemImage: "chevron.forward") {}
                    }
                    ToolbarItem(placement: .principal) {
                        Picker("Tools", selection: $tool) {
                            Text("Material").tag(0)
                            Text("Optics").tag(1)
                            Text("Motion").tag(2)
                        }.pickerStyle(.segmented)
                    }
                    ToolbarSpacer(.fixed, placement: .principal)
                    ToolbarItem(placement: .principal) {
                        Picker("Glass diagnostic view", selection: $mode) {
                            ForEach(modes.indices, id: \.self) { Text(modes[$0]).tag($0) }
                        }
                        .pickerStyle(.menu)
                        .labelsHidden()
                        .frame(width: 200)
                    }
                    ToolbarItemGroup(placement: .primaryAction) {
                        Menu {
                            Button("Reset image") {}
                            Button("Align reference") {}
                            Divider()
                            Button("Export capture…") {}
                        } label: { Label("More image actions", systemImage: "ellipsis") }
                        Button(comparing ? "Hide reference" : "Compare") { comparing.toggle() }
                            .buttonStyle(.glassProminent)
                    }
                }
                .inspector(isPresented: $inspectorPresented) {
                    Form {
                        Section("Liquid Glass") {
                            Slider(value: $blur) { Text("Blur") }
                            Slider(value: $refraction) { Text("Refraction") }
                            Toggle("Tint", isOn: $tinted)
                        }
                        Section("Edges") {
                            Text("Outer, bleed and key-fill terms")
                            Text("Rim, tint and glow masks")
                        }
                    }
                    .formStyle(.grouped)
                    .inspectorColumnWidth(300)
                }
        }
    }

    private var backdrop: some View {
        ZStack {
            LinearGradient(colors: [.orange, .pink, .purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
            Canvas { context, size in
                for x in stride(from: 0.0, to: size.width, by: 24) { context.fill(Path(CGRect(x: x, y: 0, width: 2, height: size.height)), with: .color(.white.opacity(0.35))) }
                for y in stride(from: 0.0, to: size.height, by: 24) { context.fill(Path(CGRect(x: 0, y: y, width: size.width, height: 2)), with: .color(.black.opacity(0.25))) }
            }
        }.ignoresSafeArea()
    }
}

@main struct ToolbarInactiveLayersApp: App {
    init() { if let id = Bundle.main.bundleIdentifier { UserDefaults.standard.removePersistentDomain(forName: id) } }
    var body: some Scene {
        WindowGroup {
            ViewerReference()
                .frame(minWidth: 700, maxWidth: .infinity, minHeight: 400, maxHeight: .infinity)
                .preferredColorScheme(lightRun ? .light : .dark)
                .background(SequenceDriver())
        }.windowResizability(.contentMinSize)
    }
}

private struct SequenceDriver: NSViewRepresentable {
    func makeNSView(context: Context) -> NSView {
        let v = NSView()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { begin(v) }
        return v
    }
    func updateNSView(_ nsView: NSView, context: Context) {}
    private func begin(_ view: NSView) {
        guard let w = view.window, let screen = NSScreen.screens.first else { recordFailure("no-window-or-screen"); NSApp.terminate(nil); return }
        targetWindow = w
        w.setFrame(NSRect(x: 80, y: screen.frame.maxY - 800, width: 1280, height: 760), display: true)
        NSApp.setActivationPolicy(.regular)
        NSApp.activate(ignoringOtherApps: true)
        w.makeKeyAndOrderFront(nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { runNextState() }
    }
}

private let states = ["target-active-before", "finder-active", "target-active-after"]
private func runNextState() {
    guard let w = targetWindow else { recordFailure("target-window-disappeared"); NSApp.terminate(nil); return }
    if stateIndex >= states.count { NSApp.terminate(nil); return }
    let state = states[stateIndex]
    if state == "finder-active" {
        guard let finder = NSWorkspace.shared.runningApplications.first(where: { $0.bundleIdentifier == "com.apple.finder" }) else { recordFailure("finder-not-running"); NSApp.terminate(nil); return }
        finder.activate(options: [.activateIgnoringOtherApps])
    } else {
        NSApp.activate(ignoringOtherApps: true)
        w.makeKeyAndOrderFront(nil)
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
        let appearance = lightRun ? "light" : "dark"
        captureState(w, appearance: appearance, state: state)
        stateIndex += 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) { runNextState() }
    }
}

private func captureState(_ window: NSWindow, appearance: String, state: String) {
    let active = NSApp.isActive
    let key = window.isKeyWindow
    let main = window.isMainWindow
    let visible = window.isVisible
    let front = NSWorkspace.shared.frontmostApplication
    let occlusion = occlusionRecords(window)
    let captured = screenCapture()
    let appRecord: [String: Any] = ["bundleIdentifier": Bundle.main.bundleIdentifier ?? "unavailable", "active": active, "frontmostBundleIdentifier": front?.bundleIdentifier ?? "unavailable", "frontmostLocalizedName": front?.localizedName ?? "unavailable"]
    let windowRecord: [String: Any] = ["key": key, "main": main, "visible": visible, "firstResponderType": window.firstResponder.map { String(describing: type(of: $0)) } ?? "unavailable", "firstResponderIdentity": window.firstResponder.map(identity) ?? "unavailable", "frame": rect(window.frame), "backingScale": window.backingScaleFactor, "number": window.windowNumber, "occlusion": occlusion]
    let rootRecord: [String: Any] = ["type": window.contentView.map { String(describing: type(of: $0)) } ?? "unavailable", "active": active, "keyAppearance": window.keyView?.effectiveAppearance.name.rawValue ?? "unavailable", "viewAppearance": window.contentView?.effectiveAppearance.name.rawValue ?? "unavailable", "semanticContext": window.contentView.map { readKeys($0, keys: semanticKeys) } ?? [:]]
    let fixtureRecord: [String: Any] = ["windowWidth": 1280, "windowHeight": 760, "sidebarWidth": 260, "inspectorWidth": 300, "selection": "Golden hour (index 0)", "toolSelection": "Material (index 0)", "diagnosticSelection": "Composite (index 0)", "compare": "off; tint true", "sourceModifiers": ["PickerStyle.segmented", "PickerStyle.menu", "ToolbarSpacer.fixed", "buttonStyle.glassProminent"]]
    var result: [String: Any] = ["appearance": appearance, "state": state, "timestamp": ISO8601DateFormatter().string(from: Date())]
    result["app"] = appRecord
    result["window"] = windowRecord
    result["viewRoot"] = rootRecord
    result["fixtureInputs"] = fixtureRecord
    result["screen"] = captured.metadata
    result["focus"] = focusedAXRecord()
    if let root = window.contentView { result["views"] = viewRecords(root, path: "root") }
    result["ax"] = accessibilityRecords()
    do {
        try FileManager.default.createDirectory(at: out, withIntermediateDirectories: true)
        let data = try JSONSerialization.data(withJSONObject: result, options: [.prettyPrinted, .sortedKeys, .fragmentsAllowed])
        try data.write(to: out.appendingPathComponent("\(appearance)-\(state).json"), options: .atomic)
    } catch { recordFailure("json-write-\(error)") }
    if let image = captured.image {
        writePNG(image, out.appendingPathComponent("\(appearance)-\(state)-display.png"))
        writeCrops(image, window: window, appearance: appearance, state: state)
    }
    print("STATE \(appearance)/\(state) appActive=\(active) key=\(key) main=\(main) visible=\(visible) occludingWindows=\(occlusion.count) screen=\(captured.metadata)")
}

private let semanticKeys = ["glassBehavior", "glassVariant", "variant", "effectiveVariant", "subdued", "tint", "opacityReduced", "cornerRadius", "glassContext", "semanticContext"]
private func viewRecords(_ view: NSView, path: String) -> [[String: Any]] {
    var rows: [[String: Any]] = []
    var labels: [String] = []
    var effect: [String: Any] = [:]
    if let v = view as? NSVisualEffectView { effect = ["material": v.material.rawValue, "blendingMode": v.blendingMode.rawValue, "state": v.state.rawValue] }
    if let c = view as? NSControl { if let b = c as? NSButton, !b.title.isEmpty { labels.append(b.title) }; if let t = c as? NSTextField, !t.stringValue.isEmpty { labels.append(t.stringValue) } }
    var row: [String: Any] = ["path": path, "type": String(describing: type(of: view)), "identity": identity(view)]
    row["frame"] = rect(view.convert(view.bounds, to: nil))
    row["bounds"] = rect(view.bounds)
    row["hidden"] = view.isHidden
    row["alpha"] = view.alphaValue
    row["labels"] = labels
    let effectRecord: [String: Any] = effect.isEmpty ? ["availability": "not NSVisualEffectView"] : effect
    row["visualEffect"] = effectRecord
    row["semanticContext"] = readKeys(view, keys: semanticKeys)
    row["layer"] = view.layer.map(layerRecord) ?? ["availability": "view has no backing layer"]
    rows.append(row)
    for (i, child) in view.subviews.enumerated() { rows.append(contentsOf: viewRecords(child, path: "\(path).\(i)")) }
    return rows
}

private func layerRecord(_ layer: CALayer) -> [String: Any] {
    var r: [String: Any] = ["type": String(describing: type(of: layer)), "name": layer.name as Any? ?? NSNull(), "identity": identity(layer)]
    r["bounds"] = rect(layer.bounds); r["position"] = point(layer.position); r["anchorPoint"] = point(layer.anchorPoint)
    r["transform"] = transform(layer.transform); r["affineTransform"] = affine(layer.affineTransform())
    r["opacity"] = layer.opacity; r["hidden"] = layer.isHidden; r["opaque"] = layer.isOpaque
    r["backgroundColor"] = color(layer.backgroundColor)
    if let contents = layer.contents { r["contents"] = ["type": String(describing: type(of: contents)), "identity": identity(contents as AnyObject)] }
    else { r["contents"] = NSNull() }
    r["contentsRect"] = rect(layer.contentsRect); r["contentsScale"] = layer.contentsScale
    r["borderColor"] = color(layer.borderColor); r["borderWidth"] = layer.borderWidth; r["cornerRadius"] = layer.cornerRadius
    r["masksToBounds"] = layer.masksToBounds; r["compositingFilter"] = normalized(layer.compositingFilter)
    r["semanticContext"] = readKeys(layer, keys: semanticKeys)
    r["filters"] = filterRecords(layer.filters, key: "filters"); r["backgroundFilters"] = filterRecords(layer.backgroundFilters, key: "backgroundFilters")
    r["mask"] = layer.mask.map(layerRecord) as Any? ?? NSNull()
    r["sublayers"] = (layer.sublayers ?? []).enumerated().map { entry -> [String: Any] in ["order": entry.offset, "record": layerRecord(entry.element)] }
    return r
}

private func readKeys(_ object: NSObject, keys: [String]) -> [String: Any] {
    var values: [String: Any] = [:]
    for key in keys { values[key] = safeKeyRecord(object, key) }
    return values
}
private func filterRecords(_ filters: [Any]?, key: String) -> [String: Any] {
    guard let filters else { return ["availability": "\(key)=nil"] }
    let items: [[String: Any]] = filters.enumerated().map { entry in
        let index = entry.offset
        let filter = entry.element
        let obj = filter as AnyObject
        var inputs: [String: Any] = [:]
        if let f = filter as? CIFilter {
            for inputKey in f.inputKeys { inputs[inputKey] = safeKeyRecord(f as NSObject, inputKey) }
        }
        var record: [String: Any] = ["order": index, "class": String(describing: type(of: filter)), "identity": identity(obj), "inputs": inputs]
        if let nsObject = obj as? NSObject { record["name"] = safeKeyRecord(nsObject, "name") }
        record["inputKeys"] = (filter as? CIFilter)?.inputKeys ?? []
        return record
    }
    return ["availability": "present", "items": items]
}
private func safeKeyRecord(_ object: NSObject, _ key: String) -> [String: Any] {
    var value: AnyObject?
    var exceptionName: NSString?
    var exceptionReason: NSString?
    let status = SafeReadKey(object, key, &value, &exceptionName, &exceptionReason)
    switch status {
    case 0: return ["status": "value", "value": normalized(value)]
    case 1: return ["status": "unavailable"]
    default: return ["status": "exception", "name": exceptionName as String? ?? "unavailable", "reason": exceptionReason as String? ?? "unavailable"]
    }
}
private func normalized(_ value: Any?) -> Any {
    guard let value else { return NSNull() }
    if value is NSNull { return NSNull() }
    if let n = value as? NSNumber { return n }
    if let s = value as? String { return s }
    if CFGetTypeID(value as CFTypeRef) == CGColorGetTypeID() { return color(value as! CGColor) }
    if let a = value as? [Any] { return a.map(normalized) }
    if let d = value as? [String: Any] { return d.mapValues(normalized) }
    return ["class": String(describing: type(of: value)), "description": String(describing: value)]
}
private func accessibilityRecords() -> [[String: Any]] {
    let app = AXUIElementCreateApplication(ProcessInfo.processInfo.processIdentifier)
    var rows: [[String: Any]] = []
    func walk(_ e: AXUIElement, _ depth: Int) {
        if depth > 16 { return }
        let role = axString(e, "AXRole"), title = axString(e, "AXTitle"), desc = axString(e, "AXDescription")
        let r = axRect(e)
        rows.append(["role": role, "title": title, "description": desc, "identifier": axString(e, "AXIdentifier"), "frame": rect(r), "depth": depth])
        var v: CFTypeRef?
        if AXUIElementCopyAttributeValue(e, kAXChildrenAttribute as CFString, &v) == .success, let children = v as? [AXUIElement] { children.forEach { walk($0, depth + 1) } }
    }
    walk(app, 0)
    return rows
}
private func focusedAXRecord() -> [String: Any] {
    let app = AXUIElementCreateApplication(ProcessInfo.processInfo.processIdentifier)
    var value: CFTypeRef?
    guard AXUIElementCopyAttributeValue(app, "AXFocusedUIElement" as CFString, &value) == .success, let value else { return ["status": "unavailable"] }
    let e = value as! AXUIElement
    return ["status": "value", "role": axString(e, "AXRole"), "title": axString(e, "AXTitle"), "description": axString(e, "AXDescription"), "frame": rect(axRect(e))]
}
private func axString(_ e: AXUIElement, _ key: String) -> String { var v: CFTypeRef?; guard AXUIElementCopyAttributeValue(e, key as CFString, &v) == .success else { return "unavailable" }; return v as? String ?? "unavailable" }
private func axRect(_ e: AXUIElement) -> CGRect { var p: CFTypeRef?, s: CFTypeRef?; guard AXUIElementCopyAttributeValue(e, kAXPositionAttribute as CFString, &p) == .success, AXUIElementCopyAttributeValue(e, kAXSizeAttribute as CFString, &s) == .success, let p, let s else { return .zero }; var point = CGPoint.zero, size = CGSize.zero; _ = AXValueGetValue(p as! AXValue, .cgPoint, &point); _ = AXValueGetValue(s as! AXValue, .cgSize, &size); return CGRect(origin: point, size: size) }

private func occlusionRecords(_ target: NSWindow) -> [[String: Any]] {
    let infos = CGWindowListCopyWindowInfo([.optionOnScreenOnly], kCGNullWindowID) as? [[String: Any]] ?? []
    guard let index = infos.firstIndex(where: { ($0[kCGWindowNumber as String] as? Int) == target.windowNumber }) else { return [["status": "target-window-not-found-in-on-screen-list"]] }
    let targetRect = target.frame
    return infos.prefix(index).compactMap { e in
        guard let bounds = e[kCGWindowBounds as String] as? [String: CGFloat] else { return nil }
        let h = bounds["Height"] ?? 0
        let y = (NSScreen.screens.first?.frame.maxY ?? 0) - (bounds["Y"] ?? 0) - h
        let r = CGRect(x: bounds["X"] ?? 0, y: y, width: bounds["Width"] ?? 0, height: h).intersection(targetRect)
        guard !r.isNull && !r.isEmpty else { return nil }
        return ["windowNumber": e[kCGWindowNumber as String] ?? NSNull(), "owner": e[kCGWindowOwnerName as String] ?? "unavailable", "boundsIntersection": rect(r)]
    }
}

private func screenCapture() -> (image: CGImage?, metadata: [String: Any]) {
    guard CGPreflightScreenCaptureAccess() else { return (nil, ["status": "unavailable", "reason": "screen-recording-access-not-preapproved; no prompt requested"]) }
    let sem = DispatchSemaphore(value: 0); var result: CGImage?; var errorText: String?
    Task.detached {
        do {
            let content = try await SCShareableContent.excludingDesktopWindows(false, onScreenWindowsOnly: true)
            guard let display = content.displays.first(where: { $0.displayID == CGMainDisplayID() }) else { errorText = "main-display-not-listed"; sem.signal(); return }
            let config = SCStreamConfiguration(); config.width = display.width; config.height = display.height; config.showsCursor = false
            result = try await SCScreenshotManager.captureImage(contentFilter: SCContentFilter(display: display, excludingWindows: []), configuration: config)
        } catch { errorText = String(describing: error) }
        sem.signal()
    }
    guard sem.wait(timeout: .now() + 10) == .success else { return (nil, ["status": "timeout"]) }
    if let errorText { return (nil, ["status": "error", "reason": errorText]) }
    return (result, ["status": result == nil ? "error" : "captured", "pixelWidth": result?.width as Any? ?? NSNull(), "pixelHeight": result?.height as Any? ?? NSNull(), "backingScale": NSScreen.main?.backingScaleFactor as Any? ?? NSNull(), "captureAPI": "ScreenCaptureKit SCScreenshotManager.captureImage"])
}
private func writePNG(_ image: CGImage, _ url: URL) { guard let d = CGImageDestinationCreateWithURL(url as CFURL, UTType.png.identifier as CFString, 1, nil) else { return }; CGImageDestinationAddImage(d, image, nil); _ = CGImageDestinationFinalize(d) }
private func writeCrops(_ image: CGImage, window: NSWindow, appearance: String, state: String) {
    let scale = window.backingScaleFactor
    let windowRect = window.frame
    let screenTop = NSScreen.screens.first?.frame.maxY ?? CGFloat(image.height) / scale
    var crops: [(String, CGRect)] = [("navigation", CGRect(x: windowRect.minX, y: screenTop - windowRect.maxY, width: 280, height: windowRect.height))]
    for e in accessibilityRecords() {
        let title = "\(e["title"] ?? "") \(e["description"] ?? "")".lowercased()
        let role = e["role"] as? String ?? ""
        guard let frame = parseRect(e["frame"] as? String), frame.width > 0, frame.height > 0 else { continue }
        if title.contains("tools") && role != "AXRadioButton" { crops.append(("segmented-picker", frame.insetBy(dx: -8, dy: -8))) }
        if title.contains("glass diagnostic") || (role == "AXPopUpButton" && frame.width > 100) { crops.append(("menu-picker", frame.insetBy(dx: -8, dy: -8))) }
        if title.contains("more image") { crops.append(("more", frame.insetBy(dx: -10, dy: -10))) }
        if title.contains("compare") { crops.append(("compare", frame.insetBy(dx: -10, dy: -10))) }
    }
    for (name, rectPoints) in crops {
        let x = (rectPoints.minX) * scale
        let cropRect = CGRect(x: x, y: rectPoints.minY * scale, width: rectPoints.width * scale, height: rectPoints.height * scale).integral.intersection(CGRect(x: 0, y: 0, width: image.width, height: image.height))
        if !cropRect.isEmpty, let crop = image.cropping(to: cropRect) { writePNG(crop, out.appendingPathComponent("\(appearance)-\(state)-\(name).png")) }
    }
}

private func parseRect(_ s: String?) -> CGRect? { guard let s else { return nil }; let v = s.split(separator: ",").compactMap { Double($0) }; guard v.count == 4 else { return nil }; return CGRect(x: v[0], y: v[1], width: v[2], height: v[3]) }
private func rect(_ r: CGRect) -> String { "\(r.origin.x),\(r.origin.y),\(r.width),\(r.height)" }
private func point(_ p: CGPoint) -> [String: CGFloat] { ["x": p.x, "y": p.y] }
private func identity(_ o: AnyObject) -> String { String(describing: Unmanaged.passUnretained(o).toOpaque()) }
private func color(_ c: CGColor?) -> Any { guard let c else { return NSNull() }; return ["components": c.components ?? [], "space": c.colorSpace?.name as Any? ?? "unavailable", "alpha": c.alpha] }
private func affine(_ t: CGAffineTransform) -> [String: CGFloat] { ["a": t.a, "b": t.b, "c": t.c, "d": t.d, "tx": t.tx, "ty": t.ty] }
private func transform(_ t: CATransform3D) -> [String: CGFloat] { ["m11":t.m11,"m12":t.m12,"m13":t.m13,"m14":t.m14,"m21":t.m21,"m22":t.m22,"m23":t.m23,"m24":t.m24,"m31":t.m31,"m32":t.m32,"m33":t.m33,"m34":t.m34,"m41":t.m41,"m42":t.m42,"m43":t.m43,"m44":t.m44] }
private func recordFailure(_ s: String) { print("FAIL \(s)"); try? FileManager.default.createDirectory(at: out, withIntermediateDirectories: true); try? (s + "\n").write(to: out.appendingPathComponent("failure.txt"), atomically: true, encoding: .utf8) }
