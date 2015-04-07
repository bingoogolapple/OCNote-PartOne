//
//  BGALineView.m
//  绘制基本图形
//
//  Created by bingoogol on 15/3/9.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGALineView.h"

@implementation BGALineView

// 当自定义view第一次显示出来的时候就会调用drawRect方法
- (void)drawRect:(CGRect)rect {
    [self test4:rect];
}

// 画曲线
- (void)test4:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint startP = CGPointMake(10, 125);
    CGPoint endP = CGPointMake(190, 125);
    CGPoint controlP = CGPointMake(100, 50);
    [path moveToPoint:startP];
    [path addQuadCurveToPoint:endP controlPoint:controlP];
    CGContextAddPath(ctx, path.CGPath);
    CGContextStrokePath(ctx);
}

- (void)test3:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(10, 10)];
    [path1 addLineToPoint:CGPointMake(90, 90)];
    CGContextAddPath(ctx, path1.CGPath);
    
     UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(100, 100)];
    [path2 addLineToPoint:CGPointMake(120, 180)];
    CGContextAddPath(ctx, path2.CGPath);
    
    CGContextSetLineWidth(ctx, 10);
    CGContextSetLineCap(ctx, kCGLineCapRound);
//    CGContextSetRGBStrokeColor(ctx, 1, 1, 0, 1);
    [[UIColor redColor] setStroke];
    CGContextStrokePath(ctx);

}

- (void)test2:(CGRect)rect {
    // {{0, 0}, {200, 200}}  rect = self.bounds
    NSLog(@"%@",NSStringFromCGRect(rect));
    
    // CGContextRef     CG CoreGraphics  Ref 引用
    // 目前学的上下文都跟UIGraphics有关，以后想要直接获取上下文，直接敲一个UIGraphics
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 设置绘图信息（拼接路径）
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(10, 10)];
    [path addLineToPoint:CGPointMake(125, 125)];
    [path addLineToPoint:CGPointMake(150, 180)];
    // 直接把UIKit的路径转换成CoreGraphics，CG开头就能转
    CGContextAddPath(ctx, path.CGPath);
    
    CGContextStrokePath(ctx);
}

- (void)test1:(CGRect)rect {
    // 1.取得和当前视图相关联的图形上下文（因为图形上下文决定绘制的输出目标）
    // 如果是在drawRect方法中调用UIGraphicsGetCurrent方法获取出来的就是Layer的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.绘图（绘制直线）保存绘图信息
    // 设置起点
    CGContextMoveToPoint(ctx, 50, 100);
    // 设置终点
    CGContextAddLineToPoint(ctx, 100, 100);
    
    // 设置第二条直线的终点（自动把上一条直线的终点当做起点）
    CGContextAddLineToPoint(ctx, 100, 150);
    
    // 设置绘图颜色
    CGContextSetRGBStrokeColor(ctx, 1.0, 0.0, 0.0, 1.0);
    // 设置线条的宽度
    CGContextSetLineWidth(ctx, 5);
    // 设置线条的起点和终点样式
    CGContextSetLineCap(ctx, kCGLineCapRound);
    // 设置线条的转角的样式
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    // 渲染前两条线
    CGContextStrokePath(ctx);
    
    
    CGContextSetRGBStrokeColor(ctx, 0.0, 1.0, 0.0, 1.0);
    // 重新设置第三条线的起点
    CGContextMoveToPoint(ctx, 120, 120);
    // 设置第三条线的终点
    CGContextAddLineToPoint(ctx, 150, 150);
    
    // 绘制图形（渲染图形到view上）
    CGContextStrokePath(ctx);
}

@end
