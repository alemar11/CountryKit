// swift-tools-version:5.0

import PackageDescription

let package = Package(name: "CountryKit")
package.swiftLanguageVersions = [.v5]
package.products = [.library(name: "CountryKit", targets: ["CountryKit"])]

package.targets = [
  .target(name: "CountryKit", path: "Sources"),
]