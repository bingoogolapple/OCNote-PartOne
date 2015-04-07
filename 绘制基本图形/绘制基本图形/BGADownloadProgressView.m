//
//  BGADownloadProgressView.m
//  绘制基本图形
//
//  Created by iqeggandroid on 15/4/7.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGADownloadProgressView.h"

@interface BGADownloadProgressView()
@property (nonatomic, weak) UILabel *label;
@end

@implementation BGADownloadProgressView

- (UILabel *)label {
    if(_label == nil) {
        NSLog(@"%@fsdfsdf",NSStringFromCGRect(self.bounds));
        UILabel *label = [[UILabel alloc] initWithFrame:self.bounds];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor greenColor];
        [self addSubview:label];
        _label = label;
    }
    return _label;
}

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    self.label.text = [NSString stringWithFormat:@"%.2f%%",progress * 100];
    
    // 重新绘制
    // 在view上做一个重绘的标记，当下次屏幕刷新的时候，就会调用drawRect
    [self setNeedsDisplay];
}

// 当视图显示的时候会调用，默认只会调用一次
- (void)drawRect:(CGRect)rect {
    NSLog(@"bounds %@",NSStringFromCGRect(rect));
    NSLog(@"center %@",NSStringFromCGPoint(self.center));
    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    CGPoint center = self.center;
    CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.width / 2);
    CGFloat radius = self.bounds.size.width / 2 - 2;
    CGFloat startA = -M_PI_2;
    CGFloat endA = -M_PI_2 + _progress * M_PI * 2;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    [[UIColor greenColor] setStroke];
    CGContextAddPath(ctx, path.CGPath);
    CGContextStrokePath(ctx);
}


@end
