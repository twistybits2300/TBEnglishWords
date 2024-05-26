// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TBEnglishWords",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "TBEnglishWords",
            targets: ["TBEnglishWords"]),
    ],
    dependencies: [
        .package(url: "https://github.com/twistybits2300/TBCommon.git", branch: "main"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "TBEnglishWords",
            dependencies: [
                .product(name: "TBCommon", package: "TBCommon"),
            ],
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "TBEnglishWordsTests",
            dependencies: ["TBEnglishWords"]),
    ]
)
