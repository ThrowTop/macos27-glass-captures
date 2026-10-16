// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "GlassCaptures",
    platforms: [.macOS(.v14)],
    targets: [
        .target(name: "SafeKVC", path: "Sources/SafeKVC", publicHeadersPath: "include"),
        .executableTarget(name: "GlassCaptures", dependencies: ["SafeKVC"], path: "Sources/GlassCaptures")
    ]
)
