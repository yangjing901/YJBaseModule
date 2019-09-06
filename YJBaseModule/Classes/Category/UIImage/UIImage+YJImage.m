//
//  UIImage+YJImage.m
//  YJBaseModule
//
//  Created by Yang on 2019/5/17.
//

#import "UIImage+YJImage.h"
#import <Accelerate/Accelerate.h>

@implementation UIImage (YJImage)

+ (CGSize)yjImageDisplaySizeWithImage:(UIImage *)image maxSize:(CGSize)maxSize {
    return [self yjImageDisplaySizeWithImageSize:image.size maxSize:maxSize];
}

+ (CGSize)yjImageDisplaySizeWithImageSize:(CGSize)imageSize maxSize:(CGSize)maxSize {
    if (imageSize.width == 0 || imageSize.height == 0) {
        return maxSize;
    }
    
    CGFloat maxHeight = maxSize.height;
    CGFloat maxWidth = maxSize.width;
    
    CGFloat pixScale = imageSize.width / imageSize.height;
    //w:h < 1: 3 -> h = maxH, w = 1/3*maxH
    if (pixScale < 0.33) {
        CGFloat currentWidth = 1 / 3.0 * maxHeight;
        if (currentWidth > maxWidth) {
            imageSize = CGSizeMake(maxWidth, maxWidth / currentWidth * maxHeight);
            
        } else {
            imageSize = CGSizeMake(currentWidth, maxHeight);
        }
        
    }
    //w:h >= 1: 3 && w:h < 1: 2.5 -> h = maxH, w = 1/2.5*maxH
    else if (pixScale >= 0.33 && pixScale < 0.4) {
        CGFloat currentWidth = 1 / 2.5 * maxHeight;
        if (currentWidth > maxWidth) {
            imageSize = CGSizeMake(maxWidth, maxWidth / currentWidth * maxHeight);
            
        } else {
            imageSize = CGSizeMake(currentWidth, maxHeight);
        }
    }
    //w:h >= 1: 2.5 && w:h < 1: 1 -> h = maxH, w = maxW*(h/maxH)
    else if (pixScale >= 0.4 && pixScale < 1) {
        CGFloat currentWidth = maxHeight / imageSize.height * imageSize.width;
        if (currentWidth > maxWidth) {
            imageSize = CGSizeMake(maxWidth, maxWidth / currentWidth * maxHeight);
            
        } else {
            imageSize = CGSizeMake(currentWidth, maxHeight);
        }
        
    }
    //w:h >= 1: 1 && w:h < 1: 2.5 -> w = maxW, h = maxH*(w/maxW)
    else if (pixScale >= 1 && pixScale < 2.5) {
        CGFloat currentHeight = maxWidth/imageSize.width*imageSize.height;
        if (currentHeight > maxHeight) {
            imageSize = CGSizeMake(maxWidth * maxHeight / currentHeight, maxHeight);
            
        } else {
            imageSize = CGSizeMake(maxWidth, currentHeight);
        }
    }
    //w:h >= 1: 2.5 && w:h < 1: 3 -> w = maxW, h = 1/2.5*maxW
    else if(pixScale >= 2.5 && pixScale < 3) {
        CGFloat currentHeight = 1/2.5*maxWidth;
        if (currentHeight > maxHeight) {
            imageSize = CGSizeMake(maxWidth * maxHeight / currentHeight, maxHeight);

        } else {
            imageSize = CGSizeMake(maxWidth, currentHeight);
        }
        
    }
    //w:h >= 1: 3 -> w = maxW, h = 1/3*maxW
    else {
        CGFloat currentHeight = 1/3*maxWidth;
        if (currentHeight > maxHeight) {
            imageSize = CGSizeMake(maxWidth * maxHeight / currentHeight, maxHeight);

        } else {
            imageSize = CGSizeMake(maxWidth, currentHeight);
        }
    }
    
    return imageSize;
}

+ (CGSize)yjImageDisplaySizeWithImageSize:(CGSize)imageSize fixedWidth:(CGFloat)fixedWidth {
    
    if (imageSize.width == 0) {
        return CGSizeMake(fixedWidth, fixedWidth);
    }
    
    CGFloat pixScale = fixedWidth / imageSize.width;
    return CGSizeMake(fixedWidth, imageSize.height * pixScale);
}


+ (UIImage *)yjGaussianBlurWithImage:(UIImage *)image blur:(CGFloat)blur {
    if (!image) return nil;
    
    //模糊度,
    if (blur < 0.025f) {
        blur = 0.025f;
        
    } else if (blur > 1.0f) {
        blur = 1.0f;
    }
    
    //boxSize必须大于0
    int boxSize = (int)(blur * 100);
    boxSize -= (boxSize % 2) + 1;
    NSLog(@"boxSize:%i",boxSize);
    
    //图像处理
    CGImageRef img = image.CGImage;
    
    //图像缓存,输入缓存，输出缓存
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    //像素缓存
    void *pixelBuffer;
    
    //数据源提供者，Defines an opaque type that supplies Quartz with data.
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    // provider’s data.
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    //宽，高，字节/行，data
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    //像数缓存，字节行*图片高
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    // 第三个中间的缓存区,抗锯齿的效果
    void *pixelBuffer2 = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    vImage_Buffer outBuffer2;
    outBuffer2.data = pixelBuffer2;
    outBuffer2.width = CGImageGetWidth(img);
    outBuffer2.height = CGImageGetHeight(img);
    outBuffer2.rowBytes = CGImageGetBytesPerRow(img);
    //Convolves a region of interest within an ARGB8888 source image by an implicit M x N kernel that has the effect of a box filter.
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer2, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    //    error = vImageBoxConvolve_ARGB8888(&outBuffer2, &inBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    //    NSLog(@"字节组成部分：%zu",CGImageGetBitsPerComponent(img));
    //颜色空间DeviceRGB
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //用图片创建上下文,CGImageGetBitsPerComponent(img),7,8
    CGContextRef ctx = CGBitmapContextCreate(
                                             outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             CGImageGetBitmapInfo(image.CGImage));
    
    //根据上下文，处理过的图片，重新组件
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    free(pixelBuffer);
    free(pixelBuffer2);
    CFRelease(inBitmapData);
    //CGColorSpaceRelease(colorSpace);   //多余的释放
    CGImageRelease(imageRef);
    return returnImage;
}

// 颜色创建image
+ (UIImage *)yjImageWithColor:(UIColor*)color {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
