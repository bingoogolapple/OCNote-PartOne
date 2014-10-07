//
//  ViewController.m
//  shuertebiao
//
//  Created by bingoogol on 14-6-10.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
            

@end

@implementation ViewController

// 是ViewController内置的方法，所有在StoryBoard中的连线在推出新的视图控制器之前都会调用该方法
// 可以通过segue的一个属性获取到目标视图控制器
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    GameViewController *controller = [segue destinationViewController];
    // 申请成为游戏视图的代理，设置后，游戏视图控制器的协议方法就会在当前试图控制器中执行
    [controller setDelegate:self];
}
            
#pragma mark - 游戏视图代理方法
- (void)gameViewDidDone:(NSString *)timeString {
    NSLog(@"ViewController 你花了%@秒",timeString);
    [_scoreLabel setText:timeString];
}

@end
