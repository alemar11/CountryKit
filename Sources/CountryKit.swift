//
// CountryKit
//
// Copyright © 2016-2018 Tinrobots.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Foundation

#if os(iOS)
  import CoreTelephony
#endif

/// **CountryKit**
///
/// CountryKit Framework name.
internal let frameworkName = "CountryKit"

/// **CountryKit**
///
/// CountryKit Bundle.
internal let bundle = Bundle(for: CountryKit.self)

/// **CountryKit**
final public class CountryKit {
  // MARK: - Properties

  /// **CountryKit**
  ///
  /// Returns all the countries.
  public let countries: [Country]

  // MARK: - Initializers

  /// **CountryKit**
  ///
  /// Initializer.
  public init() {
    guard
      let jsonPath = bundle.path(forResource: "Countries.bundle/countries", ofType: "json"),
      let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonPath)),
      let countries = try? JSONDecoder().decode([Country].self, from: jsonData)
      else {
        fatalError("No countries found in CountryKit.")
    }

    self.countries = countries
  }

  /// **CountryKit**
  ///
  /// Returns a country (is any) that matches a given `ìsoCode`.
  public func searchByIsoCode(_ isoCode: String) -> Country? {
    let countries = self.countries.filter { $0.iso.lowercased() == isoCode.lowercased() }

    return countries.first
  }
}

// MARK: - Utils

extension CountryKit {
  /// **CountryKit**
  ///
  /// Returns the current user's country.
  public var current: Country? {
    var countryCode: String?

    if let regionCode = Locale.current.regionCode {
      countryCode = regionCode
    } else if let isoCode = currentSubscriberCelluparProviderIsoCountryCode() {
      countryCode = isoCode
    }

    guard let code = countryCode else { return nil }

    let country = searchByIsoCode(code)

    return country
  }

  private func currentSubscriberCelluparProviderIsoCountryCode() -> String? {
    #if os(iOS)
      return CTTelephonyNetworkInfo().subscriberCellularProvider?.isoCountryCode
    #else
      return nil
    #endif
  }
}

// MARK: - Sequence

extension CountryKit: Sequence {
  /// **CountryKit**
  ///
  /// Returns an iterator over the list of countries.
  public func makeIterator() -> AnyIterator<Country> {
    var index = 0

    return AnyIterator {
      guard index < self.countries.count else { return nil }

      let country = self.countries[index]
      index = self.countries.index(after: index)

      return country
    }
  }
}
