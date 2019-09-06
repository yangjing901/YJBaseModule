//
//  NSString+YJEncode.h
//  YJBaseModule
//
//  Created by 杨警 on 2019/6/21.
//

#import <Foundation/Foundation.h>

@interface NSString (YJEncode)

/// url编码
- (NSString *)yjUrlEncode;

/// url反编码
- (NSString *)yjUrlDecode;

/// H5参数解析
- (NSDictionary *)yjGetHtmlParameterFromUrl;

@end
