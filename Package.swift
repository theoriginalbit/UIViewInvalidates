// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "UIViewInvalidates",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(name: "UIViewInvalidates", targets: ["UIViewInvalidates"]),
    ],
    targets: [
        .target(name: "UIViewInvalidates"),
        .testTarget(name: "UIViewInvalidatesTests", dependencies: ["UIViewInvalidates"]),
    ]
)
