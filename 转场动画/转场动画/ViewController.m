//
//  ViewController.m
//  转场动画
//
//  Created by bingoogol on 15/4/20.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic, assign) int index;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _index = 1;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    _index++;
    
    if (_index == 4) {
        _index = 1;
    }
    NSString *fileName = [NSString stringWithFormat:@"%d",_index];
    _imageView.image = [UIImage imageNamed:fileName];
    
    CATransition *anim = [CATransition animation];
    
    anim.type = @"pageCurl";
    
    anim.subtype = kCATransitionFromLeft;
    
    anim.startProgress = 0.5;
    
    anim.duration = 2;
    
    [_imageView.layer addAnimation:anim forKey:nil];
}

@end
