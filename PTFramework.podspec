#
# Be sure to run `pod lib lint PTFramework.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PTFramework'
  s.version          = '1.0.0'
  s.summary          = 'PTFramework is a framework which adds functionality to the Play Time Productivity Application'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
'PTFramework is a framework which adds functionality to the Play Time Productivity Application - It is built using the MVVM architecture'
                       DESC

  #s.homepage         = 'https://github.com/bgouws@jhb.dvt.co.za/PTFramework'
  s.homepage          = 'https://github.com/bgouws/PTPod'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'bgouws@jhb.dvt.co.za' => 'bgouws@jhb.dvt.co.za' }
  #s.source           = { :git => 'https://github.com/bgouws@jhb.dvt.co.za/PTFramework.git', :tag => s.version.to_s }
                      #This is a test
  s.source           = { :git => 'https://github.com/bgouws/PTPod.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'

  s.source_files = 'PTFramework/Classes/**/*'
  
  # s.resource_bundles = {
  #   'PTFramework' => ['PTFramework/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
    s.dependency 'Firebase/Analytics'
    s.dependency 'Firebase/Auth'
    s.dependency 'Firebase/Database'
    s.dependency 'Firebase/Storage'
end
