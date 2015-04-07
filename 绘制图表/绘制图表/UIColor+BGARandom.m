//
//  UIColor+BGARandom.m
//  绘制图表
//
//  Created by iqeggandroid on 15/4/7.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "UIColor+BGARandom.h"

@implementation UIColor (BGARandom)

+ (UIColor *)randomColor {
    /*
     颜色有两种表现形式 RGB RGBA
     RGB 24 每个颜色通道8位
     8的二进制255
     每个颜色取值0~255
     */
    // 0~255
    
    // 要除以255.0，因为 小于255的整数/255 始终是0
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

@end