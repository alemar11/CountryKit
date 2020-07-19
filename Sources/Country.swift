import Foundation

#if os(iOS) || os(tvOS) || os(watchOS)
  import UIKit
  /// **CountryKit**
  ///
  /// Alias for UIImage.
  public typealias Image = UIKit.UIImage
#elseif os(macOS)
  import Cocoa
  /// **CountryKit**
  ///
  /// Alias for NSImage.
  public typealias Image = AppKit.NSImage
#endif

/// **CountryKit**
///
open class Country: Codable {

  // MARK: - Properties

  /// **CountryKit**
  ///
  /// Country name.
  public let name: String

  /// **CountryKit**
  ///
  /// Country ISO code.
  public let iso: String

  /// **CountryKit**
  ///
  /// Country phone code.
  public let phoneCode: Int?

  /// **CountryKit**
  ///
  /// Country code.
  public let countryCode: Int?

  #if !os(watchOS)

  /// **CountryKit**
  ///
  /// Returns the country flag.
  public lazy var flagImage: Image? = {
    let image: Image?

    #if os(iOS) || os(tvOS)
      image = Image(named: iso.lowercased(), in: bundle, compatibleWith: nil)
    #elseif os(macOS)
      image = bundle.image(forResource: iso.lowercased())
    #endif
    return image
  }()

  #endif

  /// **CountryKit**
  ///
  /// Returns the country localized name in the user's region settings (or an empty string).
  public var localizedName: String {
    let locale = NSLocale.current as NSLocale
    let name = locale.displayName(forKey: .countryCode, value: iso)

    return name ?? ""
  }

  /// **CountryKit**
  ///
  /// Returns the country's flag emoji.
  public var emoji: String {
    let country = iso.uppercased()
    let emoji = country.unicodeScalars.compactMap { UnicodeScalar(127397 + $0.value) }.map { String($0) }.joined()

    //    for unicodeScalar in country.unicodeScalars {
    //      let scalar = UnicodeScalar(127397 + unicodeScalar.value)!
    //      emoji.append(String(scalar))
    //    }

    return emoji
  }

  // MARK: - Initializers

  public init(name: String, iso: String, phoneCode: Int?, countryCode: Int?) {
    self.name = name
    self.iso = iso
    self.phoneCode = phoneCode
    self.countryCode = countryCode
  }

  // MARK: - Private

  private enum CodingKeys: String, CodingKey {
    case name
    case iso
    case phoneCode
    case countryCode
  }

}

extension Country: CustomStringConvertible {

  /// **CountryKit**
  ///
  /// A textual representation of a `Country` instance.
  public var description: String {
    var description = """
    \(name) \(emoji)
    \tLocalized name: \(localizedName)
    \tISO code: \(iso)
    """

    if let phoneCode = phoneCode {
      description += "\n\tPhone code: \(phoneCode)"
    }

    if let countryCode = countryCode {
      description += "\n\tCountry code: \(countryCode)"
    }

    return description
  }

}
