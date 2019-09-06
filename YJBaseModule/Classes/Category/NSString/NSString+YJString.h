//
//  NSString+YJString.h
//  YJBaseModule
//
//  Created by Yang on 2019/5/16.
//

#import <Foundation/Foundation.h>
#import <YJBaseModule/YJBaseStatics.h>
#import <YJBaseModule/NSString+YJLocalized.h>

@interface NSString (YJString)

/// 国家
+ (NSString *)yjStringWithCity:(NSString *)city state:(NSString *)state country:(NSString *)country;

/// 数量
+ (NSString *)yjStringForCount:(long long)count;

/// 语言
+ (NSString *)yjStringForLanguage:(YJLanguageCode)languageCode;

/// 时间
+ (NSString *)yjStringForMinutes:(long)minutes;

+ (NSString *)yjStringForHours:(long)hours;

+ (NSString *)yjStringForDays:(long)days;

/// 单位
+ (NSString *)yjUnitStringForMinutes:(long)minutes;

+ (NSString *)yjUnitStringForHours:(long)hours;

+ (NSString *)yjUnitStringForDays:(long)days;

/// 日期
/// String -> NSDate ("yyyy-MM-dd HH:mm:ss")
+ (NSDate *)yjDateFromDateStr:(NSString *)dataStr;

/// String -> NSTimeInterval ("yyyy-MM-dd HH:mm:ss")
+ (NSTimeInterval)yjTimeintervalFromDateStr:(NSString *)dataStr;

/// 时间格式转换, "刚刚, xx分钟之前, xx天之前, yyyy/MM/dd"
+ (NSString *)yjDateFormatterForSincedeTimeInterval:(NSTimeInterval)timeInterval;

/// 时间格式转换, "yyyy/MM/dd"
+ (NSString *)yjDateFormatterForDayByTimeInterval:(NSTimeInterval)timeInterval;

/// 时间格式转换, "MM/dd"
+ (NSString *)yjDateFormatterForDayWithOutYearByTimeInterval:(NSTimeInterval)timeInterval;

/// 时间格式转换, "a h:mm"
+ (NSString *)yjDateFormatterForHourByTimeInterval:(NSTimeInterval)timeInterval;

/// 时间格式转换, "yyyy/MM/dd HH:mm"
+ (NSString *)yjDateFormatterForDayHourByTimeInterval:(NSTimeInterval)timeInterval;

/// 时间格式转换, 时间戳->字符串
+ (NSString *)yjDateFormatter:(NSString *)dateFormatterStr timeInterval:(NSTimeInterval)timeInterval;

@end
