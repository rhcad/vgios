#!/bin/sh
# Type './build.sh' to make iOS libraries.
# Type './build.sh -arch arm64' to make iOS libraries for iOS 64-bit.
# Type './build.sh clean' to remove object files.

if [ ! -f ../vgcore/ios/build.sh ] ; then
    git clone https://github.com/rhcad/vgcore ../vgcore
fi
#if [ ! -f ../SVGKit/SVGKit.podspec ] ; then
#    git clone https://github.com/SVGKit/SVGKit ../SVGKit
#fi

xcodebuild -project TouchVG.xcodeproj $1 $2 -configuration Release -target TouchVG

mkdir -p output/TouchVG
cp -R build/Release-universal/*.a output
cp -R build/Release-universal/include/TouchVG/*.h output/TouchVG

if [ ! -f output/libTouchVGCore.a ] ; then
    cd ../vgcore/ios
    sh build.sh $1 $2
    cd ../../vgios
fi
mkdir -p output/TouchVGCore
cp -R ../vgcore/ios/output/*.a output
cp -R ../vgcore/ios/output/TouchVGCore/*.h output/TouchVGCore
