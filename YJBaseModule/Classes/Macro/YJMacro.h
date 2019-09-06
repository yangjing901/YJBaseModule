//
//  YJMacro.h
//  Pods
//
//  Created by Yang on 2019/5/7.
//

#ifndef YJMacro_h
#define YJMacro_h

//MARK: - 屏幕尺寸
#define yjScreenWidth            CGRectGetWidth(yjScreenBounds)
#define yjScreenHeight           CGRectGetHeight(yjScreenBounds)
#define yjScreenBounds           [UIScreen mainScreen].bounds

#define yjNavigationBarHeight       (yjiPhoneXStyle ? 88.f : 64.f)
#define yjStatusBarHeight           (yjiPhoneXStyle ? 44.f : 20.f)
#define yjTabBarHeight              (yjiPhoneXStyle ? 83.f : 49.f)

#define yjWidthScale(width)             ((width)*(yjScreenWidth/375.f))
#define yjHeightScale(height)           (yjiPhoneXStyle ? height : (height)*(yjScreenHeight/667.f))

/// IPhoneX系列
#define yjiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define yjiPhoneXR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)

#define yjiPhoneXSMax ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)

#define yjiPhoneXStyle    ((yjiPhoneX == YES || yjiPhoneXR == YES ||  yjiPhoneXSMax == YES) ? YES : NO)


//MARK: - weakify strongify
#ifndef yjWeakify
    #if DEBUG
        #if __has_feature(objc_arc)
            #define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
        #else
            #define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
        #endif
    #else
        #if __has_feature(objc_arc)
            #define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
        #else
            #define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
        #endif
    #endif
#endif

#ifndef yjStrongify
    #if DEBUG
        #if __has_feature(objc_arc)
            #define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
        #else
            #define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
        #endif
    #else
        #if __has_feature(objc_arc)
            #define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
        #else
            #define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
        #endif
    #endif
#endif

#endif /* YJMacro_h */
