//
//  AppDelegate.m
//  Modal
//
//  Created by iqeggandroid on 15/4/5.
//  Copyright (c) 2015年 iqeggandroid. All rights reserved.
//

#import "AppDelegate.h"
#import "BGAViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    BGAViewController *vc = [[BGAViewController alloc] init];
    self.window.rootViewController = vc;
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end