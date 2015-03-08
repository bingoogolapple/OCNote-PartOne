//
//  AppDelegate.m
//  UIWindow
//
//  Created by bingoogol on 15/3/8.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

// 当应用程序启动完毕的时候就会调用(系统自动调用)
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // 1.创建window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor redColor];
    // 2.创建控制器
    /*
    // 使用Storyboard时，系统帮我们执行
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = [storyboard instantiateInitialViewController];
    */
    ViewController *controller = [[ViewController alloc] init];
    // 3.设置window的根控制器
    self.window.rootViewController = controller;
    // 4.让window成为主窗口，并且显示出来
    [self.window makeKeyAndVisible];
    
    /*
    UIWindow *w2 = [[UIWindow alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    w2.backgroundColor = [UIColor yellowColor];
    [w2 makeKeyAndVisible];
    self.w2 = w2;
    
    // 获取应用程序主窗口
    UIWindow *mainWindow = [[UIApplication sharedApplication] keyWindow];
    NSLog(@"%@", mainWindow);
    */
    
    return YES;
}

// 即将失去活动状态的时候调用(失去焦点, 不可交互)
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

// 应用程序进入后台的时候调用
// 一般在该方法中保存应用程序的数据, 以及状态
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

// 应用程序即将进入前台的时候调用
// 一般在该方法中恢复应用程序的数据,以及状态
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

// 重新获取焦点(能够和用户交互)
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

// 应用程序即将被销毁的时候会调用该方法
// 注意:如果应用程序处于挂起状态的时候无法调用该方法
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

// 应用程序接收到内存警告的时候就会调用
// 一般在该方法中释放掉不需要的内存
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    // try to clean up as much memory as possible. next step is to terminate app
}

@end
