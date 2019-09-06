//
//  YJBaseStatics.h
//  YJBaseModule
//
//  Created by Yang on 2019/5/17.
//

#import <Foundation/Foundation.h>

/// 性别
typedef NSString * YJSexCode NS_STRING_ENUM;
/// Male
FOUNDATION_EXPORT YJSexCode const YJSexCodeMale;
/// Female
FOUNDATION_EXPORT YJSexCode const YJSexCodeFemale;
/// None
FOUNDATION_EXPORT YJSexCode const YJSexCodeNone;

/// 语言
typedef NSString * YJLanguageCode NS_STRING_ENUM;
/// Chinese
FOUNDATION_EXPORT YJLanguageCode const YJLanguageCodeChinese;
/// English
FOUNDATION_EXPORT YJLanguageCode const YJLanguageCodeEnglish;
/// Korean
FOUNDATION_EXPORT YJLanguageCode const YJLanguageCodeKorean;
/// Japanese
FOUNDATION_EXPORT YJLanguageCode const YJLanguageCodeJapanese;
/// French
FOUNDATION_EXPORT YJLanguageCode const YJLanguageCodeFrench;
/// Spanish
FOUNDATION_EXPORT YJLanguageCode const YJLanguageCodeSpanish;
/// Russian
FOUNDATION_EXPORT YJLanguageCode const YJLanguageCodeRussian;
/// German
FOUNDATION_EXPORT YJLanguageCode const YJLanguageCodeGerman;
/// Vietnamese
FOUNDATION_EXPORT YJLanguageCode const YJLanguageCodeVietnamese;

@interface YJBaseStatics : NSObject

@end
