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
