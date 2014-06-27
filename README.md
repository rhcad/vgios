# TouchVG for iOS

This is a lightweight 2D vector drawing framework using [TouchVGCore](https://github.com/touchvg/vgcore) for iOS.

Features described in [Online document](http://touchvg.github.io). Please visit [TouchVG Demo](https://github.com/touchvg/vgios-demo) to see more examples.

![arch](http://touchvg.github.io/images/arch.svg)

![iphone1](http://touchvg.github.io/images/iphone1.png) | ![iphone2](http://touchvg.github.io/images/iphone2.png)

## License

This is an open source [LGPL 2.1](LICENSE.md) licensed project. It uses the following open source projects:

- [TouchVGCore](https://github.com/touchvg/vgcore) (LGPL): Cross-platform vector drawing libraries using C++.
- [SVGKit](https://github.com/SVGKit/SVGKit) (MIT): Display and interact with SVG Images with CoreAnimation on iOS.
- [simple-svg](http://code.google.com/p/simple-svg) (BSD): A C++ header file for creating SVG files.
- [rapidjson](https://github.com/Kanma/rapidjson) (MIT): A fast JSON parser/generator for C++ with both SAX/DOM style API.
- [iOS-Universal-Library-Template](https://github.com/michaeltyson/iOS-Universal-Library-Template): Use it to create static library project.

## How to Contribute

Contributors and sponsors are welcome. You may translate, commit issues or pull requests on this Github site.
To contribute, please follow the branching model outlined here: [A successful Git branching model](http://nvie.com/posts/a-successful-git-branching-model/).

Welcome to the Chinese QQ group `192093613` to discuss and share.

## Contributors

- [Zhang Yungui](https://github.com/rhcad)
- [Archer](https://github.com/a7ch3r)
- [ljlin](https://github.com/ljlin)
- [Pengjun](https://github.com/pengjun) / Line and triangle commands
- [Proteas](https://github.com/proteas)

# How to Compile

## Compile with CocoaPods

Type `pod install` or `pod update --no-repo-update`, then open `TouchVG.xcworkspace` in Xcode, then build the `TouchVG` or `TouchVG-SVG` target.

  - Remove `-lxml2` from `Other Link Flags` for the TouchVG-SVG target. Remove `libPods-TouchVG-TouchVG-SVG.a` and `libPods-TouchVG.a` from `Link Binary With Libraries` too.
  - `libTouchVG.a` does not support SVG display.
  - `libTouchVG-SVG.a` can display SVG shapes using [SVGKit](https://github.com/SVGKit/SVGK

## Compile without CocoaPods

Alternatively, you can build as one of the following methods:

- Open `TouchVG/TouchVG.xcodeproj` in Xcode, then build the `TouchVG` or `TouchVG-SVG` target.

   - `libTouchVG.a` does not support SVG display.
   - `libTouchVG-SVG.a` can display SVG shapes using [SVGKit](https://github.com/SVGKit/SVGKit).

- Or type `./build.sh` to compile static libraries to the `output` directory.
  - Type `./build.sh -arch arm64` to make for iOS 64-bit.
  - Type `./build.sh clean` to remove object files.it).

## Use TouchVG with CocoaPods

TouchVG is available on [CocoaPods](http://cocoapods.org). Just add the following to your project Podfile:

```ruby
pod 'TouchVG'
```

Or use the develop version:

```ruby
pod 'TouchVG', :podspec => 'https://raw.githubusercontent.com/touchvg/vgios/develop/podspec/TouchVG.podspec'
```

Or add the following to use SVG rendering feature with [SVGKit](https://github.com/SVGKit/SVGKit):

```ruby
pod 'TouchVG-SVG', :podspec => 'https://raw.githubusercontent.com/touchvg/vgios/develop/podspec/TouchVG-SVG.podspec'
```

Then type `pod install` or `pod update --no-repo-update`. Need to copy `podspec/SVGKit.podspec` to `~/.cocoapods/repos/master/Specs/SVGKit/2.0/` to use the lastest version of SVGKit.

# Add more shapes and commands

- You can use [newproj.py](https://github.com/touchvg/DemoCmds/blob/master/newproj.py) to create library project containing your own shapes and commands. So the TouchVG and TouchVGCore libraries does not require changes.

  - Checkout and enter [DemoCmds](https://github.com/touchvg/DemoCmds) directory, then type `python newproj.py YourCmds`:

     ```shell
     git clone https://github.com/touchvg/DemoCmds.git
     cd DemoCmds
     python newproj.py MyCmds
     ```
