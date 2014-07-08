//! \file GiViewEnums.h
//! \brief 定义iOS绘图视图的枚举值
// Copyright (c) 2012-2014, https://github.com/touchvg/vgios

#ifndef __TOUCHVG_VIEWENUMS_H
#define __TOUCHVG_VIEWENUMS_H

typedef NS_ENUM(int, GILineStyle) {
    GILineStyleSolid,       //!< ----------
    GILineStyleDash,        //!< － － － －
    GILineStyleDot,         //!< ..........
    GILineStyleDashDot,     //!< _._._._._
    GILineStyleDashDotdot,  //!< _.._.._.._
    GILineStyleNull         //!< Not draw.
};

typedef NS_ENUM(int, GIViewFlags) { //!< 视图创建标志
    GIViewFlagsNoBackLayer = 1,     //!< 不使用分层异步渲染
    GIViewFlagsNoDynDrawView = 2,   //!< 不使用双视图显示
    GIViewFlagsNoMagnifier = 4,     //!< 不使用跟随放大镜
};

#endif // __TOUCHVG_VIEWENUMS_H
