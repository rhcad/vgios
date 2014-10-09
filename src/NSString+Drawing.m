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

@implementation NSString (NSStringDrawing6)

- (BOOL)isIos7 {
    static bool ios7 = false;
#ifdef __IPHONE_7_0
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ios7 = [self respondsToSelector:@selector(sizeWithAttributes:)];
    });
#endif
    return ios7;
}

- (CGSize)sizeWithAttributes6:(NSDictionary *)attrs {
#ifdef __IPHONE_7_0
    if ([self isIos7]) return [self sizeWithAttributes:attrs];
#endif
    return [self sizeWithFont:attrs[NSFontAttributeName]];
}

- (void)drawAtPoint6:(CGPoint)point withAttributes:(NSDictionary *)attrs {
#ifdef __IPHONE_7_0
    if ([self isIos7]) [self drawAtPoint:point withAttributes:attrs]; else
#endif
    [self drawAtPoint:point withFont:attrs[NSFontAttributeName]];
}

- (void)drawInRect6:(CGRect)rect withAttributes:(NSDictionary *)attrs {
#ifdef __IPHONE_7_0
    if ([self isIos7]) { [self drawInRect:rect withAttributes:attrs]; return; }
#endif
    NSParagraphStyle *paraStyle = attrs[NSParagraphStyleAttributeName];
    
    [self drawInRect:rect withFont:attrs[NSFontAttributeName]
       lineBreakMode:paraStyle.lineBreakMode
           alignment:paraStyle.alignment];
}

- (CGRect)boundingRectWithSize6:(CGSize)size
                        options:(NSStringDrawingOptions)options
                     attributes:(NSDictionary *)attrs
                        context:(NSStringDrawingContext *)context {
#ifdef __IPHONE_7_0
    if ([self isIos7]) return [self boundingRectWithSize:size options:options
                                              attributes:attrs context:context];
#endif
    size = [self sizeWithFont:attrs[NSFontAttributeName] constrainedToSize:size];
    return CGRectMake(0, 0, size.width, size.height);
}

@end
