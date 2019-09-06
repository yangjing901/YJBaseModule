//
//  UIColor+YJColor.m
//  YJBaseModule
//
//  Created by Yang on 2019/5/7.
//

#import "UIColor+YJColor.h"

@implementation UIColor (YJColor)

/// 颜色转换：iOS中十六进制的颜色（以0x开头）转换为UIColor
+ (UIColor *)yjColorWithHex:(long)hexColor {
    return [UIColor yjColorWithHex:hexColor alpha:1.];
}

/// 颜色转换：iOS中十六进制的颜色（以0x开头）转换为UIColor
+ (UIColor *)yjColorWithHex:(long)hexColor alpha:(float)opacity {
    float red = ((float)((hexColor & 0xFF0000) >> 16))/255.0;
    float green = ((float)((hexColor & 0xFF00) >> 8))/255.0;
    float blue = ((float)(hexColor & 0xFF))/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:opacity];
}

/// 颜色转换：iOS中十六进制的颜色（以#开头）转换为UIColor
+ (UIColor *)yjColorWithHexString:(NSString *)color {
    return [self yjColorWithHexString:color alpha:1.0f];

}

/// 颜色转换：iOS中十六进制的颜色（以#开头）转换为UIColor
+ (UIColor *)yjColorWithHexString:(NSString *)color alpha:(float)opacity {
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // 判断前缀并剪切掉
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:opacity];
}

/// 主题色：0x45D5E5
+ (UIColor *)yjThemeColor {
    return [UIColor yjColorWithHex:0x45D5E5];
}

/// 黑色：0x2D2F31
+ (UIColor *)yjBlackColor {
    return [UIColor yjColorWithHex:0x2D2F31];
}

/// 灰色，二级文字色：0x828486
+ (UIColor *)yjGrayColor {
    return [UIColor yjColorWithHex:0x828486];
}

/// 背景色：0xf5f6f7
+ (UIColor *)yjBackgroundColor {
    return [UIColor yjColorWithHex:0xf5f6f7];
}

/// 占位色：0xf5f6f7
+ (UIColor *)yjPlaceholderColor {
    return [UIColor yjColorWithHex:0xf5f6f7];
}

@end
