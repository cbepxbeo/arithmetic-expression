// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "ArithmeticExpression",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
    products: [
        .library(
            name: "ArithmeticExpression",
            targets: ["ArithmeticExpression"]),
    ],
    targets: [
        .target(
            name: "ArithmeticExpression",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "ArithmeticExpressionTests",
            dependencies: ["ArithmeticExpression"]
         ),
    ],
    swiftLanguageVersions: [ .version("5.9") ]
)
