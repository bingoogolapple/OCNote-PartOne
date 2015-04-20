//
//  ViewController.m
//  UIView封装的动画
//
//  Created by bingoogol on 15/4/20.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic, assign) int index;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _index = 1;
}

// 核心动画都是假象，不能改变layer的真实属性的值
// 展示的位置和实际的位置不同。实际位置永远在最开始位置
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    [self position];
    _index++;
    
    if (_index == 4) {
        _index = 1;
    }
    NSString *fileName = [NSString stringWithFormat:@"%d",_index];
    self.imageView.image = [UIImage imageNamed:fileName];
    
   [UIView transitionWithView:self.imageView duration:0.5 options:UIViewAnimationOptionTransitionCurlUp animations:nil completion:nil];
}

- (void)position {
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    anim.keyPath = @"position";
    
    anim.fromValue = [NSValue valueWithCGPoint:CGPointZero];
    
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
    
    anim.delegate = self;
    
    // 取消反弹
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    
    [_redView.layer addAnimation:anim forKey:nil];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"%@",NSStringFromCGPoint(_redView.layer.position));
}
@end
