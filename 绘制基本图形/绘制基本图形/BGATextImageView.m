//
//  BGATextImageView.m
//  绘制基本图形
//
//  Created by bingoogol on 15/3/10.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGATextImageView.h"

@implementation BGATextImageView

- (void)drawRect:(CGRect)rect {
    [self drawText];
}

- (void)drawText {
    // 画文字
    NSString *str = @"中文ajsdlfajdljfal洛杉水电费历史记录福建省来得及飞洛杉矶的浪费矶的法律是假的";
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddRect(ctx, CGRectMake(50, 50, 100, 100));
    CGContextStrokePath(ctx);
    // 不推荐使用C语言的方法绘制文字，因为quraz2d中的坐标系和UIKit中的坐标系不一致，绘制出来的文字是颠倒的，而且通过c语言绘制文字相当麻烦

    
    
    NSMutableDictionary *mdict = [NSMutableDictionary dictionary];
    mdict[NSForegroundColorAttributeName] = [UIColor redColor];
    
    mdict[NSBackgroundColorAttributeName] = [UIColor greenColor];
    // 记住NSFontAttributeName这个常用的，其他的到头文件里面去找
    mdict[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    
//    [str drawAtPoint:CGPointMake(10, 10) withAttributes:mdict];
    // 将文字绘制到指定的范围内，如果一行装不下会自动换行，当文字超出范围后就不显示
    [str drawInRect:CGRectMake(50, 50, 100, 100) withAttributes:mdict];
}


@end
