//
//  AppDelegate.m
//  本地通知
//
//  Created by bingoogol on 16/4/23.
//  Copyright © 2016年 bingoogolapple. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 注意: 在iOS8中, 必须提前注册通知类型
    if ([UIDevice currentDevice].systemVersion.doubleValue >= 8.0) {
        UIUserNotificationType type = UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type categories:nil];
        // 注册通知类型
        [application registerUserNotificationSettings:settings];
    }
    
    static int count = 0;
    count++;
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 40, 200, 200);
    label.numberOfLines = 0;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:21];
    label.backgroundColor = [UIColor orangeColor];
    label.text = [NSString stringWithFormat:@" %@", launchOptions[UIApplicationLaunchOptionsLocalNotificationKey]];
    [self.window.rootViewController.view addSubview:label];
    return YES;
}

// 接收到本地通知时就会调用
// 当程序在前台时, 会自动调用该方法
// 当承载还后台时, 只有用户点击了通知才会调用
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    
    
    static int count = 0;
    count++;
    
    NSLog(@"%s   %d", __func__, count);
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 250, 200, 200);
    label.numberOfLines = 0;
    label.textColor = [UIColor whiteColor];
    label.text = [NSString stringWithFormat:@" %@", notification.userInfo];
    label.font = [UIFont systemFontOfSize:21];
    label.backgroundColor = [UIColor grayColor];
    [self.window.rootViewController.view addSubview:label];
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
