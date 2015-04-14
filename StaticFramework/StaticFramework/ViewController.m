//
//  ViewController.m
//  StaticFramework
//
//  Created by bingoogol on 15/4/14.
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
    NSLog(@"%d", [BGATool sumWithNum1:1 andNum2:2]);
    UIImage *image = [BGATool loadLogoImage];
    self.logoImageView.image = image;
}

@end
