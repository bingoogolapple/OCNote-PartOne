//
//  AppDelegate.m
//  UITabBarController
//
//  Created by iqeggandroid on 15/4/6.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UITabBarController *tabBarVc = [[UITabBarController alloc] init];
    self.window.rootViewController = tabBarVc;
    
    // UITabBarButton是私有的，开发者拿不到，需要通过UITabBarItem设置
    
    UIViewController *redVc = [[UIViewController alloc] init];
    redVc.view.backgroundColor = [UIColor redColor];

    
    UIImage *image=[UIImage imageNamed:@"touxiang"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //设置选中时的图标
    UIImage *selectedImage=[UIImage imageNamed:@"touxiang"];
    // 声明这张图片用原图(别渲染)
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    redVc.tabBarItem = [redVc.tabBarItem initWithTitle:@"红色" image:image selectedImage:selectedImage];
    
    UIViewController *greenVc = [[UIViewController alloc] init];
    greenVc.view.backgroundColor = [UIColor greenColor];

    greenVc.tabBarItem = [greenVc.tabBarItem initWithTitle:@"绿色" image:image selectedImage:selectedImage];
    
    UIViewController *blueVc = [[UIViewController alloc] init];
    blueVc.view.backgroundColor = [UIColor blueColor];

    blueVc.tabBarItem = [blueVc.tabBarItem initWithTitle:@"蓝色" image:image selectedImage:selectedImage];
    
//    [tbc addChildViewController:redVc];
//    [tbc addChildViewController:greenVc];
//    [tbc addChildViewController:blueVc];
    
    tabBarVc.viewControllers = @[redVc,greenVc,blueVc];
    
    // 高度为49
    NSLog(@"%f", tabBarVc.tabBar.frame.size.height);
    
    
    
    
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
