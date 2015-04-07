//
//  BGAViewController.m
//  Modal
//
//  Created by iqeggandroid on 15/4/5.
//  Copyright (c) 2015年 iqeggandroid. All rights reserved.
//

#import "BGAViewController.h"
#import "TwoViewController.h"

@interface BGAViewController ()

@end

/*
 如果控制器之间的关系比较紧密，一般用UINavgationController
 如果控制器之间关系不是很紧密可以用Modal
 */
@implementation BGAViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


- (IBAction)jump2two:(id)sender {
    TwoViewController *two = [[TwoViewController alloc] init];
    // 给即将要弹出的模态控制器包装一个导航控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:two];
    
    /*
    [self.view addSubview:nav.view];
    // 将另一个控制器的view添加到本控制器的view中，需要将另一个控制器添加为childviewcontroller
    [self addChildViewController:nav];
    */
    [self presentViewController:nav animated:YES completion:^{
        NSLog(@"完全弹出two控制器");
    }];
}


// 通过storyboard连线的方式实现modal跳转时，才会调用该方法设置参数
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"two控制器 prepareForSegue");
    UINavigationController *nav = segue.destinationViewController;
    // 获取导航控制器的栈顶控制器
    TwoViewController *two = (TwoViewController *)nav.topViewController;
    two.name = @"test";
}

@end