//
//  UIFont+YJFont.h
//  YJLibBaseModule
//
//  Created by Yang on 2019/5/6.
//  Copyright © 2019 WORDOOR. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface UIFont (YJFont)

/// 常规字体
+ (UIFont *)yjFontOfSize:(CGFloat)fontSize;

/// 细体字体
+ (UIFont *)yjRegularFontOfSize:(CGFloat)fontSize;

/// 半粗字体
+ (UIFont *)yjSemiboldFontOfSize:(CGFloat)fontSize;

/// 中等字体
+ (UIFont *)yjMediumFontOfSize:(CGFloat)fontSize;

/// 不支持字体使用默认常规字体
+ (UIFont *)yjFontWithName:(NSString *)name size:(CGFloat)fontSize;

@end


