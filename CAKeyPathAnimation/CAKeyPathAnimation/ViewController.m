//
//  ViewController.m
//  CAKeyPathAnimation
//
//  Created by bingoogol on 15/4/20.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}




- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self test2];
    
}

- (void)test2 {
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    // 设置动画属性
    anim.keyPath = @"position";
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 200)];
    
    anim.path = path.CGPath;
    
    anim.duration = 2;
    
    // 取消反弹
    anim.removedOnCompletion = NO;
    
    anim.fillMode = kCAFillModeForwards;
    
    anim.repeatCount = MAXFLOAT;
    
    [_redView.layer addAnimation:anim forKey:nil];
}

- (void)test1 {
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    // 设置动画属性
    anim.keyPath = @"position";
    
    NSValue *v1 = [NSValue valueWithCGPoint:CGPointZero];
    
    NSValue *v2 = [NSValue valueWithCGPoint:CGPointMake(160, 160)];
    
    NSValue *v3 = [NSValue valueWithCGPoint:CGPointMake(270, 0)];
    
    anim.values = @[v1,v2,v3];
    
    anim.duration = 2;
    
    [_redView.layer addAnimation:anim forKey:nil];
}

@end
