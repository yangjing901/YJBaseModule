//
//  UIFont+YJFont.m
//  YJBaseModule
//
//  Created by Yang on 2019/5/6.
//  Copyright © 2019 WORDOOR. All rights reserved.
//

#import "UIFont+YJFont.h"

@implementation UIFont (YJFont)

//PingFangSC
+ (UIFont *)yjFontOfSize:(CGFloat)fontSize {
    return [UIFont yjFontWithName:@"PingFangSC" size:fontSize];
}

+ (UIFont *)yjRegularFontOfSize:(CGFloat)fontSize {
    return [UIFont yjFontWithName:@"PingFangSC-Regular" size:fontSize];
}

+ (UIFont *)yjSemiboldFontOfSize:(CGFloat)fontSize {
    return [UIFont yjFontWithName:@"PingFangSC-Semibold" size:fontSize];
}

+ (UIFont *)yjMediumFontOfSize:(CGFloat)fontSize {
    return [UIFont yjFontWithName:@"PingFangSC-Medium" size:fontSize];
}

// 不支持字体使用默认常规字体
+ (UIFont *)yjFontWithName:(NSString *)name size:(CGFloat)fontSize {
    UIFont *font = [UIFont fontWithName:name size:fontSize];
    if (!font) return [UIFont systemFontOfSize:fontSize];
    return font;
}

@end
