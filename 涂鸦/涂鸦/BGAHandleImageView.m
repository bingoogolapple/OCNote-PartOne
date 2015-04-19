//
//  BGAHandleImageView.m
//  涂鸦
//
//  Created by iqeggandroid on 15/4/19.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGAHandleImageView.h"
#import "UIImage+Tool.h"

@interface BGAHandleImageView()<UIGestureRecognizerDelegate>

@property (nonatomic, weak) UIImageView *imageView;

@end

@implementation BGAHandleImageView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        // 添加UIImageView
        [self addImageView];
        // 添加手势
        [self addGestureRecognizer];
    }
    return self;
}

- (void)addImageView {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self addSubview:imageView];
    imageView.userInteractionEnabled = YES;
    self.imageView = imageView;
}

- (void)addGestureRecognizer {
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [self.imageView addGestureRecognizer:longPressGesture];
    
    [self addPinch];
    [self addRotation];
}

- (void)longPress:(UILongPressGestureRecognizer *)gesture {
    if(gesture.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.5 animations:^{
            self.imageView.alpha = 0.3;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 animations:^{
                self.imageView.alpha = 1;
            } completion:^(BOOL finished) {
                UIImage *newImage = [UIImage imageWithCaptureView:self];
                
                self.block(newImage);
                
                [self removeFromSuperview];
            }];
        }];
    }
}


#pragma mark - 捏合
- (void)addPinch {
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    // 设置代理的原因：想要同时支持多个手势
    pinch.delegate = self;
    [_imageView addGestureRecognizer:pinch];
    
}

- (void)pinch:(UIPinchGestureRecognizer *)pinch {
    _imageView.transform = CGAffineTransformScale(_imageView.transform, pinch.scale, pinch.scale);
    // 复位
    pinch.scale = 1;
}

// Simultaneous:同时
// 默认是不支持多个手势
// 当你使用一个手势的时候就会调用
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}



- (void)addRotation {
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    rotation.delegate = self;
    [_imageView addGestureRecognizer:rotation];
}

- (void)rotation:(UIRotationGestureRecognizer *)rotation {
    _imageView.transform = CGAffineTransformRotate(_imageView.transform, rotation.rotation);
    
    // 复位
    rotation.rotation = 0;
}

- (void)setImage:(UIImage *)image {
    self.imageView.image = image;
}

@end
