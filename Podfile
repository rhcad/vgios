platform :ios, '5.0'
xcodeproj 'TouchVG/TouchVG.xcodeproj'

target "TouchVG" do
  pod 'TouchVGCore', :podspec => 'https://raw.githubusercontent.com/touchvg/vgcore/develop/TouchVGCore.podspec'
  target "TouchVG-SVG" do
    pod 'SVGKit', :podspec => 'https://raw.githubusercontent.com/SVGKit/SVGKit/2.x/SVGKit.podspec'
  end
end

post_install do |installer|
  default_library = installer.libraries.detect { |i| i.target_definition.name == 'Pods' }
  config_file_path = default_library.library.xcconfig_path
  
  if File.exists?(config_file_path)
    File.open("config.tmp", "w") do |io|
      io << File.read(config_file_path).gsub(/-lxml2/, '')
    end
    FileUtils.mv("config.tmp", config_file_path)
  end
end
