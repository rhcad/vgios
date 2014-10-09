//
//  NSString+Drawing.h
//
//  This Source Code Form is subject to the terms of the Mozilla Public
//  License, v. 2.0. If a copy of the MPL was not distributed with this
//  file, You can obtain one at http://mozilla.org/MPL/2.0/.
//
//  Copyright (c) 2014 Zhang Yungui <github.com/rhcad>
//

#import <UIKit/UIKit.h>
#include <CoreGraphics/CoreGraphics.h>

CGSize sizeWithAttributes6(NSString *str, NSDictionary *attrs);
void drawAtPoint6(NSString *str, CGPoint point, NSDictionary *attrs);
void drawInRect6(NSString *str, CGRect rect, NSDictionary *attrs);
CGRect boundingRectWithSize6(NSString *str, CGSize size, NSStringDrawingOptions options,
                             NSDictionary *attrs, NSStringDrawingContext *context);
