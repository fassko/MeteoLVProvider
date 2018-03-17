// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "MeteoLVProvider",
    products: [
        .library(
            name: "MeteoLVProvider",
            targets: ["MeteoLVProvider"])
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "MeteoLVProvider",
            dependencies: [],
            path: "Sources")
    ]
)
