//
//  BGABarChartView.m
//  绘制图表
//
//  Created by iqeggandroid on 15/4/7.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGABarChartView.h"
#import "UIColor+BGARandom.h"

@implementation BGABarChartView

- (void)drawRect:(CGRect)rect {
    NSArray *data = @[@25,@25,@50];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    int count = data.count;
    CGFloat w = rect.size.width / (2 * count - 1);
    CGFloat h = 0;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat viewH = rect.size.height;
    
    for (int i = 0; i < count; i++) {
        h = viewH * [data[i] intValue] / 100.0;
        x = 2 * w * i;
        y = viewH - h;
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(x, y, w, h)];
        [[UIColor randomColor] setFill];
        CGContextAddPath(ctx, path.CGPath);
        CGContextFillPath(ctx);
    }
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self setNeedsDisplay];
}

@end