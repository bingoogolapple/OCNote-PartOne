//
//  BGARectView.m
//  绘制基本图形
//
//  Created by bingoogol on 15/3/9.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGARectView.h"

@implementation BGARectView


- (void)drawRect:(CGRect)rect {
    [self drawRect2];
}

- (void)drawRect2 {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(50, 50, 100, 100)];
//    path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 50, 100, 100) cornerRadius:50];
    CGContextAddPath(ctx, path.CGPath);
    
    CGContextStrokePath(ctx);
}

- (void)drawRect1 {
    // 绘制四边形
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2.绘制四边形
    CGContextAddRect(ctx, CGRectMake(10, 10, 150, 100));
    // 如果要设置绘图的状态，必须在渲染之前
//    CGContextSetRGBStrokeColor(ctx, 1.0, 0.0, 0.0, 1.0);
//    CGContextSetRGBFillColor(ctx, 0.0, 1.0, 0.0, 1.0);
    
    // 调用OC的方法设置绘图的颜色
    // 设置实心颜色
//    [[UIColor redColor] setFill];
    // 设置空心颜色
//    [[UIColor blueColor] setStroke];
    // 同时设置实心和空心
//    [[UIColor greenColor] set];
    [[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0] set];
    // 3.渲染图形到layer上
    CGContextStrokePath(ctx);
//    CGContextFillPath(ctx);
    
}

- (void) drawTriangle {
    // 绘制三角形
    // 1.获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2.绘制三角形
    CGContextMoveToPoint(ctx, 100, 20);
    CGContextAddLineToPoint(ctx, 50, 100);
    CGContextAddLineToPoint(ctx, 150, 100);
    //    CGContextAddLineToPoint(ctx, 100, 20);
    // 关闭起点和终点
    CGContextClosePath(ctx);
    // 3.渲染图形到layer上
//    CGContextStrokePath(ctx);
    
    CGContextSetLineWidth(ctx, 5);
    [[UIColor blueColor] setFill];
    [[UIColor redColor] setStroke];
    
    
    CGContextDrawPath(ctx, kCGPathFillStroke);
}


@end