// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "Base2048",
    products: [
        .library(name: "Base2048", targets: ["Base2048"]),
    ],
    targets: [
        .target(name: "Base2048"),
        .testTarget(name: "Base2048Tests", dependencies: ["Base2048"]),
    ]
)
