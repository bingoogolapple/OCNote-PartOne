//
//  TwoViewController.m
//  Modal
//
//  Created by iqeggandroid on 15/4/5.
//  Copyright (c) 2015年 iqeggandroid. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", self.name);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
}

- (void)cancel{
    // 如果一个控制器的视图是以模态的形式展现出来的，可以调用该控制器以及该控制器的子控制器让该控制器消失
//    [self dismissViewControllerAnimated:YES completion:^{
//        NSLog(@"完全关闭two控制器");
//    }];
    
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        NSLog(@"完全关闭two控制器");
    }];
}

- (void)dealloc {
    NSLog(@"two控制器 dealloc");
}


@end
