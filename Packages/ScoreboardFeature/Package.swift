// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ScoreboardFeature",

    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .tvOS(.v17),
        .watchOS(.v10),
        .visionOS(.v1)
    ],

    products: [
        .library(name: "ScoreboardFeature", targets: ["ScoreboardFeature"])
    ],

    dependencies: [
        .package(url: "https://github.com/adamayoung/swift-redux.git", from: "1.1.0"),
        .package(url: "https://github.com/uber/needle.git", exact: "0.25.1"),
    ],

    targets: [
        .target(
            name: "ScoreboardFeature",
            dependencies: [
                .product(name: "SwiftRedux", package: "swift-redux"),
                .product(name: "NeedleFoundation", package: "needle")
            ]
        ),
        .testTarget(
            name: "ScoreboardFeatureTests",
            dependencies: ["ScoreboardFeature"]
        )
    ]
)
