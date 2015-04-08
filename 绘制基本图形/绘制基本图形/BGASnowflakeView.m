//
//  BGASnowflakeView.m
//  绘制基本图形
//
//  Created by iqeggandroid on 15/4/8.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGASnowflakeView.h"

@interface BGASnowflakeView()
@property (nonatomic, assign) CGFloat snowY;
@end

@implementation BGASnowflakeView

// 加载xib完毕时就调用
-(void)awakeFromNib {
    // 这种定时次会卡顿,iOS每一秒刷新60次,NSTimer过0.1秒后设置重绘标记时可能不是下一次绘图周期，要等到下一次绘图周期是才会绘制，会导致卡顿
//    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(setNeedsDisplay) userInfo:nil repeats:YES];
    
    // 屏幕刷新的时候就会触发
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(setNeedsDisplay)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

-(void)drawRect:(CGRect)rect {
    self.snowY += 2;
    UIImage *image = [UIImage imageNamed:@"Snowflake"];
    [image drawAtPoint:CGPointMake(100, self.snowY)];
    
    if (self.snowY > self.bounds.size.height) {
        self.snowY = 0;
    }
}

@end
