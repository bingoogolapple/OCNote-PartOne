//
//  ViewController.m
//  图标抖动
//
//  Created by bingoogol on 15/4/20.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "ViewController.h"

#define angle2radian(x) ((x) / 180.0 * M_PI)

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    
    [_imageView addGestureRecognizer:longPress];
}

- (void)longPress:(UILongPressGestureRecognizer *)longPress {
    if (longPress.state == UIGestureRecognizerStateBegan) {
        
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
        
        anim.keyPath = @"transform.rotation";
        
        anim.values = @[@(angle2radian(-5)),@(angle2radian(5)),@(angle2radian(-5))];
        
        anim.repeatCount = MAXFLOAT;
        
        anim.duration = 0.5;
        
        [_imageView.layer addAnimation:anim forKey:nil];
    }
}

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
//    
//    anim.keyPath = @"transform.rotation";
//    
//    anim.values = @[@(angle2radian(-5)),@(angle2radian(5)),@(angle2radian(-5))];
//    
//    anim.repeatCount = MAXFLOAT;
//    
//    anim.duration = 0.5;
//    
//    [_imageView.layer addAnimation:anim forKey:nil];
//}

@end
