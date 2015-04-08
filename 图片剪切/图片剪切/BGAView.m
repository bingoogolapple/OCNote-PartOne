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
    [self test3];
}

- (void)test3 {
    UIImage *image = [UIImage imageNamed:@"me"];
    // 圆环的宽度
    CGFloat borderW = 5;
    
    // 新的图片尺寸
    CGFloat imageW = image.size.width + 2*borderW;
    CGFloat imageH = image.size.height + 2*borderW;
    
    CGFloat circleW = imageW > imageH ? imageH : imageW;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, circleW, circleW)];
    [[UIColor blueColor] setFill];
    
//    CGContextAddPath(ctx, path.CGPath);
//    CGContextFillPath(ctx);
    // 相当于上面那两句
    [path fill];
    
    CGRect clipR = CGRectMake(borderW, borderW, image.size.width, image.size.height);
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:clipR];
    
    [clipPath addClip];
    
    [image drawAtPoint:CGPointMake(borderW, borderW)];
}

- (void)test2 {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(80, 80, 80, 80)];
    [path addClip];
    CGContextAddPath(ctx, path.CGPath);
    CGContextStrokePath(ctx);
    UIImage *image = [UIImage imageNamed:@"me"];
    
    [image drawAtPoint:CGPointMake(80, 80)];
    
}

- (void) test1 {
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
