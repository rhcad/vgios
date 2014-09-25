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

@interface NSString (NSStringDrawing6)

- (BOOL)isIos7;
- (CGSize)sizeWithAttributes6:(NSDictionary *)attrs;
- (void)drawAtPoint6:(CGPoint)point withAttributes:(NSDictionary *)attrs;
- (void)drawInRect6:(CGRect)rect withAttributes:(NSDictionary *)attrs;
- (CGRect)boundingRectWithSize6:(CGSize)size
                        options:(NSStringDrawingOptions)options
                     attributes:(NSDictionary *)attributes
                        context:(NSStringDrawingContext *)context;
@end
