//
//  BGAImageView.m
//  绘制基本图形
//
//  Created by iqeggandroid on 15/4/8.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGAImageView.h"
// 如果继承自UIImageView，drawRect方法是不会被调用的
@implementation BGAImageView

- (void)drawRect:(CGRect)rect {
    [self.image drawInRect:rect];
}

- (void)setImage:(UIImage *)image {
    _image = image;
    [self setNeedsDisplay];
}
@end