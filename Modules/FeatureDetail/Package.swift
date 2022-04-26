// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FeatureDetail",
    platforms: [.iOS(.v14), .macOS(.v10_15)],
    products: [
        .library(
            name: "FeatureDetail",
            targets: ["FeatureDetail"]),
    ],
    dependencies: [
        .package(name: "SDWebImage", url: "https://github.com/SDWebImage/SDWebImageSwiftUI", from: "5.12.5"),
        .package(url: "https://github.com/ReactiveX/RxSwift", .upToNextMajor(from: "6.0.0")),
        .package(name: "ApiGames", url: "https://github.com/fahlepyrizal01/api-games-ios", .upToNextMajor(from: "1.0.0")),
        .package(path: "../Core")
    ],
    targets: [
        .target(
            name: "FeatureDetail",
            dependencies: [
                .product(name: "SDWebImageSwiftUI", package: "SDWebImage"),
                "RxSwift",
                "ApiGames",
                "Core"
            ]),
        .testTarget(
            name: "FeatureDetailTests",
            dependencies: ["FeatureDetail"]),
    ]
)
