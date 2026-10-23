import AppKit
import SwiftUI
import CoreGraphics
import Foundation
import ObjectiveC.runtime

let root = URL(fileURLWithPath: "out/sf-symbol-checks/s9", isDirectory: true)
try FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
func output(_ relative: String) throws -> FileHandle {
    let url = root.appendingPathComponent(relative)
    try FileManager.default.createDirectory(at: url.deletingLastPathComponent(), withIntermediateDirectories: true)
    if !FileManager.default.fileExists(atPath: url.path) { FileManager.default.createFile(atPath: url.path, contents: nil) }
    return try FileHandle(forWritingTo: url)
}
func emit(_ value: Any, to handle: FileHandle) throws {
    let data = try JSONSerialization.data(withJSONObject: value, options: [.fragmentsAllowed, .sortedKeys])
    handle.write(data); handle.write(Data([10]))
}
func pathD(_ path: CGPath) -> String {
    var parts: [String] = []
    func f(_ p: CGPoint) -> String { String(format: "%.8g %.8g", locale: Locale(identifier: "en_US_POSIX"), Double(p.x), Double(p.y)) }
    path.applyWithBlock { e in
        let p = e.pointee.points
        switch e.pointee.type {
        case .moveToPoint: parts.append("M" + f(p[0]))
        case .addLineToPoint: parts.append("L" + f(p[0]))
        case .addQuadCurveToPoint: parts.append("Q" + f(p[0]) + " " + f(p[1]))
        case .addCurveToPoint: parts.append("C" + f(p[0]) + " " + f(p[1]) + " " + f(p[2]))
        case .closeSubpath: parts.append("Z")
        @unknown default: break
        }
    }
    return parts.joined(separator: " ")
}
func paths(_ glyph: NSObject) -> [String: [String]] {
    var result: [String: [String]] = [:]
    for (mode, selector) in [("monochrome", "monochromeLayers"), ("hierarchical", "hierarchicalLayers"), ("palette", "paletteLayers"), ("multicolor", "multicolorLayers")] {
        let sel = NSSelectorFromString(selector)
        guard glyph.responds(to: sel), let layers = glyph.value(forKey: selector) as? [NSObject] else { continue }
        result[mode] = layers.compactMap { layer in
            let shape = NSSelectorFromString("shape")
            guard layer.responds(to: shape), let method = class_getInstanceMethod(type(of: layer), shape) else { return nil }
            typealias Shape = @convention(c) (AnyObject, Selector) -> CGPath?
            return unsafeBitCast(method_getImplementation(method), to: Shape.self)(layer, shape).map(pathD)
        }
    }
    return result
}

let coreBundle = Bundle(path: "/System/Library/PrivateFrameworks/CoreUI.framework")!
guard coreBundle.load(), let catalogClass = NSClassFromString("CUICatalog") else { fatalError("CoreUI/CUICatalog unavailable") }
let catalogURL = URL(fileURLWithPath: "/System/Library/PrivateFrameworks/SFSymbols.framework/Versions/A/Resources/CoreGlyphs.bundle/Contents/Resources/Assets.car")
let initSel = NSSelectorFromString("initWithURL:error:")
guard let initMethod = class_getInstanceMethod(catalogClass, initSel) else { fatalError("CUICatalog initWithURL:error: missing") }
typealias CatalogInit = @convention(c) (AnyObject, Selector, NSURL, AutoreleasingUnsafeMutablePointer<NSError?>?) -> AnyObject?
let initializer = unsafeBitCast(method_getImplementation(initMethod), to: CatalogInit.self)
let allocated = (catalogClass as! NSObject.Type).perform(NSSelectorFromString("alloc"))!.takeUnretainedValue()
var initError: NSError?
guard let catalog = initializer(allocated, initSel, catalogURL as NSURL, &initError) else { fatalError("catalog init failed: \(String(describing: initError))") }
let discreteSel = NSSelectorFromString("namedVectorGlyphWithName:scaleFactor:deviceIdiom:layoutDirection:glyphSize:glyphWeight:glyphPointSize:appearanceName:locale:")
guard let discreteMethod = class_getInstanceMethod(catalogClass, discreteSel) else { fatalError("CUICatalog glyph selector missing") }
typealias Discrete = @convention(c) (AnyObject, Selector, NSString, CGFloat, Int, Int, Int, Int, CGFloat, NSString?, NSLocale?) -> AnyObject?
let discrete = unsafeBitCast(method_getImplementation(discreteMethod), to: Discrete.self)
func lookup(_ name: String, _ layout: Int, _ locale: String, _ appearance: String = "NSAppearanceNameAqua") -> NSObject? {
    discrete(catalog, discreteSel, name as NSString, 1.0, 7, layout, 2, 4, 100, appearance as NSString, NSLocale(localeIdentifier: locale)) as? NSObject
}

let colors: [(String, Color, (Int, Int, Int))] = [
    ("red", Color(red: 1, green: 0, blue: 0), (255, 0, 0)),
    ("green", Color(red: 0, green: 1, blue: 0), (0, 255, 0)),
    ("blue", Color(red: 0, green: 0, blue: 1), (0, 0, 255))
]
enum RenderMode: String, CaseIterable { case hierarchical, palette2, palette3, multicolor, monochrome }
struct SymbolProbe: View {
    let name: String; let mode: RenderMode; let paletteCount: Int; let value: Double?; let variableMode: Int?
    var image: Image { value.map { Image(systemName: name, variableValue: $0) } ?? Image(systemName: name) }
    @ViewBuilder var body: some View {
        if let variableMode {
            if variableMode == 0 { styled(image.symbolVariableValueMode(.color)) }
            else { styled(image.symbolVariableValueMode(.draw)) }
        } else { styled(image) }
    }
    @ViewBuilder func styled<V: View>(_ source: V) -> some View {
        let image = source.font(.system(size: 20))
        switch mode {
        case .hierarchical: image.symbolRenderingMode(.hierarchical).foregroundStyle(colors[0].1)
        case .palette2: image.symbolRenderingMode(.palette).foregroundStyle(colors[0].1, colors[1].1)
        case .palette3: image.symbolRenderingMode(.palette).foregroundStyle(colors[0].1, colors[1].1, colors[2].1)
        case .multicolor: image.symbolRenderingMode(.multicolor)
        case .monochrome: image.symbolRenderingMode(.monochrome).foregroundStyle(colors[0].1)
        }
    }
}
@MainActor func raster(_ name: String, _ mode: RenderMode, _ paletteCount: Int, _ scheme: ColorScheme, _ backing: Int, _ suffix: String, _ value: Double? = nil, _ variableMode: Int? = nil, gradient: Bool = false) throws -> [String: Any] {
    var content = AnyView(SymbolProbe(name: name, mode: mode, paletteCount: paletteCount, value: value, variableMode: variableMode).environment(\.colorScheme, scheme).frame(width: 32, height: 32))
    if gradient {
        content = AnyView(Image(systemName: name).font(.system(size: 20)).symbolRenderingMode(mode == .palette2 || mode == .palette3 ? .palette : mode == .hierarchical ? .hierarchical : mode == .multicolor ? .multicolor : .monochrome).symbolColorRenderingMode(.gradient).foregroundStyle(colors[0].1, colors[1].1, colors[2].1).environment(\.colorScheme, scheme).frame(width: 32, height: 32))
    }
    let renderer = ImageRenderer(content: content)
    renderer.scale = CGFloat(backing)
    guard let cg = renderer.cgImage else { throw NSError(domain: "S9Raster", code: 1, userInfo: [NSLocalizedDescriptionKey: "ImageRenderer returned no CGImage for \(name)"]) }
    let rep = NSBitmapImageRep(cgImage: cg)
    let relative = "rasters/\(suffix)/\(name)-\(mode.rawValue)-\(scheme == .dark ? "dark" : "light")-20pt@\(backing)x.png"
    let url = root.appendingPathComponent(relative)
    try FileManager.default.createDirectory(at: url.deletingLastPathComponent(), withIntermediateDirectories: true)
    try rep.representation(using: .png, properties: [:])!.write(to: url)
    var counts = [String: Int]()
    for color in colors {
        var count = 0
        for y in 0..<cg.height { for x in 0..<cg.width {
            guard let c = rep.colorAt(x: x, y: y)?.usingColorSpace(.deviceRGB) else { continue }
            if Int((c.redComponent * 255).rounded()) == color.2.0 && Int((c.greenComponent * 255).rounded()) == color.2.1 && Int((c.blueComponent * 255).rounded()) == color.2.2 && c.alphaComponent > 0 { count += 1 }
        }}
        counts[color.0] = count
    }
    return ["name": name, "renderingMode": mode.rawValue, "paletteCount": paletteCount, "appearance": scheme == .dark ? "dark" : "light", "pointSize": 20, "backingScale": backing, "variableValue": value as Any? ?? NSNull(), "variableMode": variableMode.map { $0 == 0 ? "color" : "draw" } ?? NSNull(), "gradient": gradient, "file": relative, "pureColorPixelCounts": counts]
}

let mode = CommandLine.arguments.dropFirst().first ?? "s9"
guard mode == "s9" else { fatalError("s9.swift accepts only mode s9") }
let base = ["checkmark", "chevron.down", "magnifyingglass", "xmark.circle.fill", "plus", "ellipsis", "square.and.arrow.up", "cloud.sun.rain.fill", "person.crop.circle.badge.plus", "trash.slash", "star.fill", "gearshape", "minus", "poweron", "exclamationmark"]
let rich = try String(contentsOfFile: "Resources/s9-multicolor-rich.txt", encoding: .utf8).split(whereSeparator: \.isNewline).map(String.init)
let selection = try output("e-r1-symbol-selection.tsv")
var selectionRows = ["kind\tname"]
selectionRows.append(contentsOf: base.map { "base\t\($0)" })
selectionRows.append(contentsOf: rich.map { "multicolor-rich\t\($0)" })
try selection.write(Data((selectionRows.joined(separator: "\n") + "\n").utf8))

let colorsOut = try output("e-r1-raster-colors.jsonl")
for name in base + rich { for scheme in [ColorScheme.light, .dark] { for backing in [1, 2] {
    for renderMode in [RenderMode.hierarchical, .palette2, .palette3, .multicolor] {
        let row = try raster(name, renderMode, renderMode == .palette2 ? 2 : renderMode == .palette3 ? 3 : 1, scheme, backing, "e-r1-r2-r3")
        try emit(row, to: colorsOut)
    }
}}}
try colorsOut.close()

let gradientNames = Array(rich.prefix(6))
let gradientOut = try output("e-r4-gradient-raster.jsonl")
for name in gradientNames { for renderMode in [RenderMode.monochrome, .hierarchical, .palette2, .palette3, .multicolor] { for scheme in [ColorScheme.light, .dark] { for backing in [1, 2] {
    try emit(try raster(name, renderMode, renderMode == .palette2 ? 2 : renderMode == .palette3 ? 3 : 1, scheme, backing, "e-r4-gradient", gradient: true), to: gradientOut)
}}}}
try gradientOut.close()
let gradientSelection = try output("e-r4-symbol-selection.txt")
let gradientSelectionText = "Selection: first six rows of Resources/s9-multicolor-rich.txt, ranked by unique nonempty multicolor layer colors, then layer count, then UTF-8 name.\n" + gradientNames.joined(separator: "\n") + "\n"
try gradientSelection.write(Data(gradientSelectionText.utf8))
try gradientSelection.close()

let variableNames = ["wifi", "speaker.wave.3.fill", "chart.bar.fill", "touchid", "waveform", "lines.measurement.vertical"]
let variableOut = try output("e-r6-variable-raster.jsonl")
for name in variableNames { for variableMode in [0, 1] { for value in [0.0, 0.25, 0.5, 0.75, 1.0] { for scheme in [ColorScheme.light, .dark] { for backing in [1, 2] {
    try emit(try raster(name, .palette3, 3, scheme, backing, "e-r6-variable", value, variableMode), to: variableOut)
}}}}}
try variableOut.close()
let variableSelection = try output("e-r6-variable-selection.txt")
let variableSelectionText = "Required: wifi, speaker.wave.3.fill, chart.bar.fill. Extras ranked across public export records by maximum monochrome layer count with participatesInVariableDraw=true; selected first three: touchid (6/6), waveform (6/6), lines.measurement.vertical (5/5). Source scan: MacUIKit binary-research/macos-27.2-26B5101f/tasks/sf-symbols-p1/e-r6-variable-selection.txt.\n"
try variableSelection.write(Data(variableSelectionText.utf8))
try variableSelection.close()

let names = try String(contentsOfFile: "Resources/s9-public-symbol-names.txt", encoding: .utf8).split(whereSeparator: \.isNewline).map(String.init)
let locales = ["ar", "he", "hi", "ja", "ko", "th", "zh-Hans"]
let rtlOut = try output("e-r8-locale-path-differences.jsonl")
for (index, locale) in locales.enumerated() {
    var changed: [String] = []
    for name in names {
        guard let baseline = lookup(name, 5, "en_US"), let candidate = lookup(name, 4, locale) else { continue }
        if paths(baseline) != paths(candidate) { changed.append(name) }
    }
    try emit(["locale": locale, "layoutDirectionCode": 4, "weightCode": 4, "sizeCode": 2, "pointSize": 100, "baselineLayoutDirectionCode": 5, "baselineLocale": "en_US", "queriedNames": names.count, "changedCount": changed.count, "changedNames": changed], to: rtlOut)
    print("E-R8 \(index + 1)/\(locales.count) \(locale) changed=\(changed.count)")
}
try rtlOut.close()

let metadata = try output("manifest.json")
try emit(["mode": "s9", "publicSymbolCount": names.count, "multicolorRichNames": rich.count, "baseNames": base.count, "variableNames": variableNames, "localeCodes": locales, "renderingModes": RenderMode.allCases.map(\.rawValue), "selectionSource": "Resources/s9-multicolor-rich.txt ranked from the full public attributes export", "runner": ProcessInfo.processInfo.environment["RUNNER_NAME"] ?? "GitHub Actions runner"], to: metadata)
try metadata.close()
print("DONE mode=s9 publicNames=\(names.count) rasterPacks=E-R1/R2/R3/E-R4/E-R6 E-R8 locales=\(locales.count)")
