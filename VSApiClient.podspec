Pod::Spec.new do |s|

  s.platform     = :ios
  s.ios.deployment_target = "10.3"
  s.name         = "VSApiClient"
  s.summary      = "A simple API client for iOS."
  s.author             = "Vikas Shah"
  s.social_media_url   = "http://twitter.com/vshah23"
  s.homepage     = "https://github.com/vshah23/VSApiClient"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.version      = "0.2.0"

  s.source       = { :git => "https://github.com/vshah23/VSApiClient.git", :tag => "#{s.version}" }

  s.framework  = "Foundation"

  s.source_files  = "VSApiClient/**/*.{swift}"
  # s.public_header_files = "Classes/**/*.h"

  s.requires_arc = true

end
