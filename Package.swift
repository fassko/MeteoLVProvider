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
        .package(url: "https://github.com/scinfu/SwiftSoup.git", from: "1.6.2")
    ],
    targets: [
        .target(
            name: "MeteoLVProvider",
            dependencies: ["SwiftSoup"],
            path: "Sources")
    ]
)