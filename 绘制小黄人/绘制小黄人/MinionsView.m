//
//  MinionsView.m
//  绘制小黄人
//
//  Created by bingoogol on 15/3/11.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "MinionsView.h"

#define BGATopx rect.size.width * 0.5
#define BGATopy 150
#define BGABigRadius 80
#define BGAGlassesRadius 30
#define BGALineHeight 150
#define BGAHairLenght 25
#define BGAMouthHalfWidth 30
#define BGAHairControllerOffsetX 4
#define BGAHairControllerOffsetY 10

@implementation MinionsView

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self drawBody:rect context:ctx];
    [self drawGlasses:rect context:ctx];
    [self drawMouth:rect context:ctx];
    [self drawHair:rect context:ctx];
}

- (void)drawHair:(CGRect)rect context:(CGContextRef)ctx {
    CGFloat startX = BGATopx;
    CGFloat startY = BGATopy - BGABigRadius;
    CGFloat endX = startX;
    CGFloat endY = startY - BGAHairLenght;
    CGContextMoveToPoint(ctx, startX, startY);
    CGContextAddLineToPoint(ctx, endX, endY);
    
    [self drawLeftHair:rect context:ctx scale:0.1];
    [self drawLeftHair:rect context:ctx scale:0.2];
    [self drawLeftHair:rect context:ctx scale:0.3];
    [self drawRightHair:rect context:ctx scale:0.1];
    [self drawRightHair:rect context:ctx scale:0.2];
    [self drawRightHair:rect context:ctx scale:0.3];

    CGContextStrokePath(ctx);
}

- (void)drawLeftHair:(CGRect)rect context:(CGContextRef)ctx scale:(CGFloat)scale {
    CGFloat startX = BGATopx - BGABigRadius * sin(scale * M_PI_2);
    CGFloat startY = BGATopy - BGABigRadius * cos(scale * M_PI_2);
    CGFloat endX = BGATopx - (BGABigRadius + BGAHairLenght)* sin(scale * M_PI_2);
    CGFloat endY = BGATopy - (BGABigRadius + BGAHairLenght) * cos(scale * M_PI_2);
    CGContextMoveToPoint(ctx, startX, startY);
    CGContextAddQuadCurveToPoint(ctx, startX + BGAHairControllerOffsetX, startY - BGAHairControllerOffsetY, endX, endY);
}

- (void)drawRightHair:(CGRect)rect context:(CGContextRef)ctx scale:(CGFloat)scale {
    CGFloat startX = BGATopx + BGABigRadius * sin(scale * M_PI_2);
    CGFloat startY = BGATopy - BGABigRadius * cos(scale * M_PI_2);
    CGFloat endX = BGATopx + (BGABigRadius + BGAHairLenght)* sin(scale * M_PI_2);
    CGFloat endY = BGATopy - (BGABigRadius + BGAHairLenght) * cos(scale * M_PI_2);
    CGContextMoveToPoint(ctx, startX, startY);
    CGContextAddQuadCurveToPoint(ctx, startX - BGAHairControllerOffsetX, startY - BGAHairControllerOffsetY, endX, endY);
}

- (void)drawMouth:(CGRect)rect context:(CGContextRef)ctx {
    CGFloat currentX = BGATopx - BGAMouthHalfWidth;
    CGFloat currentY = BGATopx + BGALineHeight / 2;
    CGContextMoveToPoint(ctx, currentX, currentY);
    
    CGFloat endX = BGATopx + BGAMouthHalfWidth;
    CGFloat endY = currentY;
    
    CGFloat controllerX = BGATopx;
    CGFloat controllerY = endY + BGAMouthHalfWidth;
    
    // cpx/cpy 控制点的位置
    // x/y 结束点的位置
    CGContextAddQuadCurveToPoint(ctx, controllerX, controllerY, endX, endY);
    CGContextSetLineWidth(ctx, 1);
    [[UIColor blackColor] set];
    CGContextStrokePath(ctx);
}

- (void)drawGlasses:(CGRect)rect context:(CGContextRef)ctx {
    // 画眼镜横条
    // 设置起点
    CGFloat startX = BGATopx - BGABigRadius;
    CGFloat startY = BGATopy;
    CGContextMoveToPoint(ctx, startX, startY);
    // 设置终点
    CGFloat endX = BGATopx + BGABigRadius;
    CGFloat endY = startY;
    CGContextAddLineToPoint(ctx, endX, endY);
    
    CGContextSetLineWidth(ctx, 18);
    [[UIColor greenColor] set];
    CGContextStrokePath(ctx);
    
    // 画眼镜大圆
    CGFloat leftX = BGATopx - BGAGlassesRadius;
    CGFloat leftY = BGATopy;
    CGContextAddArc(ctx, leftX, leftY, BGAGlassesRadius, 0, 2 * M_PI, 0);
    
    CGFloat rightX = BGATopx + BGAGlassesRadius;
    CGFloat rightY = BGATopy;
    CGContextAddArc(ctx, rightX, rightY, BGAGlassesRadius, 0, 2 * M_PI, 0);
    CGContextFillPath(ctx);
    // 画眼镜第二大圆
    CGContextAddArc(ctx, leftX, leftY, BGAGlassesRadius - 10, 0, 2 * M_PI, 0);
    CGContextAddArc(ctx, rightX, rightY, BGAGlassesRadius - 10, 0, 2 * M_PI, 0);
    [[UIColor whiteColor] set];
    CGContextFillPath(ctx);
    // 画眼睛最大圆
    leftX = leftX + 10;
    rightX = rightX - 10;
    CGContextAddArc(ctx, leftX, leftY, BGAGlassesRadius - 22, 0, 2 * M_PI, 0);
    CGContextAddArc(ctx, rightX, rightY, BGAGlassesRadius - 22, 0, 2 * M_PI, 0);
    [[UIColor blackColor] set];
    CGContextFillPath(ctx);
    // 画眼睛小圆
    leftX = leftX - 2;
    leftY = leftY - 3;
    rightX = rightX + 2;
    rightY = rightY - 3;
    CGContextAddArc(ctx, leftX, leftY, BGAGlassesRadius - 28, 0, 2 * M_PI, 0);
    CGContextAddArc(ctx, rightX, rightY, BGAGlassesRadius - 28, 0, 2 * M_PI, 0);
    [[UIColor whiteColor] set];
    CGContextFillPath(ctx);
}

- (void)drawBody:(CGRect)rect context:(CGContextRef)ctx {
    // 画上半圆弧
    CGFloat topX = BGATopx;
    CGFloat topY = BGATopy;
    CGFloat topRadius = BGABigRadius;
    // clockwise 0表示顺时针
    CGContextAddArc(ctx, topX, topY, topRadius, -M_PI, 0, 0);
    // 画身体右侧竖线
    CGFloat rightX = topX + topRadius;
    CGFloat rightY = topY + BGALineHeight;
    CGContextAddLineToPoint(ctx, rightX, rightY);
    // 画下半圆弧
    CGFloat bottomX = topX;
    CGFloat bottomY = rightY;
    CGFloat bottomRadius = topRadius;
    CGContextAddArc(ctx, bottomX, bottomY, bottomRadius, 0, M_PI, 0);
    // 画身体左侧竖线
    CGContextClosePath(ctx);
    // 设置颜色
    [[UIColor colorWithRed:255/255.0 green:218/255.0 blue:0 alpha:1.0] set];
    // 在开发的时候先用CGContextStrokePath方法画轮廓看效果，达到想要的效果时再改用CGContextFillPath方法
    // CGContextStrokePath(ctx);
    CGContextFillPath(ctx);
}

@end