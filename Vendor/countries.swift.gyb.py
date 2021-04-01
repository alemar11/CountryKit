// CountryKit

% warning = "This file was automatically generated and should not be edited."
// MARK: - ${warning}

let _countries = [
%{
  import json
}%
% with open('countries.json') as file:
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
