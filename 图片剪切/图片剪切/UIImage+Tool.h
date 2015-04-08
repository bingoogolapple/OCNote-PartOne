//
//  UIImage+Tool.h
//  图片剪切
//
//  Created by iqeggandroid on 15/4/8.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Tool)
/**
 *  生成一个带圆环的图片
 *
 *  @param name   图片名称
 *  @param border 圆环的宽度
 *  @param color  圆环的颜色
 *
 */
+ (instancetype) imageWithName:(NSString *)name border:(CGFloat)border borderColor:(UIColor *)color;

/**
 *  截屏
 *
 *  @param view 需要截屏的视图
 *
 */
+ (instancetype) imageWithCaptureView:(UIView *)view;
@end
