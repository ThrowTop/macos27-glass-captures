import AppKit
import SwiftUI
import CoreGraphics
import CoreText
import ObjectiveC.runtime
import Foundation

let baseSymbols = ["checkmark", "chevron.down", "magnifyingglass", "xmark.circle.fill", "plus", "ellipsis", "square.and.arrow.up", "cloud.sun.rain.fill", "person.crop.circle.badge.plus", "trash.slash", "star.fill", "gearshape", "minus", "poweron", "exclamationmark"]
let weightCodes = Array(1...9)
let weightNames = ["ultraLight", "thin", "light", "regular", "medium", "semibold", "bold", "heavy", "black"]
let weightValues: [CGFloat] = [-0.80, -0.60, -0.40, 0.00, 0.23, 0.30, 0.40, 0.56, 0.62]
let sizeNames = ["small", "medium", "large"]
let sizeValues: [CGFloat] = [1.0, 1.276, 1.647]
let pointSizes = [9, 13, 17, 20, 28, 100]
let mode = CommandLine.arguments.dropFirst().first ?? "full"
let review = mode == "review"
// matrix: the base symbols at every weight and scale over a range of point sizes, written to matrix/.
let matrix = mode == "matrix"
// review: the names in Resources/review-names.txt at black weight, large scale, 64 pt, written like all-symbols.
let allSymbols = mode == "all-symbols" || review
let smoke = mode == "smoke"
let symbols: [String] = allSymbols
    ? try String(contentsOfFile: review ? "Resources/review-names.txt" : "Resources/symbol-names.txt", encoding: .utf8).split(whereSeparator: \.isNewline).map(String.init)
    : (smoke ? ["checkmark", "plus"] : baseSymbols)
let v1Weights = smoke ? [4] : [1, 4, 9]
let sizes = smoke ? [2] : [1, 2, 3]
let points = smoke ? [100] : pointSizes
let root = URL(fileURLWithPath: allSymbols ? "out" : "out/sf-symbol-checks", isDirectory: true)
try FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
func writer(_ name: String) throws -> FileHandle {
    let url = root.appendingPathComponent(name)
    FileManager.default.createFile(atPath: url.path, contents: nil)
    return try FileHandle(forWritingTo: url)
}
func emit(_ obj: Any, _ handle: FileHandle) throws {
    let data = try JSONSerialization.data(withJSONObject: obj, options: [.fragmentsAllowed, .sortedKeys])
    handle.write(data); handle.write(Data([10]))
}
func json(_ value: Any?) -> Any {
    guard let value else { return NSNull() }
    if let n = value as? NSNumber { return n.doubleValue.isFinite ? n : NSNull() }
    if let x = value as? CGFloat { return x.isFinite ? Double(x) : NSNull() }
    if let v = value as? NSValue {
        let t = String(cString: v.objCType)
        if t.contains("EdgeInsets") || String(describing: v).contains("NSEdgeInsets") {
            let text = String(describing: v)
            if let re = try? NSRegularExpression(pattern: "[-+]?(?:\\d+\\.?\\d*|\\.\\d+)(?:[eE][-+]?\\d+)?") {
                let values = re.matches(in: text, range: NSRange(text.startIndex..., in: text)).compactMap { m -> Double? in
                    guard let range = Range(m.range, in: text) else { return nil }
                    return Double(text[range])
                }
                if values.count >= 4 { return Array(values.suffix(4)) }
            }
        }
        if t.contains("Rect") { let r = v.rectValue; return [r.origin.x, r.origin.y, r.size.width, r.size.height] }
        if t.contains("Size") { let s = v.sizeValue; return [s.width, s.height] }
        if t.contains("Point") { let p = v.pointValue; return [p.x, p.y] }
    }
    if let a = value as? [Any] { return a.map(json) }
    if let s = value as? String { return s }
    return String(describing: value)
}
func value(_ object: NSObject, _ key: String) -> Any? {
    let sel = NSSelectorFromString(key)
    return object.responds(to: sel) ? object.value(forKey: key) : nil
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
let metricKeys = ["alignmentRect", "alignmentRectUnrounded", "baselineOffset", "baselineOffsetUnrounded", "capHeight", "contentBounds", "referenceCanvasSize", "referencePointSize", "glyphWeight", "glyphSize", "glyphContinuousWeight", "glyphContinuousSize"]
func metrics(_ glyph: NSObject) -> [String: Any] {
    var result: [String: Any] = [:]
    for k in metricKeys { if let x = value(glyph, k) { result[k] = json(x) } }
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
let continuousSel = NSSelectorFromString("namedVectorGlyphWithName:scaleFactor:deviceIdiom:layoutDirection:glyphContinuousSize:glyphContinuousWeight:glyphPointSize:appearanceName:locale:")
guard let discreteMethod = class_getInstanceMethod(catalogClass, discreteSel), let continuousMethod = class_getInstanceMethod(catalogClass, continuousSel) else { fatalError("CUICatalog glyph selector missing") }
print("SELECTORS discrete=\(String(cString: method_getTypeEncoding(discreteMethod)!)) continuous=\(String(cString: method_getTypeEncoding(continuousMethod)!))")
typealias Discrete = @convention(c) (AnyObject, Selector, NSString, CGFloat, Int, Int, Int, Int, CGFloat, NSString?, NSLocale?) -> AnyObject?
typealias Continuous = @convention(c) (AnyObject, Selector, NSString, CGFloat, Int, Int, CGFloat, CGFloat, CGFloat, NSString?, NSLocale?) -> AnyObject?
let discrete = unsafeBitCast(method_getImplementation(discreteMethod), to: Discrete.self)
let continuous = unsafeBitCast(method_getImplementation(continuousMethod), to: Continuous.self)
func lookup(_ name: String, _ size: Int, _ weight: Int, _ pt: CGFloat) -> NSObject? {
    discrete(catalog, discreteSel, name as NSString, 1.0, 7, 5, size, weight, pt, "NSAppearanceNameSystem" as NSString, Locale(identifier: "en_US") as NSLocale) as? NSObject
}
func lookupContinuous(_ name: String, _ size: CGFloat, _ weight: CGFloat, _ pt: CGFloat) -> NSObject? {
    continuous(catalog, continuousSel, name as NSString, 1.0, 7, 5, size, weight, pt, "NSAppearanceNameSystem" as NSString, Locale(identifier: "en_US") as NSLocale) as? NSObject
}

let v1 = allSymbols ? FileHandle.nullDevice : try writer("v1.jsonl")
if !allSymbols { for name in symbols { for size in sizes { for weight in v1Weights { for pt in points {
    guard let g = lookup(name, size, weight, CGFloat(pt)) else { continue }
    let layerPaths = paths(g).mapValues { $0.map { ["path": $0] } }
    try emit(["schemaVersion": 2, "name": name, "idiom": "mac", "appearance": "default", "weightCode": weight, "sizeCode": size, "pointSize": pt, "layers": layerPaths, "metrics": metrics(g)], v1)
}}}} }
try v1.close()

func nsWeight(_ code: Int) -> NSFont.Weight { NSFont.Weight(rawValue: weightValues[code - 1]) }
func nsScale(_ index: Int) -> NSImage.SymbolScale { [.small, .medium, .large][index] }
func configured(_ name: String, _ pt: Int, _ weight: Int, _ scale: Int) -> NSImage? {
    NSImage(systemSymbolName: name, accessibilityDescription: nil)?.withSymbolConfiguration(NSImage.SymbolConfiguration(pointSize: CGFloat(pt), weight: nsWeight(weight), scale: nsScale(scale)))
}
func optionalSelector(_ image: NSImage, _ name: String) -> Any {
    let sel = NSSelectorFromString(name)
    guard image.responds(to: sel) else { return "absent" }
    return json(image.value(forKey: name))
}
let v2 = allSymbols || matrix ? FileHandle.nullDevice : try writer("v2.jsonl")
let v3 = try writer(matrix ? "matrix.jsonl" : allSymbols ? "all.jsonl" : "v3.jsonl")
let outputDir = matrix ? "matrix" : allSymbols ? "all" : "v3"
let appWeights = smoke ? [4] : [4, 7]
let layoutPoints = smoke ? [13] : [13, 20]
let layoutScales = smoke ? [1] : [0, 1, 2]
let rasterWeights = matrix ? Array(1...9) : review ? [9] : allSymbols ? [4] : (smoke ? [4] : [1, 4, 7, 9])
let rasterScales = matrix ? [0, 1, 2] : review ? [2] : allSymbols ? [1] : (smoke ? [1] : [0, 1, 2])
let rasterPoints = matrix ? [9, 11, 13, 15, 17, 20, 24, 28, 34, 44, 64] : review ? [64] : allSymbols ? [20] : (smoke ? [13] : [13, 20])
let missing = allSymbols ? try writer("all-missing.txt") : FileHandle.nullDevice
for name in symbols {
    if !allSymbols && !matrix { for pt in layoutPoints { for w in appWeights { for sc in layoutScales {
        guard let image = configured(name, pt, w, sc) else { continue }
        let app: [String: Any] = ["size": [image.size.width, image.size.height], "alignmentRect": json(NSValue(rect: image.alignmentRect)), "baselineOffsetFromBottom": optionalSelector(image, "baselineOffsetFromBottom"), "capInsets": optionalSelector(image, "capInsets"), "alignmentInsets": optionalSelector(image, "alignmentInsets")]
        let swift = SwiftUILayoutProbe.measure(name: name, pt: pt, weight: w, scale: sc)
        try emit(["name": name, "pointSize": pt, "weightCode": w, "scale": sizeNames[sc], "appKit": app, "swiftUI": swift], v2)
    }}} }
    for pt in rasterPoints { for w in rasterWeights { for sc in rasterScales {
        guard let image = configured(name, pt, w, sc) else {
            if allSymbols { missing.write(Data((name + "\n").utf8)) }
            continue
        }
        for backing in 1...2 {
            let width = max(1, Int(ceil(image.size.width * CGFloat(backing))))
            let height = max(1, Int(ceil(image.size.height * CGFloat(backing))))
            guard let rep = NSBitmapImageRep(bitmapDataPlanes: nil, pixelsWide: width, pixelsHigh: height, bitsPerSample: 8, samplesPerPixel: 4, hasAlpha: true, isPlanar: false, colorSpaceName: .deviceRGB, bytesPerRow: 0, bitsPerPixel: 0) else { continue }
            rep.size = NSSize(width: CGFloat(width) / CGFloat(backing), height: CGFloat(height) / CGFloat(backing))
            NSGraphicsContext.saveGraphicsState()
            let ctx = NSGraphicsContext(bitmapImageRep: rep)!
            NSGraphicsContext.current = ctx
            ctx.imageInterpolation = .high
            let rect = NSRect(origin: .zero, size: rep.size)
            image.draw(in: rect, from: .zero, operation: .sourceOver, fraction: 1, respectFlipped: false, hints: nil)
            ctx.compositingOperation = .sourceAtop
            NSColor.black.setFill(); rect.fill()
            NSGraphicsContext.restoreGraphicsState()
            let filename = review ? "black-large-64pt@\(backing)x.png" : allSymbols && !matrix ? "regular-medium-20pt@\(backing)x.png" : "\(weightNames[w - 1])-\(sizeNames[sc])-\(pt)pt@\(backing)x.png"
            let dir = root.appendingPathComponent("\(outputDir)/\(name)", isDirectory: true)
            try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
            try rep.representation(using: .png, properties: [:])?.write(to: dir.appendingPathComponent(filename))
            let rb = UserDefaults.standard.object(forKey: "_NSImageSymbolsAreRBLayerBacked")
            try emit(["name": name, "weight": weightNames[w - 1], "scale": sizeNames[sc], "pointSize": pt, "backingScale": backing, "file": "\(outputDir)/\(name)/\(filename)", "imageSizePoints": [image.size.width, image.size.height], "pixelSize": [width, height], "drawRect": [rect.origin.x, rect.origin.y, rect.width, rect.height], "rbLayerBacked": rb.map(json) ?? "absent"], v3)
        }
    }}}
}
try v2.close(); try v3.close(); try missing.close()

let v4 = allSymbols ? FileHandle.nullDevice : try writer("v4.jsonl")
if !allSymbols { for name in symbols { for w in (smoke ? [4] : weightCodes) { for sc in (smoke ? [1] : [0, 1, 2]) {
    let sizeCode = sc + 1
    guard let d = lookup(name, sizeCode, w, 20), let c = lookupContinuous(name, sizeValues[sc], weightValues[w - 1], 20) else { continue }
    try emit(["name": name, "weightCode": w, "scale": sizeNames[sc], "discretePaths": paths(d), "continuousPaths": paths(c), "discreteMetrics": metrics(d), "continuousMetrics": metrics(c)], v4)
}}} }
try v4.close()
print("DONE mode=\(mode) symbols=\(symbols.count)")

private struct FramePreference: PreferenceKey {
    static var defaultValue: [String: CGRect] = [:]
    static func reduce(value: inout [String: CGRect], nextValue: () -> [String: CGRect]) { value.merge(nextValue(), uniquingKeysWith: { _, n in n }) }
}
private final class AlignmentCapture { var baseline: CGFloat = .nan; var bottom: CGFloat = .nan; var frames: [String: CGRect] = [:] }
private struct SwiftUILayoutView: View {
    let name: String; let pt: Int; let weight: Int; let scale: Int; let pair: Bool; let capture: AlignmentCapture
    var font: Font { .system(size: CGFloat(pt), weight: [.ultraLight, .thin, .light, .regular, .medium, .semibold, .bold, .heavy, .black][weight - 1]) }
    var img: some View { Image(systemName: name).font(font).imageScale([.small, .medium, .large][scale]) }
    var body: some View {
        Group {
            if pair {
                HStack(alignment: .firstTextBaseline, spacing: 8) {
                    img.alignmentGuide(.firstTextBaseline) { d in capture.baseline = d[.firstTextBaseline]; capture.bottom = d[.bottom]; return d[.firstTextBaseline] }
                        .background(GeometryReader { p in Color.clear.preference(key: FramePreference.self, value: ["image": p.frame(in: .named("probe"))]) })
                    Text("Hxg").font(font).background(GeometryReader { p in Color.clear.preference(key: FramePreference.self, value: ["text": p.frame(in: .named("probe"))]) })
                }.background(GeometryReader { p in Color.clear.preference(key: FramePreference.self, value: ["stack": p.frame(in: .named("probe"))]) })
            } else {
                img.background(GeometryReader { p in Color.clear.preference(key: FramePreference.self, value: ["image": p.frame(in: .named("probe"))]) })
            }
        }.coordinateSpace(name: "probe").onPreferenceChange(FramePreference.self) { capture.frames = $0 }
    }
    func result() -> [String: Any] {
        func rect(_ key: String) -> [CGFloat]? { guard let r = capture.frames[key] else { return nil }; return [r.origin.x, r.origin.y, r.width, r.height] }
        return ["fittingSize": [CGFloat(pt), CGFloat(pt)], "imageFrame": rect("image") ?? [], "textFrame": rect("text") ?? [], "stackFrame": rect("stack") ?? [], "imageFirstTextBaseline": pair ? capture.baseline : .nan, "imageBottom": pair ? capture.bottom : .nan]
    }
}
private enum SwiftUILayoutProbe {
    static func measure(name: String, pt: Int, weight: Int, scale: Int) -> [String: Any] {
        let app = NSApplication.shared
        app.setActivationPolicy(.accessory)
        let capture = AlignmentCapture()
        let view = SwiftUILayoutView(name: name, pt: pt, weight: weight, scale: scale, pair: true, capture: capture)
        let host = NSHostingView(rootView: view)
        let window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 240, height: 80), styleMask: [], backing: .buffered, defer: false)
        window.contentView = host
        host.frame = NSRect(x: 0, y: 0, width: 240, height: 80)
        host.layoutSubtreeIfNeeded()
        RunLoop.current.run(until: Date().addingTimeInterval(0.08))
        let pair = view.result()
        window.orderOut(nil)
        let singleCapture = AlignmentCapture()
        let single = SwiftUILayoutView(name: name, pt: pt, weight: weight, scale: scale, pair: false, capture: singleCapture)
        let singleHost = NSHostingView(rootView: single)
        singleHost.frame = NSRect(x: 0, y: 0, width: 240, height: 80)
        window.contentView = singleHost
        singleHost.layoutSubtreeIfNeeded()
        RunLoop.current.run(until: Date().addingTimeInterval(0.05))
        let alone = single.result()
        return ["windowOrderedIn": false, "fittingSize": json(NSValue(size: singleHost.fittingSize)), "aloneImageFrame": alone["imageFrame"] ?? [], "pairedImageFrame": pair["imageFrame"] ?? [], "textFrame": pair["textFrame"] ?? [], "imageFirstTextBaseline": pair["imageFirstTextBaseline"] ?? NSNull(), "imageBottom": pair["imageBottom"] ?? NSNull()]
    }
}
