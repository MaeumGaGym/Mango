// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Mango",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "Mango",
            targets: ["Mango"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git",
                 from: "1.15.4")
    ],
    targets: [
        .target(
            name: "Mango"),
        .testTarget(
            name: "MangoTests",
            dependencies: ["Mango"]),
    ]
)
