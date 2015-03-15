//
//  BGAView.m
//  图片剪切
//
//  Created by bingoogol on 15/3/15.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGAView.h"

@implementation BGAView

- (void)drawRect:(CGRect)rect {
    // 画圆，以便于以后指定可以显示内容范围
    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    CGContextAddEllipseInRect(ctx,CGRectMake(100, 100, 50, 50));
    CGContextMoveToPoint(ctx, 125, 100);
    CGContextAddLineToPoint(ctx, 150, 150);
    CGContextAddLineToPoint(ctx, 100, 150);
    CGContextClosePath(ctx);
    // 指定上下文中可以显示内容的范围，要在绘制范围之前调用才会生效
    CGContextClip(ctx);
    
    CGContextStrokePath(ctx);
    UIImage *image = [UIImage imageNamed:@"me"];
    
    [image drawAtPoint:CGPointMake(100, 100)];

}

@end
