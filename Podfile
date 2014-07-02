platform :ios, '5.0'

target "TouchVG" do
  pod 'TouchVGCore', :podspec => 'https://raw.githubusercontent.com/touchvg/vgcore/develop/TouchVGCore.podspec'
  target "TouchVG-SVG" do
    pod 'SVGKit', :podspec => 'https://raw.githubusercontent.com/SVGKit/SVGKit/2.x/SVGKit.podspec'
  end
end

post_install do |installer|
  config_file_path = "Pods/Pods-TouchVG-TouchVG-SVG.xcconfig"
  
  if File.exists?(config_file_path)
    File.open("config.tmp", "w") do |io|
      io << File.read(config_file_path).gsub(/-lxml2 /, '')
    end
    FileUtils.mv("config.tmp", config_file_path)
  end
end
