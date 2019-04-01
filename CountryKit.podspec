Pod::Spec.new do |s|
  s.name    = 'CountryKit'
  s.version = '1.4.0'
  s.license = 'MIT'
  s.documentation_url = 'http://www.tinrobots.org/CountryKit'  
  s.summary   = 'A μlibrary in Swift containing all the countries with their localized name, ISO code, phone code, country code, flag image and emoji.'
  s.homepage  = 'https://github.com/tinrobots/CountryKit'
  s.authors   = { 'Alessandro Marzoli' => 'me@alessandromarzoli.com' }
  s.source    = { :git => 'https://github.com/tinrobots/CountryKit.git', :tag => s.version }
  s.requires_arc = true
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.2'}
  s.swift_version = "4.2"
  s.ios.deployment_target     = '10.0'
  s.osx.deployment_target     = '10.12'
  s.tvos.deployment_target    = '10.0'
  s.watchos.deployment_target = '3.0'

  s.source_files =  'Sources/*.swift', 
                    'Support/*.{h,m}'
  
  s.resources = 'Sources/Flags.xcassets'

end
