// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "GlassCaptures",
    platforms: [.macOS("27.0")],
    targets: [
        .target(name: "SafeKVC", path: "Sources/SafeKVC", publicHeadersPath: "include"),
        .executableTarget(name: "GlassCaptures", dependencies: ["SafeKVC"], path: "Sources/GlassCaptures")
    ]
)
