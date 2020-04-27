// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "BIP39",
    platforms: [
        .iOS(.v8),
        .tvOS(.v9),
        .watchOS(.v2),
        .macOS(.v10_10)
    ],
    products: [
        .library(
            name: "BIP39",
            targets: ["BIP39"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "BIP39",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "BIP39Tests",
            dependencies: ["BIP39"],
            path: "Tests"
        ),
    ]
)
