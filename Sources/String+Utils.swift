import Foundation

extension Character {

  /// **CountryKit**
  ///
  /// Returns `true` if `self` is a flag.
  var isFlag: Bool {
    let scalars = unicodeScalars
    return scalars.count == 2 && scalars.first!.isRegionalIndicator && scalars.last!.isRegionalIndicator
  }

}

extension Unicode.Scalar {

  /// **CountryKit**
  ///
  /// Returns `true` if `self` is a regional indicator.
  var isRegionalIndicator: Bool {
    return ("🇦"..."🇿").contains(self)
  }

}

extension String {

  /// **CountryKit**
  ///
  /// Returns `true` if `self` is an emoji flag.
  ///
  /// - Note: to check if a string contains a flag use: `self.contains { $0.isFlag }`
  /// - Note: to extrapolate the flags in a string use: `self.filter { $0.isFlag }`
  var isEmojiFlag: Bool {
    guard count == 1 else { return false }
    return first!.isFlag
  }

}
