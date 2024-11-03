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
    dependencies: [
        .package(url: "https://github.com/cbepxbeo/arithmetic-foundation.git", from: "1.0.0"),
        .package(url: "https://github.com/cbepxbeo/arithmetic-difficulty.git", from: "0.0.1"),
    ],
    targets: [
        .target(
            name: "ArithmeticExpression",
            dependencies: [
                .product(name: "ArithmeticFoundation", package: "arithmetic-foundation"),
                .product(name: "ArithmeticDifficulty", package: "arithmetic-difficulty"),
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "ArithmeticExpressionTests",
            dependencies: ["ArithmeticExpression"]
         ),
    ],
    swiftLanguageVersions: [ .version("5.9") ]
)
