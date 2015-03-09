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
    // 设置第三条线的终点
    CGContextAddLineToPoint(ctx, 150, 150);
    
    // 设置绘图颜色
    CGContextSetRGBStrokeColor(ctx, 1.0, 0.0, 0.0, 1.0);
    // 设置线条的宽度
    CGContextSetLineWidth(ctx, 5);
    // 设置线条的起点和终点样式
    CGContextSetLineCap(ctx, kCGLineCapRound);
    // 设置线条的转角的样式
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    
    // 绘制图形（渲染图形到view上）
    CGContextStrokePath(ctx);
}

@end
