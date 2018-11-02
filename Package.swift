// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "CountryKit",
  products: [
    .library(name: "CountryKit", targets: ["CountryKit"])
  ],
  targets: [
    .target(name: "CountryKit", path: "Sources"),
//    .testTarget(
//      name: "Tests",
//      dependencies: ["CountryKit"],
//      path: "Tests"
//    )
  ],
  swiftLanguageVersions: [.v4_2]
)
