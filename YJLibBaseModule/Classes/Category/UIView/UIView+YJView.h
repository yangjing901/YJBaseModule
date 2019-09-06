//
//  UIView+YJView.h
//  YJBaseModule
//
//  Created by Yang on 2019/5/7.
//

#import <UIKit/UIKit.h>

@interface UIView (YJView)

/// 圆角
- (void)yjAddCornerRadius:(CGFloat)cornerRadius;
/// 圆角
- (void)yjAddCornerRadius:(CGFloat)cornerRadius clip:(BOOL)clip;

/// 阴影
- (void)yjAddShadowColor:(UIColor *)shadowColor offset:(CGSize)offset radius:(CGFloat)radius opacity:(float)opacity;
/// 阴影
- (void)yjAddShadowColor:(UIColor *)shadowColor offset:(CGSize)offset radius:(CGFloat)radius opacity:(float)opacity path:(UIBezierPath *)path;

/// 边框
- (void)yjAddBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

@end
