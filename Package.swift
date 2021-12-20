// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "SwiftBitmask",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(name: "SwiftBitmask", type: .dynamic, targets: ["bitmask"]),
    ],
    targets: [
        .target(
            name: "bitmask",
            path: "bitmask/sources"
        )
    ]
)
