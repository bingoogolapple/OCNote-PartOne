//
//  ViewController.m
//  AutoLayout代码
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
    
    /*
     Item == first item 需要设置约束的控件
     attribute == 需要设置的约束
     relateBy == relation 等于
     toItem == second item 被参照的控件
     attribure == 需要设置的约束
     multiplier == multiplier 乘以
     constant == constant  加上
     */
    // 1添加蓝色View距离父控件左边的距离固定为20 x
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *blueLeftLc = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:20];
    // 2添加蓝色View距离父控件右边的距离固定为20 宽度
    NSLayoutConstraint *blueRightLc = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-20];
    // 3添加蓝色View距离父控件上边的距离固定为20 y
    NSLayoutConstraint *blueTopLc = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:20];
    // 4添加蓝色View的高度50 高
    NSLayoutConstraint *blueHeightLc = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50];
    [self.view addConstraints:@[blueLeftLc,blueRightLc,blueTopLc]];
    [blueView addConstraint:blueHeightLc];
    
    // 设置红色控件
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    // 红色的高度和蓝色的高度一样
    NSLayoutConstraint *redHeightLc = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    // 红色的右边和蓝色的右边对其
    NSLayoutConstraint *redRightLc = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    // 红色的顶部等于蓝色的底部+20
    NSLayoutConstraint *redTopLc = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20];
    // 红色的宽度等于蓝色的宽度*0.5
    NSLayoutConstraint *redWidthLc = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0];
    [self.view addConstraints:@[redHeightLc,redRightLc,redTopLc,redWidthLc]];
    
}

@end
