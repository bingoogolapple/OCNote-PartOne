//
//  BGALockView.m
//  手势解锁
//
//  Created by iqeggandroid on 15/4/9.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGALockView.h"

@implementation BGALockView

// 手动创建时会调用该方法
-(instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        NSLog(@"%s", __func__);
    }
    return self;
}

// 解析xib的时候调用
-(id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        NSLog(@"%s", __func__);
        [self addBtns];
    }
    return self;
}

// 加载xib完成后会调用该方法
-(void)awakeFromNib {
    NSLog(@"%s", __func__);
}

-(void)addBtns {
    for (int i = 0; i < 9; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateHighlighted];
        [self addSubview:button];
    }
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat row = 0;
    CGFloat col = 0;
    CGFloat btnW = 74;
    CGFloat btnH = 74;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    
    int totalCol = 3;
    CGFloat margin = (self.bounds.size.width - totalCol * btnW)/(totalCol + 1);
    
    for (int i = 0; i < self.subviews.count; i++) {
        UIButton *button = self.subviews[i];
        row = i / 3;
        col = i % 3;
        btnX = margin + (margin + btnW) * col;
        btnY = margin + (margin + btnH) * row;
        button.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
}

@end