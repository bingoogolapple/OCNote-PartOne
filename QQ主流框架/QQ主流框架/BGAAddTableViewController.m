//
//  BGAAddTableViewController.m
//  QQ主流框架
//
//  Created by iqeggandroid on 15/4/6.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGAAddTableViewController.h"

@interface BGAAddTableViewController ()

@end
/*
 1.静态单元格注意点
 storyboard中tableview的组和行已经固定死，如果你自己的tableview数据源方法返回的组数超过storyboard中tableview的组数就会报错
 
 2.在iOS7里面，只有在UINavigationController中UIScrollView顶部会添加额外的64的滚动区域
 */
@implementation BGAAddTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%f",self.tableView.contentInset.top);
}

@end