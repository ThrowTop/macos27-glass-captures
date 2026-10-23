import AppKit
import SwiftUI
import CoreGraphics
import Foundation

let outputRoot = URL(fileURLWithPath: "out/sf-symbol-checks/s10", isDirectory: true)
try FileManager.default.createDirectory(at: outputRoot, withIntermediateDirectories: true)

struct OverflowProbe: View {
    let scheme: ColorScheme

    var body: some View {
        Image(systemName: "person.crop.circle.badge.plus")
            .font(.system(size: 20))
            .foregroundStyle(.primary)
            .border(Color.red, width: 1)
            .padding(8)
            .environment(\.colorScheme, scheme)
    }
}

@MainActor func capture(_ scheme: ColorScheme) throws -> [String: Any] {
    let name = scheme == .dark ? "dark" : "light"
    let renderer = ImageRenderer(content: OverflowProbe(scheme: scheme))
    renderer.scale = 1
    renderer.isOpaque = false
    guard let image = renderer.cgImage else {
        throw NSError(domain: "S10Overflow", code: 1,
            userInfo: [NSLocalizedDescriptionKey: "ImageRenderer returned no CGImage for \(name)"])
    }

    let bitmap = NSBitmapImageRep(cgImage: image)
    let png = try bitmap.representation(using: .png, properties: [:])!
    try png.write(to: outputRoot.appendingPathComponent("person-crop-circle-badge-plus-\(name)-1x.png"))

    var borderPixels: [(Int, Int)] = []
    var inkPixelsOutsideBorder: [[String: Int]] = []
    for y in 0..<image.height {
        for x in 0..<image.width {
            guard let color = bitmap.colorAt(x: x, y: y)?.usingColorSpace(.deviceRGB),
                  color.alphaComponent > 0.1 else { continue }
            let redBorder = color.redComponent > 0.8 && color.greenComponent < 0.2 &&
                            color.blueComponent < 0.2 && color.alphaComponent > 0.8
            if redBorder {
                borderPixels.append((x, y))
            } else if color.alphaComponent > 0.1 {
                inkPixelsOutsideBorder.append(["x": x, "y": y])
            }
        }
    }
    guard let left = borderPixels.map(\.0).min(), let right = borderPixels.map(\.0).max(),
          let top = borderPixels.map(\.1).min(), let bottom = borderPixels.map(\.1).max() else {
        throw NSError(domain: "S10Overflow", code: 2,
            userInfo: [NSLocalizedDescriptionKey: "Red image-frame border not found for \(name)"])
    }
    let outside = inkPixelsOutsideBorder.filter { point in
        point["x"]! < left || point["x"]! > right || point["y"]! < top || point["y"]! > bottom
    }
    return [
        "name": "person.crop.circle.badge.plus",
        "appearance": name,
        "pointSize": 20,
        "backingScale": 1,
        "imageSizePixels": [image.width, image.height],
        "redBorderBoundsInclusive": [left, top, right, bottom],
        "outsideInkPixelCount": outside.count,
        "outsideInkPixels": outside,
        "file": "person-crop-circle-badge-plus-\(name)-1x.png"
    ]
}

try MainActor.assumeIsolated {
    let results = try [capture(.light), capture(.dark)]
    let data = try JSONSerialization.data(withJSONObject: results,
        options: [.prettyPrinted, .sortedKeys])
    try data.write(to: outputRoot.appendingPathComponent("overflow-measurement.json"))
    for result in results {
        print("S10 \(result["appearance"]!) border=\(result["redBorderBoundsInclusive"]!) " +
              "outsideInkPixels=\(result["outsideInkPixelCount"]!)")
    }
}
