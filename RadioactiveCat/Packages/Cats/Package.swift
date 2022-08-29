// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Cats",
    platforms: [
        .macOS("10.13"),
        .iOS("13.0")
    ],
    products: [
        .library(
            name: "Cats",
            targets: ["Cats"]),
    ],
    dependencies: [
        .package(url: "https://github.com/designatednerd/DatedImageGenerator.git", branch: "main"),
        .package(url: "https://github.com/icanzilb/DoNilDisturbPlugin.git", from: "0.0.5"),
    ],
    targets: [
        .target(
            name: "Cats",
            dependencies: [
                .product(name: "DatedImage", package: "DatedImageGenerator"),
            ],
            plugins: [
                .plugin(name: "DatedImageGenerator", package: "DatedImageGenerator"),
                .plugin(name: "DoNilDisturbPlugin", package: "DoNilDisturbPlugin") 
            ]
        ),
        .testTarget(
            name: "CatsTests",
            dependencies: ["Cats"]),
    ]
)
