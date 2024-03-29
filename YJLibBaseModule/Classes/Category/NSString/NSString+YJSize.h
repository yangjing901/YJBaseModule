//
//  NSString+YJSize.h
//  YJLibBaseModule
//
//  Created by Yang on 2019/5/16.
//

#import <Foundation/Foundation.h>

@interface NSString (YJSize)

/// 字节长度（GBK）
- (long)yjConvertToByte;

/// 按字节截取（GBK）
- (NSString *)yjSubStringByByteWithIndex:(NSInteger)index;

@end
