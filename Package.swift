// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "UIViewInvalidates",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        .library(name: "UIViewInvalidates", targets: ["UIViewInvalidates"]),
    ],
    targets: [
        .target(name: "UIViewInvalidates"),
        .testTarget(name: "UIViewInvalidatesTests", dependencies: ["UIViewInvalidates"]),
    ]
)
