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

% warning = "This file was automatically generated and should not be edited."
// MARK: - ${warning}

let _countries = [
%{
  import json
}%
% with open('../Resources/countries.json') as file:
 % for country in json.load(file):
  %{
  name = country["name"].encode('utf-8')
  phoneCode = country.get("phoneCode")
  iso = country["iso"]
  countryCode = country.get('countryCode')
  }%
  % if phoneCode and countryCode:
  Country(name: "${name}", iso: "${iso}", phoneCode: ${phoneCode}, countryCode: ${countryCode}),
  % elif phoneCode is not None:
  Country(name: "${name}", iso: "${iso}", phoneCode: ${phoneCode}, countryCode: nil),
  % elif countryCode is not None:
  Country(name: "${name}", iso: "${iso}", phoneCode: nil, countryCode: ${countryCode}),
  % else:
  Country(name: "${name}", iso: "${iso}", phoneCode: nil, countryCode: nil),
  %end
 %end
%end
]