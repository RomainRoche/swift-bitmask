// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Bitmask",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(name: "Bitmask", type: .dynamic, targets: ["Bitmask"]),
    ],
    targets: [
        .target(
            name: "Bitmask",
            path: "Bitmask/"
        )
    ]
)
