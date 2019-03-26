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

import XCTest
@testable import CountryKit

class CountryKitTests: XCTestCase {
  
  let sut = CountryKit()
  
  // tests if all iOS regions code are mapped in CountryKit.
  func testRegionCodes() {
    for regionCode in  Locale.isoRegionCodes {
      let match = sut.countries.filter { $0.iso == regionCode }
      XCTAssertTrue(match.count == 1, "\(regionCode) hasn't a match in the CountryKit library.")
    }
  }
  
  // tests if all CountryKit's countries are mapped in iOS regions code.
  func testCountries() {
    let regionCodes = Locale.isoRegionCodes
    
    for country in sut.countries {
      let match = regionCodes.filter { $0 == country.iso }
      XCTAssertTrue(match.count == 1, "\(country) is not available.")
    }
    
  }
  
  func testSequence() {
    let iterator = sut.makeIterator()
    
    var i = 0
    while iterator.next() != nil { i+=1 }
    XCTAssert(sut.countries.count == i)
    
  }
  
  func testMissingFlag() {
    for country in sut.countries {
      print("\(country)\n")
      XCTAssertNotNil(country.flagImage, "\(country) should have a flag image.")
    }
  }
  
  func testDescription() {
    // nothing to test here...
    for country in sut.countries {
      print("\(country)\n")
    }
  }
  
  func testCurrentCountry() {
    XCTAssertNotNil(sut.current)
  }
  
  func testLocalizedName() {
    for country in sut.countries {
      XCTAssertTrue(country.localizedName != "", "\(country) shouldn't have an empty localized name image.")
    }
  }
  
  func testInitializer() {
    let country = Country(name: "Italy", iso: "IT", phoneCode: 39, countryCode: 380)
    
    XCTAssertTrue(country.name == "Italy")
    XCTAssertTrue(country.iso == "IT")
    XCTAssertTrue(country.phoneCode == 39)
    XCTAssertTrue(country.countryCode == 380)
    XCTAssertTrue(country.emoji == "🇮🇹")
    
  }
  
  func testSearchByIsoCode() {
    let italy = sut.searchByIsoCode("IT")
    XCTAssertNotNil(italy)
    XCTAssertNotNil(italy?.flagImage)
    XCTAssertTrue(italy?.emoji == "🇮🇹")
    
    let japan = sut.searchByIsoCode("jp")
    XCTAssertNotNil(japan)
    XCTAssertNotNil(japan?.flagImage)
    XCTAssertTrue(japan?.emoji == "🇯🇵")
    
    let unknown1 = sut.searchByIsoCode("xYz")
    XCTAssertNil(unknown1)
    
    let unknown2 = sut.searchByIsoCode("")
    XCTAssertNil(unknown2)
  }
  
  func testEmoji() {
    for country in sut.countries {
      XCTAssertFalse(country.emoji == "")
      XCTAssertTrue(country.emoji.isEmojiFlag)
    }
  }
  
}
