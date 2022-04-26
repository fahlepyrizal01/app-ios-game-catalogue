// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FeatureFavorite",
    platforms: [.iOS(.v14), .macOS(.v10_15)],
    products: [
        .library(
            name: "FeatureFavorite",
            targets: ["FeatureFavorite"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift", .upToNextMajor(from: "6.0.0")),
        .package(name: "ApiGames", url: "https://github.com/fahlepyrizal01/api-games-ios", .upToNextMajor(from: "1.0.0")),
        .package(path: "../Core")
    ],
    targets: [
        .target(
            name: "FeatureFavorite",
            dependencies: [
                "RxSwift",
                "ApiGames",
                "Core"
            ]),
        .testTarget(
            name: "FeatureFavoriteTests",
            dependencies: ["FeatureFavorite"]),
    ]
)
