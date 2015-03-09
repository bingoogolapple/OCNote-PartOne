//
//  BGACircleView.m
//  绘制基本图形
//
//  Created by bingoogol on 15/3/9.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGACircleView.h"

@implementation BGACircleView

- (void)drawRect:(CGRect)rect {
    [self drawPie];
}

- (void)drawPie {
    // 画病状图
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctx, 100, 100);
    CGContextAddLineToPoint(ctx, 150, 100);
    // 2.画圆
    // clockwise 0表示顺时针，1表示逆时针
    
    CGContextAddArc(ctx, 100, 100, 50, 0, M_PI_2, 0);
    
    CGContextClosePath(ctx);
    // 3.渲染
    // 画线只能通过空心来画
    CGContextFillPath(ctx);
}

- (void)drawArc {
    // 画圆弧
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2.画圆
    // clockwise 0表示顺时针，1表示逆时针
    CGContextAddArc(ctx, 100, 100, 50, 0, M_PI_2, 0);
    
    CGContextClosePath(ctx);
    // 3.渲染
    CGContextFillPath(ctx);
}

- (void)drawCircle {
    // 画圆
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2.画圆
    CGContextAddEllipseInRect(ctx, CGRectMake(50, 100, 100, 50));
    // 3.渲染
    CGContextStrokePath(ctx);
}

@end