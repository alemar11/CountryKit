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
    self.countries = _countries
  }

  /// **CountryKit**
  ///
  /// Returns a country (if any) that matches a given `ìsoCode`.
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
