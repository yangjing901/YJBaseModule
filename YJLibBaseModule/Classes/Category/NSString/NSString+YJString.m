//
//  NSString+YJString.m
//  YJLibBaseModule
//
//  Created by Yang on 2019/5/16.
//

#import "NSString+YJString.h"

#import "NSString+YJBaseModule.h"

@implementation NSString (YJString)

/// 国家
+ (NSString *)yjStringWithCity:(NSString *)city state:(NSString *)state country:(NSString *)country {
    if (city == nil || [city isKindOfClass:[NSNull class]]) city = @"";
    if (state == nil || [state isKindOfClass:[NSNull class]]) state = @"";
    if (country == nil || [country isKindOfClass:[NSNull class]]) country = @"";
    
    if ([state isEqualToString:@""] ) {
        if ([country isEqualToString:@""]) return [NSString yjBaseLocalizedString:@"YJ_Base_未知大陆"];
        return country;
        
    } else {
        if ([[NSString yjLocalLanguageCode] isEqualToString:YJLanguageCodeChinese]) {
            if ([city isEqualToString:@""]) {
                return [NSString stringWithFormat:@"%@·%@",country,state];
                
            } else {
                NSArray *cityArr = [NSArray arrayWithObjects:@"北京",@"Beijing",@"上海",@"Shanghai",@"重庆",@"Chongqing",@"天津",@"Tianjin", nil];
                
                if ([cityArr containsObject:state]) {
                    return [NSString stringWithFormat:@"%@·%@",country,state];
                } else {
                    return [NSString stringWithFormat:@"%@·%@",country,city];
                }
            }
        } else {
            if ([city isEqualToString:@""]) {
                return [NSString stringWithFormat:@"%@·%@",state,country];
                
            } else {
                NSArray *cityArr = [NSArray arrayWithObjects:@"北京",@"Beijing",@"上海",@"Shanghai",@"重庆",@"Chongqing",@"天津",@"Tianjin", nil];
                
                if ([cityArr containsObject:state]) {
                    return [NSString stringWithFormat:@"%@·%@",state,country];
                    
                } else {
                    return [NSString stringWithFormat:@"%@·%@",city,country];
                    
                }
            }
        }
    }
    return [NSString yjBaseLocalizedString:@"YJ_Base_未知大陆"];
}

/// 数量
+ (NSString *)yjStringForCount:(long long)count {
    if (count > 10000) {
        NSString *unit = @"";
        if ([[NSString yjLocalLanguageCode] isEqualToString:YJLanguageCodeChinese]) {
            unit = @"万";
            return [NSString stringWithFormat:@"%lld%@",(long long)count/10000,unit];
            
        } else {
            unit = @"K";
            return [NSString stringWithFormat:@"%lld%@",(long long)count/1000,unit];
        }
    }
    return [NSString stringWithFormat:@"%lld",(long long)count];
}

+ (NSString *)yjStringForMinutes:(long)minutes {
    if ([[NSString yjLocalLanguageCode] isEqualToString:YJLanguageCodeChinese]) {
        return [NSString stringWithFormat:@"%ld%@", minutes, [self yjUnitStringForMinutes:minutes]];
    }
    return [NSString stringWithFormat:@"%ld %@", minutes, [self yjUnitStringForMinutes:minutes]];

}

+ (NSString *)yjStringForHours:(long)hours {
    if ([[NSString yjLocalLanguageCode] isEqualToString:YJLanguageCodeChinese]) {
        return [NSString stringWithFormat:@"%ld%@", hours, [self yjUnitStringForHours:hours]];
    }
    return [NSString stringWithFormat:@"%ld %@", hours, [self yjUnitStringForHours:hours]];
}

+ (NSString *)yjStringForDays:(long)days {
    if ([[NSString yjLocalLanguageCode] isEqualToString:YJLanguageCodeChinese]) {
        return [NSString stringWithFormat:@"%ld %@", days, [self yjUnitStringForDays:days]];
    }
    return [NSString stringWithFormat:@"%ld%@", days, [self yjUnitStringForDays:days]];
}

+ (NSString *)yjUnitStringForMinutes:(long)minutes {
    return minutes > 1 ? [self yjBaseLocalizedString:@"YJ_Base_分钟2"] : [self yjBaseLocalizedString:@"YJ_Base_分钟"];
}

+ (NSString *)yjUnitStringForHours:(long)hours {
    return hours > 1 ? [self yjBaseLocalizedString:@"YJ_Base_小时2"] : [self yjBaseLocalizedString:@"YJ_Base_小时"];
}

+ (NSString *)yjUnitStringForDays:(long)days {
    return days > 1 ? [self yjBaseLocalizedString:@"YJ_Base_天2"] : [self yjBaseLocalizedString:@"YJ_Base_天"];
}

/// 语言
+ (NSString *)yjStringForLanguage:(YJLanguageCode)languageCode {
    if ([languageCode isEqualToString:YJLanguageCodeChinese] || [languageCode isEqualToString:@"中文"]) return [NSString yjBaseLocalizedString:@"YJ_Base_中文"];
    
    if ([languageCode isEqualToString:YJLanguageCodeEnglish] || [languageCode isEqualToString:@"English"]) return [NSString yjBaseLocalizedString:@"YJ_Base_英文"];
    
    if ([languageCode isEqualToString:YJLanguageCodeKorean] || [languageCode isEqualToString:@"한국어"]) return [NSString yjBaseLocalizedString:@"YJ_Base_韩文"];
    
    if ([languageCode isEqualToString:YJLanguageCodeJapanese] || [languageCode isEqualToString:@"日本語"]) return [NSString yjBaseLocalizedString:@"YJ_Base_日文"];
    
    if ([languageCode isEqualToString:YJLanguageCodeVietnamese] || [languageCode isEqualToString:@"Tiếng Việt"]) return [NSString yjBaseLocalizedString:@"YJ_Base_越南语"];
    
    if ([languageCode isEqualToString:YJLanguageCodeRussian] || [languageCode isEqualToString:@"русский"]) return [NSString yjBaseLocalizedString:@"YJ_Base_俄语"];
    
    if ([languageCode isEqualToString:YJLanguageCodeSpanish] || [languageCode isEqualToString:@"Español"]) return [NSString yjBaseLocalizedString:@"YJ_Base_西班牙语"];
    
    if ([languageCode isEqualToString:YJLanguageCodeFrench] || [languageCode isEqualToString:@"Français"]) return [NSString yjBaseLocalizedString:@"YJ_Base_法语"];
    
    if ([languageCode isEqualToString:YJLanguageCodeGerman] || [languageCode isEqualToString:@"Deutsch"]) return [NSString yjBaseLocalizedString:@"YJ_Base_德语"];
    
    return languageCode;
}

/// String -> NSDate ("yyyy-MM-dd HH:mm:ss")
+ (NSDate *)yjDateFromDateStr:(NSString *)dataStr {
    NSDateFormatter *dataFormatter = [[NSDateFormatter alloc] init];
    dataFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return  [dataFormatter dateFromString:dataStr];
}

/// String -> NSTimeInterval ("yyyy-MM-dd HH:mm:ss")
+ (NSTimeInterval)yjTimeintervalFromDateStr:(NSString *)dataStr {
    NSDate *date = [self yjDateFromDateStr:dataStr];
    return [date timeIntervalSince1970];
}

/// 时间格式转换, "刚刚, xx分钟之前, xx天之前, yyyy/MM/dd"
+ (NSString *)yjDateFormatterForSincedeTimeInterval:(NSTimeInterval)timeInterval {
    if (timeInterval >= 999999999999) timeInterval /= 1000;
    
    NSString *dateStr = @"";
    NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
    long long iDiff = now - timeInterval;
    
    //判断时间在昨天
    if (iDiff <= 60*3) {
        dateStr = [NSString yjBaseLocalizedString:@"YJ_Base_刚刚"];
        return dateStr;
        
    } else if (iDiff <= 60*60) {
        NSString *unit = iDiff/60 > 1 ? [NSString yjBaseLocalizedString:@"YJ_Base_%ld分钟之前2"] : [NSString yjBaseLocalizedString:@"YJ_Base_%ld分钟之前"];
        dateStr = [NSString stringWithFormat:unit,iDiff/60];
        return dateStr;
        
    }  else if (iDiff <= 24*60*60) {
        NSString *unit = iDiff/60/60 > 1 ? [NSString yjBaseLocalizedString:@"YJ_Base_%ld小时之前2"] : [NSString yjBaseLocalizedString:@"YJ_Base_%ld小时之前"];
        
        dateStr = [NSString stringWithFormat:unit,iDiff/60/60];
        return dateStr;
        
    } else if (iDiff <= 7*24*60*60) {
        NSString *unit = iDiff/60/60/24 > 1 ? [NSString yjBaseLocalizedString:@"YJ_Base_%ld天之前2"] : [NSString yjBaseLocalizedString:@"YJ_Base_%ld天之前"];
        
        dateStr = [NSString stringWithFormat:unit,iDiff/60/60/24];
        return dateStr;
        
    } else {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        NSTimeZone* dataTimeZone = [NSTimeZone localTimeZone];
        [dateFormatter setTimeZone:dataTimeZone];
        
        NSString *localLan = [NSString yjLocalLanguageCode];
        if (![localLan isEqual:YJLanguageCodeChinese]) {
            localLan = @"en";
        } else {
            localLan = @"zh-CN";
        }
        
        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:localLan];
        [dateFormatter setDateFormat:@"yyyy/MM/dd"];
        dateStr = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:timeInterval]];
        return dateStr;
    }
    return dateStr;
}

/// 时间格式转换, "yyyy/MM/dd"
+ (NSString *)yjDateFormatterForDayByTimeInterval:(NSTimeInterval)timeInterval {
    return [self yjDateFormatter:@"yyyy/MM/dd" timeInterval:timeInterval];
}

/// 时间格式转换, "MM/dd"
+ (NSString *)yjDateFormatterForDayWithOutYearByTimeInterval:(NSTimeInterval)timeInterval {
    return [self yjDateFormatter:@"MM/dd" timeInterval:timeInterval];
}

/// 时间格式转换, "a h:mm"
+ (NSString *)yjDateFormatterForHourByTimeInterval:(NSTimeInterval)timeInterval {
    return [self yjDateFormatter:@"a h:mm" timeInterval:timeInterval];
}

/// 时间格式转换, "yyyy/MM/dd HH:mm"
+ (NSString *)yjDateFormatterForDayHourByTimeInterval:(NSTimeInterval)timeInterval {
    return [self yjDateFormatter:@"yyyy/MM/dd HH:mm" timeInterval:timeInterval];
}

/// 时间格式转换, 时间戳->字符串
+ (NSString *)yjDateFormatter:(NSString *)dateFormatterStr timeInterval:(NSTimeInterval)timeInterval {
    if (timeInterval >= 999999999999) timeInterval /= 1000;
    
    NSString *dateStr = @"";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone* dataTimeZone = [NSTimeZone localTimeZone];
    [dateFormatter setTimeZone:dataTimeZone];
    
    NSString *localLan = [NSString yjLocalLanguageCode];
    if (![localLan isEqual:YJLanguageCodeChinese]) {
        localLan = @"en";
    } else {
        localLan = @"zh-CN";
    }
    
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:localLan];
    [dateFormatter setDateFormat:dateFormatterStr];
    dateStr = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:timeInterval]];
    return dateStr;
}


@end
