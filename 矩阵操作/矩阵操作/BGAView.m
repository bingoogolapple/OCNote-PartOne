//
//  BGAView.m
//  矩阵操作
//
//  Created by bingoogol on 15/3/15.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGAView.h"

@implementation BGAView

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 基于layer的，整体操作
    // 必须在添加图形之前设置矩阵
    CGContextRotateCTM(ctx, M_PI_4);
    // 学习的时候用极端的值看效果
    CGContextScaleCTM(ctx, 1.2, 1.2);
    CGContextTranslateCTM(ctx, 0, 100);
    
    CGContextAddRect(ctx, CGRectMake(200, 100, 100, 100));
    
    CGContextAddEllipseInRect(ctx, CGRectMake(30, 30, 100, 100));

    CGContextStrokePath(ctx);
}


@end