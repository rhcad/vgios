#!/bin/sh
# Type './build.sh' to make iOS libraries.
# Type './build.sh -arch arm64' to make iOS libraries for iOS 64-bit.
# Type './build.sh clean' to remove object files.

if [ ! -f ../vgcore/ios/build.sh ] ; then
    git clone https://github.com/rhcad/vgcore ../vgcore
fi
if [ ! -f ../SVGKit/SVGKit.podspec ] ; then
    git clone https://github.com/SVGKit/SVGKit ../SVGKit
fi

xcodebuild -project TouchVG.xcodeproj $1 $2 -configuration Release -alltargets

mkdir -p output/TouchVG
cp -R TouchVG/build/Release-universal/*.a output
cp -R TouchVG/build/Release-universal/include/TouchVG/*.h output/TouchVG
