//
//  BGAHandleImageView.h
//  涂鸦
//
//  Created by iqeggandroid on 15/4/19.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BGAHandleImageViewBlock)(UIImage *image);

@interface BGAHandleImageView : UIView

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, copy) BGAHandleImageViewBlock block;

@end
