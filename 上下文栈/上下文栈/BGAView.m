//
//  BGAView.m
//  上下文栈
//
//  Created by bingoogol on 15/3/12.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGAView.h"

@implementation BGAView

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 保存初始的状态
    CGContextSaveGState(ctx);
    
    CGContextMoveToPoint(ctx, 100, 30);
    CGContextAddLineToPoint(ctx, 100, 230);
    CGContextSetLineWidth(ctx, 5);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    [[UIColor redColor] set];
    CGContextStrokePath(ctx);
    
    // 保存红色的
    CGContextSaveGState(ctx);
    
    CGContextMoveToPoint(ctx, 50, 40);
    CGContextAddLineToPoint(ctx, 150, 40);
    CGContextSetLineWidth(ctx, 5);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    [[UIColor yellowColor] set];
    CGContextStrokePath(ctx);
    
    // 保存黄色的
    CGContextSaveGState(ctx);
    
    CGContextMoveToPoint(ctx, 50, 60);
    CGContextAddLineToPoint(ctx, 150, 60);
    CGContextSetLineWidth(ctx, 5);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    [[UIColor greenColor] set];
    CGContextStrokePath(ctx);
    
    // 保存绿色的
    CGContextSaveGState(ctx);
    
    CGContextMoveToPoint(ctx, 50, 80);
    CGContextAddLineToPoint(ctx, 150, 80);
    CGContextSetLineWidth(ctx, 5);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    [[UIColor blueColor] set];
    CGContextStrokePath(ctx);
    
    
    CGContextMoveToPoint(ctx, 50, 100);
    CGContextAddLineToPoint(ctx, 150, 100);
    // 此时会回到绿色
    CGContextRestoreGState(ctx);
    CGContextStrokePath(ctx);
    
    CGContextMoveToPoint(ctx, 50, 120);
    CGContextAddLineToPoint(ctx, 150, 120);
    // 此时会回到黄色
    CGContextRestoreGState(ctx);
    CGContextStrokePath(ctx);
    
    CGContextMoveToPoint(ctx, 50, 140);
    CGContextAddLineToPoint(ctx, 150, 140);
    // 此时会回到红色
    CGContextRestoreGState(ctx);
    CGContextStrokePath(ctx);
    
    CGContextMoveToPoint(ctx, 50, 160);
    CGContextAddLineToPoint(ctx, 150, 160);
    // 此时会回到初始状态
    CGContextRestoreGState(ctx);
    CGContextStrokePath(ctx);
    
    
    // 上下文栈已经空了，不能再取了，否则会报错
//    CGContextMoveToPoint(ctx, 50, 180);
//    CGContextAddLineToPoint(ctx, 150, 180);
//    CGContextRestoreGState(ctx);
//    CGContextStrokePath(ctx);
}

@end