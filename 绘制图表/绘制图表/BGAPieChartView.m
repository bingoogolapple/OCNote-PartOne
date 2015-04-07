//
//  BGAPieChartView.m
//  绘制图表
//
//  Created by iqeggandroid on 15/4/7.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGAPieChartView.h"
#import "UIColor+BGARandom.h"

@implementation BGAPieChartView


- (void)drawRect:(CGRect)rect {
    NSArray *data = @[@25,@25,@50];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.width / 2);
    CGFloat radius = self.bounds.size.width / 2 - 2;
    CGFloat startA = 0;
    CGFloat endA = 0;
    CGFloat angle = 0;
    
    for (NSNumber *number in data) {
        startA = endA;
        // 要除以100.0，因为 25/100 始终是0
        angle = number.intValue / 100.0 * M_PI * 2;
        endA = startA + angle;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
        [path addLineToPoint:center];
        [[UIColor randomColor] setFill];
        CGContextAddPath(ctx, path.CGPath);
        CGContextFillPath(ctx);
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self setNeedsDisplay];
}

@end
