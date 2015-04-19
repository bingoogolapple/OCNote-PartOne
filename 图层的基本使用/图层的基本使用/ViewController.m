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
    layer.anchorPoint = CGPointMake(0, 0.5);
    layer.backgroundColor = [[UIColor redColor] CGColor];
//    layer.contents = (__bridge id)([[UIImage imageNamed:@"avator"] CGImage]);
    [self.customLayer.layer addSublayer:layer];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
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
