//
//  ViewController.m
//  UseALibrary
//
//  Created by bingoogol on 16/4/23.
//  Copyright © 2016年 bingoogolapple. All rights reserved.
//

#import "ViewController.h"
#import "BGATool.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *avatarIv;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%d", [BGATool sumWithNum1:1 andNum2:2]);
    UIImage *image = [BGATool loadAvatarImage];
    self.avatarIv.image = image;
}

@end
