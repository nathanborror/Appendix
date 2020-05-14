// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "Appendix",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(name: "Appendix", targets: ["Appendix"]),
    ],
    targets: [
        .target(name: "Appendix", dependencies: []),
        .testTarget(name: "AppendixTests", dependencies: ["Appendix"]),
    ],
    swiftLanguageVersions: [
        .version("5.1")
    ]
)
