//
//  NSString+YJLibBaseModule.m
//  YJLibBaseModule
//
//  Created by 杨警 on 2019/6/15.
//

#import "NSString+YJBaseModule.h"
#import "NSString+YJLocalized.h"
#import <YJLibBaseModule/YJBaseStatics.h>

@implementation NSString (YJLibBaseModule)

+ (NSString *)yjBaseLocalizedString:(NSString *)string {
    
    NSString *bundlePath = [[NSBundle bundleForClass:[YJBaseStatics class]] pathForResource:@"YJLibBaseModuleBundle" ofType:@"bundle"];
    NSBundle *currentBundle = [NSBundle bundleWithPath:bundlePath];
    
    return [self yjLocalizedString:string language:[self yjLocalLanguageCode] bundle:currentBundle];
}

@end
