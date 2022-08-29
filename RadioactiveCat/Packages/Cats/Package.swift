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
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Cats",
            targets: ["Cats"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/designatednerd/DatedImageGenerator.git", branch: "main"),
        
        // Temp until fix gets merged
        .package(url: "https://github.com/designatednerd/DoNilDisturbPlugin.git", branch: "main")
//        .package(url: "https://github.com/icanzilb/DoNilDisturbPlugin.git", from: "0.0.2"),

    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
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
