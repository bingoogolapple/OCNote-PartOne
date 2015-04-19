//
//  BGAPaintPath.h
//  涂鸦
//
//  Created by iqeggandroid on 15/4/19.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BGAPaintPath : UIBezierPath

@property (nonatomic, strong) UIColor *lineColor;

+ (instancetype)paintPathWithLineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor startPoint:(CGPoint)startPoint;
@end