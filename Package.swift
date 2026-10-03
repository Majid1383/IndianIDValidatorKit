// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IndianIDValidatorKit",
    platforms: [.iOS(.v16), .macOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "IndianIDValidatorKit",
            targets: ["IndianIDValidatorKit"]
        ),
    ],
    targets: [
            .target(
                name: "IndianIDValidatorKit"
            ),
            .testTarget(
                name: "IndianIDValidatorKitTests",
                dependencies: ["IndianIDValidatorKit"]
            ),
        ],
    swiftLanguageModes: [.v6]
)
