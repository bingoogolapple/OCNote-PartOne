//
//  ViewController.m
//  图层的基本使用
//
//  Created by iqeggandroid on 15/4/19.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *customLayer;
@property (nonatomic, weak) CALayer *layer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self testViewLayer];
//    [self testImageViewLayer];
    
    // UIView比CALayer多了一个事件处理的功能
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 40, 40);
    // 用来设置CALayer在父容器中的位置
    layer.position = CGPointMake(10, 10);
    layer.anchorPoint = CGPointMake(0.5, 0.5);
    layer.backgroundColor = [[UIColor redColor] CGColor];
//    layer.contents = (__bridge id)([[UIImage imageNamed:@"avator"] CGImage]);
    // testLayer
//    [self.customLayer.layer addSublayer:layer];
    
    [self.view.layer addSublayer:layer];
    self.layer = layer;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    [self testLayer];
    
    // 获取触摸点
    UITouch *touch = [touches anyObject];
    CGPoint pos = [touch locationInView:self.view];
    
    // 开启事务
    [CATransaction begin];
    
    // 取消隐世动画
//        [CATransaction setDisableActions:YES];
    //    _layer.position = CGPointMake(100, 100);
    
    // 设置边框
    _layer.borderWidth = arc4random_uniform(5) + 1;
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    //    _layer.borderColor = [UIColor colorWithRed:r green:g blue:b alpha:1].CGColor;
    
    // 设置背景颜色
    _layer.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1].CGColor;
    
    // 设置圆角半径
    _layer.cornerRadius = arc4random_uniform(50);
    
    // 设置位置
    _layer.position = pos;
    
    // 提交事务
    [CATransaction commit];
}

- (void)testLayer {
    [UIView animateWithDuration:1 animations:^{
        //       _imageView.layer.transform = CATransform3DMakeRotation(M_PI, 1, 1, 0);
        //        _imageView.layer.transform = CATransform3DMakeTranslation(100, 100, 0);
        //        _imageView.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1);
        
        //        NSValue *value = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 1, 1, 0)];
        //        [_imageView.layer setValue:value forKeyPath:@"transform"];
        
        //        [_imageView.layer setValue:@M_PI forKeyPath:@"transform.rotation"];
        //        [_imageView.layer setValue:@0.5 forKeyPath:@"transform.scale"];
        
        // 这种方式不建议使用
        //        [_imageView.layer setValue:[NSValue valueWithCGPoint:CGPointMake(100, 100)] forKeyPath:@"transform.translation"];
        [_imageView.layer setValue:@100 forKeyPath:@"transform.translation.x"];
    }];
}

- (void)testImageViewLayer {
    _imageView.layer.cornerRadius = 20;
    // 图片设置圆角需要添加这一项
    _imageView.layer.masksToBounds = YES;
    // 图片是加到contents上的
    NSLog(@"%@---%@", _imageView.layer.sublayers,_imageView.layer.contents);
    
    _imageView.layer.borderColor = [[UIColor blueColor] CGColor];
    _imageView.layer.borderWidth = 3;
}

- (void)testViewLayer {
    // 0表示没有阴影
    _redView.layer.shadowOpacity = 1;
    _redView.layer.shadowColor = [[UIColor yellowColor] CGColor];
    _redView.layer.shadowRadius = 10;
    
    _redView.layer.cornerRadius = 10;
    _redView.layer.borderColor = [[UIColor blueColor] CGColor];
    _redView.layer.borderWidth = 3;
}


@end
