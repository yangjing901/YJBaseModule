//
//  UIColor+YJColor.h
//  YJLibBaseModule
//
//  Created by Yang on 2019/5/7.
//

#import <UIKit/UIKit.h>

@interface UIColor (YJColor)

/// 颜色转换：iOS中十六进制的颜色（以0x开头）转换为UIColor
+ (UIColor *)yjColorWithHex:(long)hexColor;

/// 颜色转换：iOS中十六进制的颜色（以0x开头）转换为UIColor
+ (UIColor *)yjColorWithHex:(long)hexColor alpha:(float)opacity;

/// 颜色转换：iOS中十六进制的颜色（以#开头）转换为UIColor
+ (UIColor *)yjColorWithHexString:(NSString *)color;

/// 颜色转换：iOS中十六进制的颜色（以#开头）转换为UIColor
+ (UIColor *)yjColorWithHexString:(NSString *)color alpha:(float)opacity;

/// 主题色：0x45D5E5
+ (UIColor *)yjThemeColor;

/// 黑色：0x2D2F31
+ (UIColor *)yjBlackColor;

/// 灰色，二级文字色：0x828486
+ (UIColor *)yjGrayColor;

/// 背景色：0xf5f6f7
+ (UIColor *)yjBackgroundColor;

/// 占位色：0xf5f6f7
+ (UIColor *)yjPlaceholderColor;

@end
