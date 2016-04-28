Pod::Spec.new do |s|
  s.name        = "TouchVG-SVG"
  s.version     = "1.1.35"
  s.summary     = "A lightweight 2D vector drawing framework for iOS."
  s.homepage    = "https://github.com/rhcad/vgios"
  s.screenshots = "http://touchvg.github.io/images/iphone1.png"
  s.license     = { :type => "BSD", :file => "LICENSE" }
  s.author      = { "Zhang Yungui" => "rhcad@hotmail.com" }
  s.social_media_url    = "http://weibo.com/rhcad"

  s.platform    = :ios, "5.0"
  s.source      = { :git => "https://github.com/rhcad/vgios.git", :branch => "develop" }
  s.ios.source_files    = 'include/*.h', 'src/*.{h,m,mm}'
  s.public_header_files = 'include/*.h'
  s.frameworks = "UIKit", "QuartzCore", "CoreGraphics", "Foundation"

  s.requires_arc = false
  s.xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => 'USE_SVGKIT=1',
    'CLANG_CXX_LANGUAGE_STANDARD' => 'gnu++11',
    'CLANG_CXX_LIBRARY' => 'libc++',
    "HEADER_SEARCH_PATHS" => '$(PODS_ROOT)/Headers/TouchVGCore $(PODS_ROOT)/Headers/SVGKit'
  }
  s.resource = 'TouchVG.bundle'
  s.dependency "TouchVGCore"
  s.dependency "SVGKit", "~> 2.0"
  # Need to copy `podspec/SVGKit.podspec` to `~/.cocoapods/repos/master/Specs/SVGKit/2.0/`.
end
