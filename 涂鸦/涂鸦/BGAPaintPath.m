//
//  BGAPaintPath.m
//  涂鸦
//
//  Created by iqeggandroid on 15/4/19.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGAPaintPath.h"

@implementation BGAPaintPath

+ (instancetype)paintPathWithLineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor startPoint:(CGPoint)startPoint {
    // 用self，哪个类调用该方法就创建哪个类
    BGAPaintPath *path = [[self alloc] init];
    path.lineWidth = lineWidth;
    path.lineColor = lineColor;
    path.lineJoinStyle = kCGLineJoinRound;
    path.lineCapStyle = kCGLineCapRound;
    
    [path moveToPoint:startPoint];
    return path;
}

- (void)stroke {
    [self.lineColor setStroke];
    [super stroke];
}
@end