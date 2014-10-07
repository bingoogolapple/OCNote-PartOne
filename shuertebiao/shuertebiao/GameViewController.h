//
//  GameViewController.h
//  shuertebiao
//
//  Created by bingoogol on 14-6-10.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

#import <UIKit/UIKit.h>


#pragma mark - 协议定义
// 1.定义协议
// 协议名称通常是：委托方类名+Delegate
@protocol GameViewControllerDelegate <NSObject>
// 游戏完成
- (void)gameViewDidDone:(NSString *)timeString;

@end

#pragma mark - 借口定义
@interface GameViewController : UIViewController <UIAlertViewDelegate>

// 2.定义代理
@property (weak, nonatomic) id<GameViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *numberButtons;

@property (weak, nonatomic) IBOutlet UILabel *timerLabel;


- (IBAction)tapNumberButton:(UIButton *)sender;


// 返回主界面
- (IBAction)done;

@end
