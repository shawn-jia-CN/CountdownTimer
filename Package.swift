// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "CountdownTimer",
    platforms: [
        .macOS(.v12)
    ],
    targets: [
        .executableTarget(
            name: "CountdownTimer",
            dependencies: [],
            path: "Sources"
        )
    ]
)
