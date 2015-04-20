//
//  BGAWheelButton.m
//  星座转盘
//
//  Created by bingoogol on 15/4/20.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGAWheelButton.h"

@implementation BGAWheelButton

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat imageW = 40;
    CGFloat imageH = 47;
    CGFloat imageX = (self.bounds.size.width - imageW) * 0.5;
    CGFloat imageY = (self.bounds.size.height - imageH) * 0.2;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (void)setHighlighted:(BOOL)highlighted {
}

@end