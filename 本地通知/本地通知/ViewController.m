//
//  ViewController.m
//  本地通知
//
//  Created by bingoogol on 16/4/23.
//  Copyright © 2016年 bingoogolapple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/*
 
 // timer-based scheduling
 @property(nonatomic,copy) NSDate *fireDate; 指定通知发送的时间
 @property(nonatomic,copy) NSTimeZone *timeZone; 指定发送通知的时区
 
 @property(nonatomic) NSCalendarUnit repeatInterval;  重复的周期, 枚举
 @property(nonatomic,copy) NSCalendar *repeatCalendar; 重复的周期  , 2014.12.12
 @property(nonatomic,copy) NSString *alertBody;      通知内容
 @property(nonatomic) BOOL hasAction;                是否需要华东事件
 @property(nonatomic,copy) NSString *alertAction;    锁屏状态的标题
 @property(nonatomic,copy) NSString *alertLaunchImage;   点击通知之后的启动图片
 @property(nonatomic,copy) NSString *soundName;    收到通知播放的音乐
 @property(nonatomic) NSInteger applicationIconBadgeNumber;  图标提醒数字
 @property(nonatomic,copy) NSDictionary *userInfo;   额外的信息
 */
- (IBAction)regist:(id)sender {
    NSLog(@"%s", __func__);
    // 1.创建本地通知对象
    UILocalNotification *note = [[UILocalNotification alloc] init];
    
    // 指定通知发送的时间(指定5秒之后发送通知)
    note.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    // 注意: 在真实开发中一般情况下还需要指定时区(让通知的时间跟随当前时区)
    note.timeZone = [NSTimeZone defaultTimeZone];
    // 指定通知内容
    note.alertBody = @"这是通知内容";
    
    // 设置通知重复的周期(1分钟通知一期)
    //    note.repeatInterval = NSCalendarUnitSecond;
    
    // 指定锁屏界面的信息
    note.alertAction = @"这是锁屏界面的信息";
    
    // 设置点击通知进入程序时候的启动图片
    note.alertLaunchImage = @"Default";
    
    // 收到通知播放的音乐
    note.soundName = @"buyao.wav";
    
    // 设置应用程序的提醒图标
    note.applicationIconBadgeNumber = 998;
    
    // 注册通知时可以指定将来点击通知之后需要传递的数据
    note.userInfo = @{@"name":@"bga",
                      @"age":@"24",
                      @"phone": @"111111111"};
    
    // 2.注册通知(图片的名称建议使用应用程序启动的图片名称)
    UIApplication *app =  [UIApplication sharedApplication];
    // 每次调用添加方法都会将通知添加到scheduledLocalNotifications数组中
    [app scheduleLocalNotification:note];
}

- (IBAction)cancel:(id)sender {
    UIApplication *app =  [UIApplication sharedApplication];
    NSLog(@"%zd", app.scheduledLocalNotifications.count);
    // 清空通知
    //    [app cancelLocalNotification:<#(UILocalNotification *)#>]
    [app cancelAllLocalNotifications];
}



@end
