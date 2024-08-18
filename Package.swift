// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "QuickServiceLocator",
    platforms: [.iOS(.v12), .macOS(.v12), .tvOS(.v12), .watchOS(.v4), .visionOS(.v1), .macCatalyst(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "QuickServiceLocator",
            targets: ["QuickServiceLocator"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "QuickServiceLocator"),
        .testTarget(
            name: "QuickServiceLocatorTests",
            dependencies: ["QuickServiceLocator"]),
    ]
)
