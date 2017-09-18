Pod::Spec.new do |s|
  s.name    = 'CountryKit'
  s.version = '1.0.0'
  s.license = 'MIT'
  s.documentation_url = 'http://www.tinrobots.org/CountryKit'  
  s.summary   = 'A library of Swift utils to ease your iOS/macOS/watchOS/tvOS development.'
  s.homepage  = 'https://github.com/tinrobots/CountryKit'
  s.authors   = { 'Alessandro Marzoli' => 'me@alessandromarzoli.com' }
  s.source    = { :git => 'https://github.com/tinrobots/CountryKit.git', :tag => s.version }
  s.requires_arc = true
  
  s.ios.deployment_target     = '10.0'
  s.osx.deployment_target     = '10.12'
  s.tvos.deployment_target    = '10.0'
  s.watchos.deployment_target = '3.0'

  s.source_files =  'Sources/*.swift', 
                    'Sources/*.{h,m}'
  
  s.resources = 'Sources/Flags.xcassets', 
                'Sources/Countries.bundle'

end
