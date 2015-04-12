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
    }
    return self;
}

// 加载xib完成后会调用该方法
-(void)awakeFromNib {
    NSLog(@"%s", __func__);
}

@end