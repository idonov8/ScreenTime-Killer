// swift-tools-version: 5.8
import PackageDescription

let package = Package(
    name: "SharedScreenTime",
    platforms: [.iOS(.v16)], // Specify iOS 16 as the minimum deployment target
    products: [
        .library(
            name: "SharedScreenTime",
            targets: ["SharedScreenTime"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SharedScreenTime",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "SharedScreenTimeTests",
            dependencies: ["SharedScreenTime"]),
    ]
)
