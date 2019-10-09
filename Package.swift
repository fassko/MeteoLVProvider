// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "MeteoLVProvider",
    products: [
        .library(
            name: "MeteoLVProvider",
            targets: ["MeteoLVProvider"])
    ],
    dependencies: [
        .package(url: "https://github.com/scinfu/SwiftSoup.git", from: "2.2.1")
    ],
    targets: [
        .target(
            name: "MeteoLVProvider",
            dependencies: ["SwiftSoup"],
            path: "Sources")
    ],
    swiftLanguageVersions: [.v5]
)
