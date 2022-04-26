// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [.iOS(.v14), .macOS(.v10_15)],
    products: [
        .library(
            name: "Core",
            targets: ["Core"]),
    ],
    dependencies: [
        .package(name: "SDWebImage", url: "https://github.com/SDWebImage/SDWebImageSwiftUI", from: "5.12.5"),
        .package(name: "ApiGames", url: "https://github.com/fahlepyrizal01/api-games-ios", .upToNextMajor(from: "1.0.0"))
    ],
    targets: [
        .target(
            name: "Core",
            dependencies: [
                .product(name: "SDWebImageSwiftUI", package: "SDWebImage"),
                "ApiGames"
            ]),
        .testTarget(
            name: "CoreTests",
            dependencies: ["Core"]),
    ]
)
