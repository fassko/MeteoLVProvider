// swift-tools-version:5.2
import PackageDescription

let package = Package(
  name: "MeteoLVProvider",
  platforms: [
    .macOS(.v10_15),
    .iOS(.v13)
  ],
  products: [
    .library(
      name: "MeteoLVProvider",
      targets: ["MeteoLVProvider"])
  ],
  dependencies: [
    .package(url: "https://github.com/scinfu/SwiftSoup.git", from: "2.3.2")
  ],
  targets: [
    .target(
      name: "MeteoLVProvider",
      dependencies: ["SwiftSoup"],
      path: "Sources")
  ],
  swiftLanguageVersions: [.v5]
)
