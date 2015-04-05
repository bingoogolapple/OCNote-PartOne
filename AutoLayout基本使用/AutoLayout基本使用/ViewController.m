//
//  ViewController.m
//  AutoLayout基本使用
//
//  Created by iqeggandroid on 15/4/5.
//  Copyright (c) 2015年 iqeggandroid. All rights reserved.
//

#import "ViewController.h"

/*
注意：如果使用autolayout来约束控件，那frame就失效了，官方也不建议我们再设置frame了
如果利用autolayout约束一个控件，和我们以前使用frame约束一样，必须设置宽度/高度/x/y,如果缺少某一个约束就会报错，有可能会引发一些未知bug
 
 在使用autolayout时，最好给每个控件起一个名字
 iOS8默认情况下，左右两边会留出一段距离
*/
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

@end