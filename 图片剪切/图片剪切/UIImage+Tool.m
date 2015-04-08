//
//  UIImage+Tool.m
//  图片剪切
//
//  Created by iqeggandroid on 15/4/8.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "UIImage+Tool.h"

@implementation UIImage (Tool)

+(instancetype)imageWithName:(NSString *)name border:(CGFloat)border borderColor:(UIColor *)color {
    UIImage *oldImage = [UIImage imageNamed:name];

    // 新的图片尺寸
    CGFloat imageW = oldImage.size.width + 2 * border;
    CGFloat imageH = oldImage.size.height + 2 * border;
    CGFloat circleW = imageW > imageH ? imageH : imageW;
    
    // 开启上下文
    // size 新的图片大小
    // opaque YES不透明 NO透明
    // scale
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(circleW, circleW), NO, 0.0);
    
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, circleW, circleW)];
    [color setFill];
    [circlePath fill];
    
    CGRect clipR = CGRectMake(border, border, oldImage.size.width, oldImage.size.height);
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:clipR];
    [clipPath addClip];
    
    [oldImage drawAtPoint:CGPointMake(border, border)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

+(instancetype)imageWithCaptureView:(UIView *)view {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 渲染控制器view的图层到上下文，图层只能用渲染，不能用draw
    [view.layer renderInContext:ctx];
    // 获取截屏图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
