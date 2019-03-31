// swift-tools-version:5.0

import PackageDescription

let package = Package(name: "CountryKit")
package.products = [.library(name: "CountryKit", targets: ["CountryKit"])]
package.swiftLanguageVersions = [.v5]
package.platforms = [.macOS(.v10_12), .iOS(.v10), .tvOS(.v10), .watchOS(.v3)]
package.targets = [
  .target(name: "CountryKit", path: "Sources"),
]