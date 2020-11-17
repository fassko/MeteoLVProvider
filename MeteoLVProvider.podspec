Pod::Spec.new do |s|
  s.name             = 'MeteoLVProvider'
  s.version          = '0.7.0'
  s.summary          = 'Observations providers from meteo.lv'

  s.description      = <<-DESC
Observations providers from meteo.lv website.
                       DESC

  s.homepage         = 'https://github.com/fassko/MeteoLVProvider'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Kristaps Grinbergs' => 'fassko@gmail.com' }
  s.source           = { :git => 'https://github.com/fassko/MeteoLVProvider.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.1'
  s.tvos.deployment_target = '13.1'
  s.osx.deployment_target = '15.0'
  s.watchos.deployment_target = '6.0'

  s.framework = 'Foundation'

  s.source_files = 'Sources/**/*.swift'

  s.dependency 'SwiftSoup', '~> 2.3'
  s.documentation_url = 'http://kristaps.me/MeteoLVProvider/'
  s.swift_version = '5.2'

end
