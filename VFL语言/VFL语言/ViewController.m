//
//  ViewController.m
//  VFL语言
//
//  Created by iqeggandroid on 15/4/6.
//  Copyright (c) 2015年 iqeggandroid. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    [blueView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [redView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    
    // 添加约束
    /*
     Visual Format Language
     注意：在vfl语句中不支持加减乘除法
     format vrl语句
     options 对齐方式
     metrics vfl语句中用到的变量
     views vfl语句中用到控件
     */
    NSNumber *height = @100.f;
    NSDictionary *metrics = NSDictionaryOfVariableBindings(height);
    NSDictionary *views = NSDictionaryOfVariableBindings(blueView,redView);
    NSLog(@"%@",views);
    
    // 设置蓝色View距离左边和右边有20的间距  x和宽度
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[blueView]-20-|" options:0 metrics:nil views:views]];
    // 设置蓝色View距离顶部有20的间距，高度为50
    // 红色控件顶部距离蓝色底部有20得间距，高度和蓝色控件高度相等
    // 并且设置红色和蓝色右对其
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[blueView(height)]-20-[redView(==blueView)]" options:NSLayoutFormatAlignAllTrailing metrics:metrics views:views]];
    
    NSLayoutConstraint *redWidthLc = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0];
    [self.view addConstraint:redWidthLc];
    
}

@end