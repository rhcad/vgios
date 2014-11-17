//
//  NSString+Drawing.m
//
//  This Source Code Form is subject to the terms of the Mozilla Public
//  License, v. 2.0. If a copy of the MPL was not distributed with this
//  file, You can obtain one at http://mozilla.org/MPL/2.0/.
//
//  Copyright (c) 2014 Zhang Yungui <github.com/rhcad>
//

#import "NSString+Drawing.h"

#if !defined(__IPHONE_7_0) || __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
static bool isIos7(NSString *str) {
    static bool ios7 = false;
#ifdef __IPHONE_7_0
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ios7 = [str respondsToSelector:@selector(sizeWithAttributes:)];
    });
#endif
    return ios7;
}
#endif

CGSize sizeWithAttributes6(NSString *str, NSDictionary *attrs) {
#if defined(__IPHONE_7_0) && __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_7_0
    return [str sizeWithAttributes:attrs];
#else
#ifdef __IPHONE_7_0
    if (isIos7(str)) return [str sizeWithAttributes:attrs];
#endif
    return [str sizeWithFont:attrs[NSFontAttributeName]];
#endif
}

void drawAtPoint6(NSString *str, CGPoint point, NSDictionary *attrs) {
#if defined(__IPHONE_7_0) && __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_7_0
    [str drawAtPoint:point withAttributes:attrs];
#else
#ifdef __IPHONE_7_0
    if (isIos7(str)) [str drawAtPoint:point withAttributes:attrs]; else
#endif
        [str drawAtPoint:point withFont:attrs[NSFontAttributeName]];
#endif
}

void drawInRect6(NSString *str, CGRect rect, NSDictionary *attrs) {
#if defined(__IPHONE_7_0) && __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_7_0
    [str drawInRect:rect withAttributes:attrs];
#else
#ifdef __IPHONE_7_0
    if (isIos7(str)) { [str drawInRect:rect withAttributes:attrs]; return; }
#endif
    NSParagraphStyle *paraStyle = attrs[NSParagraphStyleAttributeName];
    
    [str drawInRect:rect withFont:attrs[NSFontAttributeName]
      lineBreakMode:paraStyle.lineBreakMode
          alignment:paraStyle.alignment];
#endif
}

CGRect boundingRectWithSize6(NSString *str, CGSize size, NSStringDrawingOptions options,
                             NSDictionary *attrs, NSStringDrawingContext *context) {
#if defined(__IPHONE_7_0) && __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_7_0
    return [str boundingRectWithSize:size options:options
                          attributes:attrs context:context];
#else
#ifdef __IPHONE_7_0
    if (isIos7(str)) return [str boundingRectWithSize:size options:options
                                           attributes:attrs context:context];
#endif
    size = [str sizeWithFont:attrs[NSFontAttributeName] constrainedToSize:size];
    return CGRectMake(0, 0, size.width, size.height);
#endif
}
