Pod::Spec.new do |s|
  s.name        = "TouchVG"
  s.version     = "1.1.29"
  s.summary     = "A lightweight 2D vector drawing framework for iOS."
  s.homepage    = "https://github.com/touchvg/vgios"
  s.screenshots = "http://touchvg.github.io/images/iphone1.png"
  s.license     = { :type => "LGPL", :file => "LICENSE.md" }
  s.author      = { "Zhang Yungui" => "rhcad@hotmail.com" }
  s.social_media_url    = "http://weibo.com/rhcad"

  s.platform    = :ios, "5.0"
  s.source      = { :git => "https://github.com/touchvg/vgios.git", :branch => "develop" }
  s.ios.source_files    = 'include/*.h', 'src/*.{h,m,mm}'
  s.public_header_files = 'include/*.h'
  s.frameworks = "UIKit", "QuartzCore", "CoreGraphics", "Foundation"

  s.requires_arc = true
  s.xcconfig = {
    'CLANG_CXX_LANGUAGE_STANDARD' => 'gnu++11',
    'CLANG_CXX_LIBRARY' => 'libc++',
    "HEADER_SEARCH_PATHS" => '$(PODS_ROOT)/Headers/TouchVGCore'
  }
  s.resource = 'TouchVG.bundle'
  s.dependency "TouchVGCore"
end
