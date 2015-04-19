//
//  BGAPaintView.h
//  涂鸦
//
//  Created by iqeggandroid on 15/4/19.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BGAPaintView : UIView

// 下一条线的线宽
@property (nonatomic, assign) CGFloat lineWidth;
// 下一条线的颜色
@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, strong) UIImage *image;

- (void)clearScreen;
- (void)undo;


@end