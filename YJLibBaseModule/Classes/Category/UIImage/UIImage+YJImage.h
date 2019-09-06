//
//  UIImage+YJImage.h
//  YJLibBaseModule
//
//  Created by Yang on 2019/5/17.
//

#import <UIKit/UIKit.h>
#import <YJLibBaseModule/YJBaseStatics.h>

@interface UIImage (YJImage)

/// 图片尺寸，最大宽高范围内宽高按比例计算
+ (CGSize)yjImageDisplaySizeWithImage:(UIImage *)image maxSize:(CGSize)maxSize;

/// 图片尺寸，最大宽高范围内宽高按比例计算
+ (CGSize)yjImageDisplaySizeWithImageSize:(CGSize)imageSize maxSize:(CGSize)maxSize;

/// 图片尺寸，宽度固定，高度按比例计算
+ (CGSize)yjImageDisplaySizeWithImageSize:(CGSize)imageSize fixedWidth:(CGFloat)fixedWidth;

/// 图片高斯模糊
+ (UIImage *)yjGaussianBlurWithImage:(UIImage *)image blur:(CGFloat)blur;

/// 颜色创建image
+ (UIImage *)yjImageWithColor:(UIColor*)color;

@end
