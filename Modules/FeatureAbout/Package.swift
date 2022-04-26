// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FeatureAbout",
    platforms: [.iOS(.v14), .macOS(.v10_15)],
    products: [
        .library(
            name: "FeatureAbout",
            targets: ["FeatureAbout"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "FeatureAbout",
            dependencies: []),
        .testTarget(
            name: "FeatureAboutTests",
            dependencies: ["FeatureAbout"]),
    ]
)
