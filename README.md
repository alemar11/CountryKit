# CountryKit

[![Swift 5.0](https://img.shields.io/badge/Swift-4.1-orange.svg?style=flat)](https://developer.apple.com/swift)
![Platforms](https://img.shields.io/badge/Platform-iOS%2010%2B%20|%20macOS%2010.12+%20|%20tvOS%2010+%20|%20watchOS%203+-blue.svg) 

[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/CountryKit.svg)](https://cocoapods.org/pods/CountryKit)

|Branch|Build Status|Code Coverage|
|----|----|----|
|Master|[![Build Status](https://travis-ci.org/tinrobots/CountryKit.svg?branch=master)](https://travis-ci.org/tinrobots/CountryKit)| ![Code Coverage](https://img.shields.io/codecov/c/github/tinrobots/CountryKit/master.svg)|
|Develop|![Build Status](https://travis-ci.org/tinrobots/CountryKit.svg?branch=develop)|![Code Coverage](https://img.shields.io/codecov/c/github/tinrobots/CountryKit/develop.svg)|

## CountryKit
[![GitHub release](https://img.shields.io/github/release/tinrobots/CountryKit.svg)](https://github.com/tinrobots/CountryKit/releases) 

A μlibrary in Swift containing all the countries with their localized name, ISO code, phone code, country code, flag image and emoji.

- [Requirements](#requirements)
- [Documentation](#documentation)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)
- [Contributing](#contributing)

## Requirements

- iOS 10.0+ / macOS 10.12+ / tvOS 10.0+ / watchOS 3.0+
- Xcode 10.2
- Swift 5.0

## Documentation

Documentation is [available online](http://www.tinrobots.org/CountryKit/).

> [http://www.tinrobots.org/CountryKit/](http://www.tinrobots.org/CountryKit/)

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1.0+ is required to build CountryKit 1.0.0+.

To integrate CountryKit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'CountryKit', '~> 2.0.0'
end
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate CountryKit into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "tinrobots/CountryKit" ~> 2.0.0
```

Run `carthage update` to build the framework and drag the built `CountryKit.framework` into your Xcode project.

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate CountryKit into your project manually.

#### Embedded Framework

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

```bash
$ git init
```

- Add CountryKit as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:

```bash
$ git submodule add https://github.com/tinrobots/CountryKit.git
```

- Open the new `CountryKit` folder, and drag the `CountryKit.xcodeproj` into the Project Navigator of your application's Xcode project.

    > It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

- Select the `CountryKit.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see two different `CountryKit.xcodeproj` folders each with two different versions of the `CountryKit.framework` nested inside a `Products` folder.

    > It does not matter which `Products` folder you choose from, but it does matter whether you choose the top or bottom `CountryKit.framework`.

- Select the top `CountryKit.framework` for iOS and the bottom one for macOS.

    > You can verify which one you selected by inspecting the build log for your project. The build target for `CountryKit` will be listed as either `CountryKit iOS`, `CountryKit macOS`, `CountryKit tvOS` or `CountryKit watchOS`.

## Usage

```swift
import CountryKit

let countryKit = CountryKit()

// list of all countries
let countries = countryKit.countries

// the system current country
let country = countryKit.current 

// search a country by its ISO code:
let italy = countryKit.searchByIsoCode("IT")

// iterate over the countries with an iterator:
let iterator = countryKit.makeIterator()
```

## License

[![License MIT](https://img.shields.io/badge/License-MIT-lightgrey.svg?style=flat)](https://github.com/tinrobots/CountryKit/blob/master/LICENSE.md))

CountryKit is released under the MIT license. See [LICENSE](./LICENSE.md) for details.

## Contributing

Pull requests are welcome!  
[Show your ❤ with a ★](https://github.com/tinrobots/mechanica/stargazers)