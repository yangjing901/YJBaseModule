//
//  NSObject+YJObject.m
//  YJLibBaseModule
//
//  Created by Yang on 2019/8/20.
//

#import "NSObject+YJObject.h"

@implementation NSObject (YJObject)

/// 获取当前屏幕显示的viewcontroller
- (UIViewController *)yjCurrentViewController {
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    UIViewController *currentVC = [self yjGetCurrentVCFrom:rootViewController];
    return currentVC;
}

- (UIViewController *)yjGetCurrentVCFrom:(UIViewController *)rootVC {
    UIViewController *currentVC;
    
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        rootVC = [rootVC presentedViewController];
    }
    
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        currentVC = [self yjGetCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
        
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        currentVC = [self yjGetCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
    } else {
        // 根视图为非导航类
        currentVC = rootVC;
    }
    return currentVC;
}


@end
