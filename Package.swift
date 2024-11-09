// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "ArithmeticExpression",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "ArithmeticExpression",
            targets: ["ArithmeticExpression"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/cbepxbeo/arithmetic-foundation.git",
            from: "1.0.3"
        ),
        .package(
            url: "https://github.com/cbepxbeo/arithmetic-expression-generator.git",
            from: "0.0.3"
        ),
        
    ],
    targets: [
        .target(
            name: "ArithmeticExpression",
            dependencies: [
                .product(
                    name: "ArithmeticFoundation",
                    package: "arithmetic-foundation"
                ),
                .product(
                    name: "ArithmeticExpressionGenerator",
                    package: "arithmetic-expression-generator"
                ),
            ],
            path: "Sources"
        )
    ],
    swiftLanguageVersions: [ .version("5.9") ]
)
