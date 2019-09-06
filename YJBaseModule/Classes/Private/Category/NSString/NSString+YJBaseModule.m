//
//  NSString+YJBaseModule.m
//  YJBaseModule
//
//  Created by 杨警 on 2019/6/15.
//

#import "NSString+YJBaseModule.h"
#import "NSString+YJLocalized.h"
#import <YJBaseModule/YJBaseStatics.h>

@implementation NSString (YJBaseModule)

+ (NSString *)yjBaseLocalizedString:(NSString *)string {
    
    NSString *bundlePath = [[NSBundle bundleForClass:[YJBaseStatics class]] pathForResource:@"YJBaseModuleBundle" ofType:@"bundle"];
    NSBundle *currentBundle = [NSBundle bundleWithPath:bundlePath];
    
    return [self yjLocalizedString:string language:[self yjLocalLanguageCode] bundle:currentBundle];
}

@end
