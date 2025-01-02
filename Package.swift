// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PhosphorIconsSwift",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "PhosphorIconsSwift", targets: ["PhosphorIconsSwift"]),
    ],
    targets: [
        .target(name: "PhosphorIconsSwift", resources: [
            .process("Icons.xcassets")
        ]),
    ]
)
