//
//  NSString+YJLocalized.h
//  YJLibBaseModule
//
//  Created by Yang on 2019/5/7.
//

#import <Foundation/Foundation.h>
#import <YJLibBaseModule/YJBaseStatics.h>

@interface NSString (YJLocalized)

/// 本地化
+ (NSString *)yjLocalizedString:(NSString *)string;

/// 本地化
+ (NSString *)yjLocalizedString:(NSString *)string language:(YJLanguageCode)language;

/// 本地化
+ (NSString *)yjLocalizedString:(NSString *)string language:(NSString *)language bundle:(NSBundle *)bundle;

/// 当前App语言
+ (NSString *)yjLocalLanguageCode;

@end

