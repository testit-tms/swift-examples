// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ci_examples",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .tvOS(.v12),
        .watchOS(.v4),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ci_examples",
            targets: ["ci_examples", "ci_examplesTests"]),
    ],
    dependencies: [
        .package(url: "https://github.com/testit-tms/adapters-swift", from: "0.3.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ci_examples",
            dependencies: [
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "ci_examplesTests",
            dependencies: [
                "ci_examples",
                .product(name: "testit-adapters-swift", package: "adapters-swift")
            ],
            path: "Tests"
        ),
    ]
)
