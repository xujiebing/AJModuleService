Pod::Spec.new do |s|
  s.name             = 'AJModuleService'
  s.version          = '0.1.0'
  s.summary          = 'A short description of AJModuleService.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/xujiebing/AJModuleService'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xujiebing' => 'xujiebing1992@gmail.com' }
  s.source           = { :git => 'https://github.com/xujiebing/AJModuleService.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'AJModuleService/Classes/**/*'
  s.prefix_header_file = 'AJModuleService/Classes/AJModuleServicePCH.pch'
  s.public_header_files = 'AJModuleService/Classes/AJModuleService.h'
  
  # s.resource_bundles = {
  #   'AJModuleService' => ['AJModuleService/Assets/*.png']
  # }

  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
