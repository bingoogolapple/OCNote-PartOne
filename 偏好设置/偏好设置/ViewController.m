//
//  ViewController.m
//  偏好设置
//
//  Created by iqeggandroid on 15/4/4.
//  Copyright (c) 2015年 iqeggandroid. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

/**
 *  偏好设置是专门用来保存应用程序的配置信息的，一般情况下不要在偏好设置中保存其他数据
 *  如果利用系统的偏好设置来存储数据，默认就是存储在Preferences文件夹下面的
 *  偏好设置会将所有的数据保存到同一个文件中
 */
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)onClickSaveBtn:(id)sender {
    // 如果设置数据之后没有同步，会在将来的某一时间点自动将数据保存到Preferences文件夹下面
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:@"wanghao" forKey:@"name"];
    [userDefaults setInteger:23 forKey:@"age"];
    // 让NSUserDefaults立即保存数据
    [userDefaults synchronize];
}

- (IBAction)onClickReadBtn:(id)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    NSString *name = [userDefaults stringForKey:@"name"];
    int age = [userDefaults integerForKey:@"age"];
    NSLog(@"%@", name);
    NSLog(@"%d", age);
}

@end
