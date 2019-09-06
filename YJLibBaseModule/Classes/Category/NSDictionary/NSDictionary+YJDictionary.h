//
//  NSDictionary+YJDictionary.h
//  YJBaseModule
//
//  Created by Yang on 2019/5/7.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (YJDictionary)

- (id)yjNumValueToStringForKey:(NSString *)key;

- (id)yjNunullValueForKey:(NSString *)key;

- (id)yjNunullObjectForKey:(NSString *)key;

@end
