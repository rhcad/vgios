//! \file GiPaintViewXIB.mm
//! \brief 实现可在XIB中使用的绘图视图类 GiPaintViewXIB
// Copyright (c) 2012-2014, https://github.com/rhcad/touchvg

#import "GiViewHelper.h"
#import "GiPaintViewXIB.h"
#include "mgview.h"

@implementation GiPaintViewXIB

@synthesize command, lineWidth, strokeWidth, lineStyle;
@synthesize lineColor, lineAlpha, fillColor, fillAlpha;
@synthesize options, content, path, zoomEnabled;
@synthesize extent, zoomExtent, viewScale, viewCenter, modelScale;

- (NSString *)command {
    return [GiViewHelper sharedInstance:self].command;
}

- (void)setCommand:(NSString *)value {
    [GiViewHelper sharedInstance:self].command = value;
}

- (CGFloat)lineWidth {
    return [GiViewHelper sharedInstance:self].lineWidth;
}

- (void)setLineWidth:(CGFloat)value {
    [GiViewHelper sharedInstance:self].lineWidth = value;
}

- (CGFloat)strokeWidth {
    return [GiViewHelper sharedInstance:self].strokeWidth;
}

- (void)setStrokeWidth:(CGFloat)value {
    [GiViewHelper sharedInstance:self].strokeWidth = value;
}

- (NSString *)lineStyle {
    NSString *arr[] = { @"solid", @"dash", @"dot", @"dashdot", @"dashdotdot", @"null" };
    int n = [GiViewHelper sharedInstance:self].lineStyle;
    return arr[n >= 0 && n < 6 ? n : 0];
}

- (void)setLineStyle:(NSString *)value {
    NSString *arr[] = { @"solid", @"dash", @"dot", @"dashdot", @"dashdotdot", @"null", nil };
    for (int i = 0; arr[i]; i++) {
        if ([arr[i] isEqualToString:value]) {
            [GiViewHelper sharedInstance:self].lineStyle = (GILineStyle)i;
            break;
        }
    }
}

- (UIColor  *)lineColor {
    return [GiViewHelper sharedInstance:self].lineColor;
}

- (void)setLineColor:(UIColor *)value {
    [GiViewHelper sharedInstance:self].lineColor = value;
}

- (CGFloat)lineAlpha {
    return [GiViewHelper sharedInstance:self].lineAlpha;
}

- (void)setLineAlpha:(CGFloat)value {
    [GiViewHelper sharedInstance:self].lineAlpha = value;
}

- (UIColor  *)fillColor {
    return [GiViewHelper sharedInstance:self].fillColor;
}

- (void)setFillColor:(UIColor *)value {
    [GiViewHelper sharedInstance:self].fillColor = value;
}

- (CGFloat)fillAlpha {
    return [GiViewHelper sharedInstance:self].fillAlpha;
}

- (void)setFillAlpha:(CGFloat)value {
    [GiViewHelper sharedInstance:self].fillAlpha = value;
}

- (NSDictionary *)options {
    return [GiViewHelper sharedInstance:self].options;
}

- (void)setOptions:(NSDictionary *)value {
    [GiViewHelper sharedInstance:self].options = value;
}

- (NSString *)content {
    return [GiViewHelper sharedInstance:self].content;
}

- (void)setContent:(NSString *)value {
    [GiViewHelper sharedInstance:self].content = value;
}

- (NSString *)path {
    GiViewHelper *hlp = [GiViewHelper sharedInstance:self];
    return [hlp exportSVGPath:hlp.selectedShapeID];
}

- (void)setPath:(NSString *)value {
    GiViewHelper *hlp = [GiViewHelper sharedInstance:self];
    [hlp importSVGPath:hlp.selectedShapeID d:value];
}

- (CGRect)extent {
    MgView *view = [GiViewHelper sharedInstance:self].cmdView;
    Box2d rect(view->shapes()->getExtent());
    return CGRectMake(rect.xmin, rect.ymin, rect.width(), rect.height());
}

- (CGRect)zoomExtent {
    MgView *view = [GiViewHelper sharedInstance:self].cmdView;
    Box2d rect(view->xform()->getWndRectM());
    return CGRectMake(rect.xmin, rect.ymin, rect.width(), rect.height());
}

- (void)setZoomExtent:(CGRect)value {
    [[GiViewHelper sharedInstance:self] zoomToModel:value];
}

- (CGFloat)viewScale {
    MgView *view = [GiViewHelper sharedInstance:self].cmdView;
    return view->xform()->getViewScale();
}

- (void)setViewScale:(CGFloat)value {
    MgView *view = [GiViewHelper sharedInstance:self].cmdView;
    
    if (view->xform()->zoomScale(value)) {
        view->regenAll(false);
    }
}

- (CGPoint)viewCenter {
    MgView *view = [GiViewHelper sharedInstance:self].cmdView;
    Point2d pt(view->xform()->getCenterW());
    return CGPointMake(pt.x, pt.y);
}

- (void)setViewCenter:(CGPoint)value {
    MgView *view = [GiViewHelper sharedInstance:self].cmdView;
    
    if (view->xform()->zoomTo(Point2d(value.x, value.y))) {
        view->regenAll(false);
    }
}

- (CGSize)modelScale {
    MgView *view = [GiViewHelper sharedInstance:self].cmdView;
    Matrix2d mat(view->xform()->modelToWorld());
    return CGSizeMake(mat.m11, mat.m22);
}

- (void)setModelScale:(CGSize)value {
    MgView *view = [GiViewHelper sharedInstance:self].cmdView;
    Matrix2d mat(Matrix2d::scaling(value.width, value.height));
    
    if (view->xform()->setModelTransform(mat)) {
        view->regenAll(false);
    }
}

- (BOOL)zoomEnabled {
    return [GiViewHelper sharedInstance:self].zoomEnabled;
}

- (void)setZoomEnabled:(BOOL)enabled {
    [GiViewHelper sharedInstance:self].zoomEnabled = enabled;
}

@end
