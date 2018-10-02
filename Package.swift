// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "MeteoLVProvider",
    products: [
        .library(
            name: "MeteoLVProvider",
            targets: ["MeteoLVProvider"])
    ],
    dependencies: [
        .package(url: "https://github.com/scinfu/SwiftSoup.git", from: "1.7.4")
    ],
    targets: [
        .target(
            name: "MeteoLVProvider",
            dependencies: ["SwiftSoup"],
            path: "Sources")
    ]
)
