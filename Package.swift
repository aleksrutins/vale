// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

enum TargetFramework { case cocoa, gtk }

#if os(macOS)
let targetFramework = TargetFramework.cocoa;
#else
let targetFramework = TargetFramework.gtk;
#endif

let package = Package(
    name: "Vale",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Vale",
            targets: ["Vale"]),
        .executable(name: "vale-widget-factory", targets: ["ValeWidgetFactory"])
    ],
    dependencies: targetFramework == .gtk ? [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/rhx/gir2swift.git", branch: "main"),
        .package(url: "https://github.com/rhx/SwiftGtk.git",  branch: "gtk4"),
    ] : [],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Vale",
            dependencies: targetFramework == .gtk ? [
                .product(name: "Gtk", package: "SwiftGtk")
            ] : []),
        .executableTarget(name: "ValeWidgetFactory",
               dependencies: [
                "Vale"
               ]),
        .testTarget(
            name: "ValeTests",
            dependencies: ["Vale"]),
    ]
)
