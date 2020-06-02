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
            name: "CBip39",
            dependencies: [],
            path: "Sources/Modules",
            exclude: ["Modules/module.modulemap"],
            publicHeadersPath: "./"
        ),
        .target(
            name: "BIP39",
            dependencies: ["CBip39"],
            path: "Sources/",
            exclude: ["Modules", "Bip39/BIP39.h"]
        ),
        .testTarget(
            name: "BIP39Tests",
            dependencies: ["BIP39"],
            path: "Tests"
        ),
    ]
)
