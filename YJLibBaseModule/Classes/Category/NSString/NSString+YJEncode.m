//
//  NSString+YJEncode.m
//  YJLibBaseModule
//
//  Created by 杨警 on 2019/6/21.
//

#import "NSString+YJEncode.h"

@implementation NSString (YJEncode)

/// url编码
- (NSString *)yjUrlEncode {
    return (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)self, NULL,(CFStringRef)@"!*'();:@&=+$,/?%#[]",kCFStringEncodingUTF8));
}

/// url反编码
- (NSString *)yjUrlDecode {
    NSString *decodedString=(__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (__bridge CFStringRef)self, CFSTR(""), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    
    return decodedString;
}

/// H5参数解析
- (NSDictionary *)yjGetHtmlParameterFromUrl {
    NSString *url = self;
    if (!url) return nil;
    
    NSMutableDictionary *parameter = [[NSMutableDictionary alloc] init];
    [parameter setValue:url forKey:@"url"];
    
    if (![url containsString:@"?"]) {
        return parameter;
    }
    
    NSArray *urlArray = [url componentsSeparatedByString:@"?"];
    if (urlArray.count == 2) {
        NSString *parameterStr = urlArray[1];
        /// 多参数
        if ([parameterStr containsString:@"&"]) {
            NSArray *parameterArray = [parameterStr componentsSeparatedByString:@"&"];
            for (NSString *parameterItemStr in parameterArray) {
                if ([parameterItemStr containsString:@"="]) {
                    NSArray *parameterItemArray = [parameterItemStr componentsSeparatedByString:@"="];
                    if (parameterItemArray.count == 2) {
                        [parameter setValue:parameterItemArray[1] forKey:parameterItemArray[0]];
                    }

                }
            }
        }
        /// 单参数
        else if ([parameterStr containsString:@"="]) {
            NSArray *parameterItemArray = [parameterStr componentsSeparatedByString:@"="];
            if (parameterItemArray.count == 2) {
                [parameter setValue:parameterItemArray[1] forKey:parameterItemArray[0]];
            }
        }
    }
    return parameter;
}

@end
