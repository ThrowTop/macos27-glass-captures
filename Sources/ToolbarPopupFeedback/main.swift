import AppKit
import SwiftUI
import ApplicationServices
import ImageIO
import UniformTypeIdentifiers
import CryptoKit
import ScreenCaptureKit

private let out = URL(fileURLWithPath: CommandLine.arguments.first(where: { $0.hasPrefix("--out=") }).map { String($0.dropFirst(6)) } ?? "/tmp/toolbar-popup-feedback", isDirectory: true)
private let lightRun = CommandLine.arguments.contains("--light")
private let popupID = "toolbar-diagnostic-popup"
private let modes = ["Composite", "Shape field", "Refraction", "Blur radius", "Backdrop sample", "Edge terms (outer / bleed / key-fill)", "Lighting masks (rim / tint / glow)", "Shadows"]
private var hoverSignal = false
private var eventLines: [String] = []
private var axFrame = CGRect.zero
private var captured: [String: CGImage] = [:]
private var screenFails = 0

private let logLock = NSLock()
private func log(_ s: String) {
    logLock.lock(); defer { logLock.unlock() }
    print(s); fflush(stdout); eventLines.append(s)
    try? FileManager.default.createDirectory(at: out, withIntermediateDirectories: true)
    try? (eventLines.joined(separator: "\n") + "\n").write(to: out.appendingPathComponent("\(lightRun ? "light" : "dark")-events.txt"), atomically: true, encoding: .utf8)
}

private struct ProbeView: View {
    @State private var visibility: NavigationSplitViewVisibility = .all
    @State private var selection: Int? = 0
    @State private var tool = 0
    @State private var mode = 0
    @State private var inspectorPresented = true
    @State private var comparing = false
    @State private var blur = 0.4
    @State private var refraction = 0.6
    @State private var tinted = true
    @State private var hovered = false

    var body: some View {
        NavigationSplitView(columnVisibility: $visibility) {
            List(selection: $selection) {
                Section("Images") {
                    ForEach(Array(["Golden hour", "Glass test chart", "Lab scene", "Rainbow arch", "Home screen"].enumerated()), id: \.offset) { index, name in
                        Label(name, systemImage: "photo").tag(index)
                    }
                }
            }.navigationSplitViewColumnWidth(260)
        } detail: {
            ZStack {
                LinearGradient(colors: [.orange, .pink, .purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                Canvas { context, size in
                    for x in stride(from: 0.0, to: size.width, by: 24) { context.fill(Path(CGRect(x: x, y: 0, width: 2, height: size.height)), with: .color(.white.opacity(0.35))) }
                    for y in stride(from: 0.0, to: size.height, by: 24) { context.fill(Path(CGRect(x: 0, y: y, width: size.width, height: 2)), with: .color(.black.opacity(0.25))) }
                }
            }.ignoresSafeArea().navigationTitle("").toolbar {
                ToolbarItemGroup(placement: .navigation) {
                    Button("Undo image edit", systemImage: "chevron.backward") {}
                    Button("Redo image edit", systemImage: "chevron.forward") {}
                }
                ToolbarItem(placement: .principal) {
                    Picker("Tools", selection: $tool) { Text("Material").tag(0); Text("Optics").tag(1); Text("Motion").tag(2) }
                        .pickerStyle(.segmented)
                }
                ToolbarSpacer(.fixed, placement: .principal)
                ToolbarItem(placement: .principal) {
                    Picker("Glass diagnostic view", selection: $mode) { ForEach(modes.indices, id: \.self) { Text(modes[$0]).tag($0) } }
                        .pickerStyle(.menu).labelsHidden().frame(width: 200)
                        .accessibilityIdentifier(popupID)
                        .onHover { value in hovered = value; DispatchQueue.main.async { hoverSignal = value; log("HOVER_SIGNAL value=\(value)") } }
                }
                ToolbarItemGroup(placement: .primaryAction) {
                    Menu { Button("Reset image") {}; Button("Align reference") {}; Divider(); Button("Export capture…") {} } label: { Label("More image actions", systemImage: "ellipsis") }
                    Button(comparing ? "Hide reference" : "Compare") { comparing.toggle() }.buttonStyle(.glassProminent)
                }
            }.inspector(isPresented: $inspectorPresented) {
                Form {
                    Section("Liquid Glass") { Slider(value: $blur) { Text("Blur") }; Slider(value: $refraction) { Text("Refraction") }; Toggle("Tint", isOn: $tinted) }
                    Section("Edges") { Text("Outer, bleed and key-fill terms"); Text("Rim, tint and glow masks") }
                }.formStyle(.grouped).inspectorColumnWidth(300)
            }
        }
    }
}

@main struct ToolbarPopupFeedbackApp: App {
    var body: some Scene {
        WindowGroup {
            ProbeView().frame(minWidth: 700, maxWidth: .infinity, minHeight: 400, maxHeight: .infinity)
                .preferredColorScheme(lightRun ? .light : .dark).background(Driver())
        }.windowResizability(.contentMinSize)
    }
}

private struct Driver: NSViewRepresentable {
    func makeNSView(context: Context) -> NSView {
        let v = NSView()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { start(v) }
        return v
    }
    func updateNSView(_ nsView: NSView, context: Context) {}
    private func start(_ view: NSView) {
        guard let window = view.window, let screen = NSScreen.main else { log("GATE_FAIL no-window-or-screen"); NSApp.terminate(nil); return }
        window.setFrame(NSRect(x: 80, y: screen.frame.maxY - 800, width: 1280, height: 760), display: true)
        NSApp.setActivationPolicy(.regular); NSApp.activate(ignoringOtherApps: true); window.makeKeyAndOrderFront(nil)
        log("RUN appearance=\(lightRun ? "light" : "dark") displayPoints=\(screen.frame.size) scale=\(screen.backingScaleFactor)")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { guard let popup = findPopup() else { log("GATE_FAIL popup-ax-identifier-not-found"); dumpAX(); NSApp.terminate(nil); return }; axFrame = axFrameOf(popup); log("AX_POPUP id=\(popupID) frame=\(rect(axFrame))")
            guard axFrame.width > 0, axFrame.height > 0 else { log("GATE_FAIL popup-empty-frame"); NSApp.terminate(nil); return }
            dumpState(window)
            let away = CGPoint(x: screen.frame.minX + 24, y: screen.frame.minY + 24)
            move(away, "idle-pointer-away")
            settle("idle", requiredHover: false) { self.beginHover() }
        }
    }
    private func beginHover() {
        move(center(axFrame), "hover-target")
        waitForHover(true, left: 80) { self.settle("hover", requiredHover: true) { self.beginHeld() } }
    }
    private func beginHeld() {
        mouse(.leftMouseDown, at: center(axFrame), label: "held-down")
        DispatchQueue.global().async {
            var previous = "", same = 0, count = 0
            while same < 3 && count < 100 {
                let current = cropDigest()
                same = current == previous ? same + 1 : 1
                previous = current; count += 1
                Thread.sleep(forTimeInterval: 0.1)
            }
            if same < 3 { log("GATE_FAIL held-crop-never-stabilized") }
            else { log("SETTLED state=held gate=three-consecutive-identical-popup-crops hover=\(hoverSignal)"); self.logMenuState(); _ = capture("held"); _ = capture("menu-open") }
            mouse(.leftMouseUp, at: center(axFrame), label: "held-up")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.settle("released", requiredHover: true) { writeDeltaSummary(); writeLog(); NSApp.terminate(nil) }
            }
        }
    }
    private func waitForHover(_ value: Bool, left: Int, done: @escaping () -> Void) {
        if hoverSignal == value { done(); return }
        if left == 0 { log("GATE_FAIL hover-signal expected=\(value) actual=\(hoverSignal)"); writeLog(); NSApp.terminate(nil); return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { self.waitForHover(value, left: left - 1, done: done) }
    }
    private func settle(_ name: String, requiredHover: Bool, previous: [String] = [], same: Int = 0, left: Int = 100, done: @escaping () -> Void) {
        if hoverSignal != requiredHover { if left == 0 { log("GATE_FAIL \(name)-hover expected=\(requiredHover) actual=\(hoverSignal)"); NSApp.terminate(nil); return }; DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { self.settle(name, requiredHover: requiredHover, previous: previous, same: same, left: left - 1, done: done) }; return }
        let digest = cropDigest()
        let nextSame = digest == previous.last ? same + 1 : 1
        if nextSame >= 3 { log("SETTLED state=\(name) gate=three-consecutive-identical-popup-crops hover=\(hoverSignal)"); _ = capture(name); done(); return }
        if left == 0 { log("GATE_FAIL \(name)-crop-never-stabilized"); NSApp.terminate(nil); return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { self.settle(name, requiredHover: requiredHover, previous: [digest], same: nextSame, left: left - 1, done: done) }
    }
    private func logMenuState() {
        let app = AXUIElementCreateApplication(ProcessInfo.processInfo.processIdentifier)
        var menus = 0
        func walk(_ e: AXUIElement, _ d: Int) { if d > 12 { return }; if str(e, "AXRole") == "AXMenu" { menus += 1 }; for c in children(e) { walk(c, d + 1) } }
        walk(app, 0)
        let appWindows = NSApp.windows.filter(\.isVisible).map { "\(type(of: $0))@\(NSStringFromRect($0.frame)):level=\($0.level.rawValue)" }.joined(separator: ";")
        log("MENU_TRACKING axMenuCount=\(menus) visibleAppWindows=\(appWindows) appActive=\(NSApp.isActive) key=\(NSApp.keyWindow === NSApp.mainWindow) visible=\(NSApp.mainWindow?.isVisible ?? false)")
        dumpWindows()
    }
}

private func center(_ r: CGRect) -> CGPoint { CGPoint(x: r.midX, y: r.midY) }
private func rect(_ r: CGRect) -> String { "x=\(r.origin.x),y=\(r.origin.y),w=\(r.width),h=\(r.height)" }
private func move(_ p: CGPoint, _ label: String) { if let e = CGEvent(mouseEventSource: nil, mouseType: .mouseMoved, mouseCursorPosition: p, mouseButton: .left) { e.post(tap: .cghidEventTap) }; log("MOUSE event=moved label=\(label) point=\(p.x),\(p.y)") }
private func mouse(_ type: CGEventType, at p: CGPoint, label: String) { if let e = CGEvent(mouseEventSource: nil, mouseType: type, mouseCursorPosition: p, mouseButton: .left) { e.post(tap: .cghidEventTap) }; log("MOUSE event=\(type == .leftMouseDown ? "down" : "up") label=\(label) point=\(p.x),\(p.y)") }

private func image() -> CGImage? {
    guard CGPreflightScreenCaptureAccess() else { log("SCREEN_CAPTUREKIT_ERROR screen-recording-access-unavailable (preflight; no prompt requested)"); return nil }
    let semaphore = DispatchSemaphore(value: 0)
    var result: CGImage?
    var failure: String?
    Task.detached(priority: .userInitiated) {
        do {
            let content = try await SCShareableContent.excludingDesktopWindows(false, onScreenWindowsOnly: true)
            guard let display = content.displays.first(where: { $0.displayID == CGMainDisplayID() }) else { failure = "main-display-not-listed"; semaphore.signal(); return }
            let filter = SCContentFilter(display: display, excludingWindows: [])
            let config = SCStreamConfiguration()
            config.width = display.width; config.height = display.height; config.showsCursor = true
            result = try await SCScreenshotManager.captureImage(contentFilter: filter, configuration: config)
        } catch { failure = String(describing: error) }
        semaphore.signal()
    }
    if semaphore.wait(timeout: .now() + 8) == .timedOut { log("SCREEN_CAPTUREKIT_TIMEOUT") }
    if let failure { log("SCREEN_CAPTUREKIT_ERROR \(failure)") }
    return result
}
private func imageFile(_ cg: CGImage, _ url: URL) -> Bool {
    guard let dst = CGImageDestinationCreateWithURL(url as CFURL, UTType.png.identifier as CFString, 1, nil) else { return false }
    CGImageDestinationAddImage(dst, cg, nil); return CGImageDestinationFinalize(dst)
}
private func capture(_ name: String) -> String {
    try? FileManager.default.createDirectory(at: out, withIntermediateDirectories: true)
    guard let cg = image() else { screenFails += 1; log("SCREENSHOT_FAIL state=\(name) error=CGDisplayCreateImage-nil"); return "failed" }
    let full = out.appendingPathComponent("\(lightRun ? "light" : "dark")-\(name).png")
    let ok = imageFile(cg, full)
    if !ok { screenFails += 1 }
    let scale = NSScreen.main?.backingScaleFactor ?? 0
    let cropRect = CGRect(x: axFrame.minX * scale, y: axFrame.minY * scale, width: axFrame.width * scale, height: axFrame.height * scale).integral
    if let crop = cg.cropping(to: cropRect) { _ = imageFile(crop, out.appendingPathComponent("\(lightRun ? "light" : "dark")-\(name)-popup-crop.png")) }
    let sideRect = CGRect(x: CGFloat(max(0, cg.width - Int(144 * scale))), y: CGFloat(cg.height / 2), width: CGFloat(min(cg.width, Int(120 * scale))), height: CGFloat(min(cg.height / 2, Int(120 * scale))))
    if let side = cg.cropping(to: sideRect) { _ = imageFile(side, out.appendingPathComponent("\(lightRun ? "light" : "dark")-\(name)-unchanged-crop.png")) }
    captured[name] = cg
    log("SCREENSHOT state=\(name) path=\(full.path) exit=\(ok ? 0 : 1) screenPixels=\(cg.width)x\(cg.height) scale=\(scale) framePoints=1280x760")
    let w = NSApp.mainWindow
    log("STATE_GATE state=\(name) appActive=\(NSApp.isActive) windowKey=\(w?.isKeyWindow ?? false) windowVisible=\(w?.isVisible ?? false) windowFrame=\(w.map { NSStringFromRect($0.frame) } ?? "missing") scale=\(scale)")
    return full.path
}
private func cropDigest() -> String {
    guard let cg = image(), let crop = cg.cropping(to: CGRect(x: axFrame.minX * (NSScreen.main?.backingScaleFactor ?? 1), y: axFrame.minY * (NSScreen.main?.backingScaleFactor ?? 1), width: axFrame.width * (NSScreen.main?.backingScaleFactor ?? 1), height: axFrame.height * (NSScreen.main?.backingScaleFactor ?? 1)).integral), let provider = crop.dataProvider, let raw = provider.data else { return "capture-unavailable" }
    let d = raw as Data
    return SHA256.hash(data: d).map { String(format: "%02x", $0) }.joined()
}
private func writeLog() { logLock.lock(); defer { logLock.unlock() }; try? FileManager.default.createDirectory(at: out, withIntermediateDirectories: true); try? (eventLines.joined(separator: "\n") + "\n").write(to: out.appendingPathComponent("\(lightRun ? "light" : "dark")-events.txt"), atomically: true, encoding: .utf8) }

private func findPopup() -> AXUIElement? { find(AXUIElementCreateApplication(ProcessInfo.processInfo.processIdentifier)) { str($0, "AXIdentifier") == popupID } }
private func axFrameOf(_ e: AXUIElement) -> CGRect { var p: CFTypeRef?, s: CFTypeRef?; AXUIElementCopyAttributeValue(e, kAXPositionAttribute as CFString, &p); AXUIElementCopyAttributeValue(e, kAXSizeAttribute as CFString, &s); var point = CGPoint.zero, size = CGSize.zero; if let p { AXValueGetValue(p as! AXValue, .cgPoint, &point) }; if let s { AXValueGetValue(s as! AXValue, .cgSize, &size) }; return CGRect(origin: point, size: size) }
private func str(_ e: AXUIElement, _ a: String) -> String { var v: CFTypeRef?; guard AXUIElementCopyAttributeValue(e, a as CFString, &v) == .success else { return "" }; return v as? String ?? "" }
private func children(_ e: AXUIElement) -> [AXUIElement] { var v: CFTypeRef?; guard AXUIElementCopyAttributeValue(e, kAXChildrenAttribute as CFString, &v) == .success else { return [] }; return v as? [AXUIElement] ?? [] }
private func find(_ e: AXUIElement, _ predicate: (AXUIElement) -> Bool) -> AXUIElement? { if predicate(e) { return e }; for c in children(e) { if let f = find(c, predicate) { return f } }; return nil }
private func dumpAX() { func walk(_ e: AXUIElement, _ d: Int) { if d > 10 { return }; log("AX role=\(str(e, "AXRole")) title=\(str(e, "AXTitle")) desc=\(str(e, "AXDescription")) id=\(str(e, "AXIdentifier")) frame=\(rect(axFrameOf(e)))"); for c in children(e) { walk(c, d + 1) } }; walk(AXUIElementCreateApplication(ProcessInfo.processInfo.processIdentifier), 0) }

private func dumpState(_ window: NSWindow) {
    log("WINDOW active=\(NSApp.isActive) key=\(window.isKeyWindow) visible=\(window.isVisible) frame=\(NSStringFromRect(window.frame)) backingScale=\(window.backingScaleFactor) opaque=\(window.isOpaque)")
    log("CONFIG popup.controlSize=unspecified popup.glassBehavior=unspecified popup.variant=unspecified popup.subvariant=unspecified popup.subdued=unspecified popup.glassContext=unspecified viewer.controlSize=unspecified viewer.glassBehavior=unspecified viewer.variant=unspecified viewer.subvariant=unspecified viewer.subdued=unspecified viewer.glassContext=unspecified sourceModifiers=PickerStyle.menu,frame.width.200,labelsHidden")
    log("UNAVAILABLE_KEYS source-level unspecified popup/viewer/platter: controlSize, glassBehavior, variant, subvariant, subdued, glassContext; runtime inspection follows")
    dumpAX()
    if let root = window.contentView { dumpView(root, depth: 0) }
    dumpWindows()
}
private func dumpWindows() {
    let pid = ProcessInfo.processInfo.processIdentifier
    let entries = CGWindowListCopyWindowInfo([.optionOnScreenOnly], kCGNullWindowID) as? [[String: Any]] ?? []
    for e in entries where (e[kCGWindowOwnerPID as String] as? Int32) == pid {
        let number = e[kCGWindowNumber as String] as? Int ?? -1
        log("CGWINDOW id=\(number) layer=\(e[kCGWindowLayer as String] ?? "") bounds=\(e[kCGWindowBounds as String] ?? "") alpha=\(e[kCGWindowAlpha as String] ?? "")")
        if let w = NSApp.window(withWindowNumber: number), let root = w.contentView { log("MENU_WINDOW_VIEW level=\(w.level.rawValue) frame=\(NSStringFromRect(w.frame)) visible=\(w.isVisible) key=\(w.isKeyWindow)"); dumpView(root, depth: 0) }
    }
}
private func dumpView(_ v: NSView, depth: Int) {
    if depth > 10 { return }; let indent = String(repeating: " ", count: depth * 2)
    var s = "VIEW \(indent)type=\(type(of: v)) frame=\(NSStringFromRect(v.frame)) bounds=\(NSStringFromRect(v.bounds)) visible=\(v.isHidden == false) intrinsic=\(NSStringFromSize(v.intrinsicContentSize))"
    if let c = v as? NSControl { s += " controlSize=\(c.controlSize.rawValue) enabled=\(c.isEnabled)"; if let b = c as? NSButton { let cellSize = b.cell?.cellSize ?? .zero; s += " title=\(b.title) bezel=\(b.bezelStyle.rawValue) font=\(String(describing: b.font)) cellSize=\(NSStringFromSize(cellSize))" } }
    if let t = v as? NSTextField { s += " text=\(t.stringValue) font=\(String(describing: t.font)) alignment=\(t.alignment.rawValue)" }
    if let e = v as? NSVisualEffectView { s += " material=\(e.material.rawValue) blending=\(e.blendingMode.rawValue) state=\(e.state.rawValue)" }
    if let l = v.layer { s += " layer=\(type(of: l)) opacity=\(l.opacity) filters=\(String(describing: l.filters)) backgroundFilters=\(String(describing: l.backgroundFilters)) sublayers=\(l.sublayers?.count ?? 0)" }
    log(s)
    for key in ["controlSize", "glassBehavior", "variant", "subvariant", "subdued", "glassContext"] { log("KVC key=\(key) available=\(v.responds(to: NSSelectorFromString(key))) value=\(v.responds(to: NSSelectorFromString(key)) ? String(describing: v.value(forKey: key)) : "UNAVAILABLE")") }
    for c in v.subviews.prefix(24) { dumpView(c, depth: depth + 1) }
}

private func rgba(_ image: CGImage) -> [UInt8]? {
    let w = image.width, h = image.height
    var bytes = [UInt8](repeating: 0, count: w * h * 4)
    guard let ctx = CGContext(data: &bytes, width: w, height: h, bitsPerComponent: 8, bytesPerRow: w * 4,
                              space: CGColorSpaceCreateDeviceRGB(), bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) else { return nil }
    ctx.draw(image, in: CGRect(x: 0, y: 0, width: w, height: h))
    return bytes
}
private func writeDeltaSummary() {
    guard let base = captured["idle"], let a = rgba(base) else { log("DELTA_FAIL missing-idle-or-decode"); return }
    let scale = NSScreen.main?.backingScaleFactor ?? 1
    let r = CGRect(x: axFrame.minX * scale, y: axFrame.minY * scale, width: axFrame.width * scale, height: axFrame.height * scale).integral
    var lines = ["Pixel byte comparison after CGContext RGBA normalization; popup AX frame scaled by \(scale). No optical fitting.", "Baseline=\(lightRun ? "light" : "dark")-idle.png popupPixels=\(rect(r))"]
    for state in ["hover", "held", "released"] {
        guard let current = captured[state], let b = rgba(current), a.count == b.count else { lines.append("\(state): unavailable"); continue }
        var inside = 0, outside = 0, x0 = base.width, y0 = base.height, x1 = -1, y1 = -1
        for y in 0..<base.height { for x in 0..<base.width {
            let i = (y * base.width + x) * 4
            if a[i] != b[i] || a[i + 1] != b[i + 1] || a[i + 2] != b[i + 2] || a[i + 3] != b[i + 3] {
                if r.contains(CGPoint(x: CGFloat(x), y: CGFloat(y))) { inside += 1 } else { outside += 1 }
                x0 = min(x0, x); y0 = min(y0, y); x1 = max(x1, x); y1 = max(y1, y)
            }
        } }
        lines.append("\(state): changedPixelsWithinPopup=\(inside) changedPixelsElsewhere=\(outside) fullDiffBounds=\(x1 < 0 ? "none" : "\(x0),\(y0)-\(x1),\(y1)")")
    }
    try? lines.joined(separator: "\n").write(to: out.appendingPathComponent("\(lightRun ? "light" : "dark")-pixel-delta.txt"), atomically: true, encoding: .utf8)
    lines.forEach(log)
    log("FINAL_GATE \(screenFails == 0 ? "PASS" : "FAIL") screenshotFailures=\(screenFails) appearances=\(lightRun ? "light" : "dark") states=idle,hover,held,released,menu-open")
}
