//
//  ViewController.m
//  UIWindow
//
//  Created by bingoogol on 15/3/8.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    [self test];
}

//- (BOOL) prefersStatusBarHidden {
//    return YES;
//}

//- (UIStatusBarStyle)preferredStatusBarStyle {
//    return UIStatusBarStyleDefault;
//}

- (void)test {
    UIApplication *app = [UIApplication sharedApplication];
    // 设置应用程序图标上的数字
    app.applicationIconBadgeNumber = 998;
    // 设置状态栏的联网动画
    //    app.networkActivityIndicatorVisible = YES;
    
    // 需配置在Info.plist中添加配置View controller-based status bar appearance为NO
    // 设置状态栏的样式
//    app.statusBarStyle = UIStatusBarStyleLightContent;
//    [app setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    
    // 设置状态栏是否隐藏
//    app.statusBarHidden = YES;
    [app setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    
    /*
     URL:统一资源定位符 , 用来唯一的表示一个资源
     URL: 协议头://主机地址/资源路径
     
     网络资源:http://www.baidu.com/images/20140603/abc.png
     本地资源:file:///users/apple/desktop/abc.png
     */
    
//    NSURL *url = [NSURL URLWithString:@"http://ios.itcast.cn"];
//    [app openURL:url];
}

@end
