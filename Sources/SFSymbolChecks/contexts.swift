import AppKit
import SwiftUI
import ScreenCaptureKit
import ImageIO

private let symbols = ["gearshape", "xmark", "square.and.arrow.up", "trash", "magnifyingglass", "checkmark", "plus", "chevron.down"]
private struct Frames: PreferenceKey {
    static var defaultValue: [String: CGRect] = [:]
    static func reduce(value: inout [String: CGRect], nextValue: () -> [String: CGRect]) {
        value.merge(nextValue(), uniquingKeysWith: { _, new in new })
    }
}
private func frameTag(_ id: String) -> some View {
    GeometryReader { proxy in Color.clear.preference(key: Frames.self, value: [id: proxy.frame(in: .named("capture"))]) }
}
private func measuredImage(_ symbol: String, id: String) -> some View {
    Image(systemName: symbol).background(frameTag("\(id)|image"))
}
private func measuredButton(_ label: some View, id: String, style: Int?) -> some View {
    let button = Button(action: {}) { label }.background(frameTag("\(id)|control"))
    switch style {
    case 1: return AnyView(button.buttonStyle(.glass))
    case 2: return AnyView(button.buttonStyle(.glassProminent))
    case 3: return AnyView(button.buttonStyle(.bordered))
    default: return AnyView(button)
    }
}
private struct ContextView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            row("1 Image", id: "1", style: nil, label: { symbol, key in measuredImage(symbol, id: key) })
            row("2 Glass", id: "2", style: 1, label: { symbol, key in measuredImage(symbol, id: key) })
            row("3 Glass prominent", id: "3", style: 2, label: { symbol, key in measuredImage(symbol, id: key) })
            row("4 Bordered", id: "4", style: 3, label: { symbol, key in measuredImage(symbol, id: key) })
            row("5 Glass Label", id: "5", style: 1, label: { symbol, key in Label { Text("Label") } icon: { measuredImage(symbol, id: key) } })
        }
        .padding(20)
        .frame(width: 1060, alignment: .leading)
        .background(Color(nsColor: .windowBackgroundColor))
        .coordinateSpace(name: "capture")
        .toolbar {
            ToolbarItemGroup(placement: .automatic) {
                ForEach(Array(symbols.prefix(4).enumerated()), id: \.offset) { index, symbol in
                    measuredButton(measuredImage(symbol, id: "6|\(symbol)"), id: "6|\(symbol)", style: nil)
                        .accessibilityLabel(symbol)
                        .help(symbol)
                }
            }
        }
    }
    @ViewBuilder private func row(_ title: String, id: String, style: Int?, label: (String, String) -> some View) -> some View {
        HStack(spacing: 12) {
            Text(title).frame(width: 140, alignment: .leading)
            ForEach(symbols, id: \.self) { symbol in
                Group {
                    if id == "1" {
                        label(symbol, "\(id)|\(symbol)").background(frameTag("\(id)|\(symbol)|control"))
                    } else {
                        measuredButton(label(symbol, "\(id)|\(symbol)"), id: "\(id)|\(symbol)", style: style)
                    }
                }.frame(width: 88, height: 58)
            }
        }
    }
}

@MainActor private final class Capture: NSObject, NSApplicationDelegate {
    private var window: NSWindow!
    private var frames: [String: CGRect] = [:]
    func applicationDidFinishLaunching(_ notification: Notification) { Task { await run() } }
    private func run() async {
        do {
            NSApp.setActivationPolicy(.regular)
            let host = NSHostingView(rootView: ContextView().onPreferenceChange(Frames.self) { [weak self] in self?.frames = $0 })
            window = NSWindow(contentRect: NSRect(x: 180, y: 180, width: 1060, height: 500), styleMask: [.titled, .closable], backing: .buffered, defer: false)
            window.title = "SF Symbol contexts"
            window.contentView = host
            window.center()
            window.makeKeyAndOrderFront(nil)
            NSApp.activate(ignoringOtherApps: true)
            try await Task.sleep(for: .seconds(2))
            try FileManager.default.createDirectory(atPath: "out/contexts", withIntermediateDirectories: true)
            let jsonl = URL(fileURLWithPath: "out/contexts.jsonl")
            FileManager.default.createFile(atPath: jsonl.path, contents: nil)
            let output = try FileHandle(forWritingTo: jsonl)
            for (appearance, name) in [("light", NSAppearance.Name.aqua), ("dark", NSAppearance.Name.darkAqua)] {
                NSApp.appearance = NSAppearance(named: name)
                window.appearance = NSAppearance(named: name)
                host.needsLayout = true
                host.layoutSubtreeIfNeeded()
                try await Task.sleep(for: .seconds(1))
                let scale = window.backingScaleFactor
                let image = try await screenshot()
                let file = "out/contexts/\(appearance)@\(Int(scale))x.png"
                try save(image, URL(fileURLWithPath: file))
                for row in 1...5 { for symbol in symbols {
                    try emit(["appearance": appearance, "scale": scale, "row": row, "symbol": symbol,
                              "controlFrame": rect(frames["\(row)|\(symbol)|control"]),
                              "imageFrame": rect(frames["\(row)|\(symbol)|image"])], output)
                }}
                for symbol in symbols.prefix(4) {
                    try emit(["appearance": appearance, "scale": scale, "row": 6, "symbol": symbol,
                              "controlFrame": rect(frames["6|\(symbol)|control"]),
                              "imageFrame": rect(frames["6|\(symbol)|image"])], output)
                }
            }
            try output.close()
            window.orderOut(nil)
            NSApp.terminate(nil)
        } catch { fputs("contexts failed: \(error)\n", stderr); NSApp.terminate(nil) }
    }
    private func screenshot() async throws -> CGImage {
        let content = try await SCShareableContent.excludingDesktopWindows(false, onScreenWindowsOnly: true)
        guard let scWindow = content.windows.first(where: { $0.windowID == CGWindowID(window.windowNumber) }) else {
            throw NSError(domain: "Contexts", code: 1, userInfo: [NSLocalizedDescriptionKey: "Capture window missing from ScreenCaptureKit"])
        }
        let config = SCStreamConfiguration()
        config.width = Int(window.frame.width * window.backingScaleFactor)
        config.height = Int(window.frame.height * window.backingScaleFactor)
        config.showsCursor = false
        return try await SCScreenshotManager.captureImage(contentFilter: SCContentFilter(desktopIndependentWindow: scWindow), configuration: config)
    }
}
private func rect(_ value: CGRect?) -> [String: CGFloat]? {
    guard let r = value else { return nil }
    return ["x": r.origin.x, "y": r.origin.y, "width": r.width, "height": r.height]
}
private func emit(_ object: [String: Any], _ handle: FileHandle) throws {
    let data = try JSONSerialization.data(withJSONObject: object, options: [.sortedKeys, .fragmentsAllowed])
    handle.write(data); handle.write(Data([10]))
}
private func save(_ image: CGImage, _ url: URL) throws {
    guard let destination = CGImageDestinationCreateWithURL(url as CFURL, "public.png" as CFString, 1, nil) else { throw CocoaError(.fileWriteUnknown) }
    CGImageDestinationAddImage(destination, image, nil)
    guard CGImageDestinationFinalize(destination) else { throw CocoaError(.fileWriteUnknown) }
}
let app = NSApplication.shared
let delegate = Capture()
app.delegate = delegate
app.run()
