//
//  ViewController.m
//  开发静态库时调试静态库
//
//  Created by bingoogol on 15/4/13.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "ViewController.h"
#import "BGATool.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // 注意, 如果需要在当前工程中开发静态库, 需要配置targets > build Phases > target Dependencies > Link Binary WithLibraries
    
    
    NSLog(@"%d", [BGATool sumWithNum1:1 andNum2:2]);
    
    self.logoImageView.image = [BGATool loadLogoImage];
}

@end