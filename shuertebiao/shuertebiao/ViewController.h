//
//  ViewController.h
//  shuertebiao
//
//  Created by bingoogol on 14-6-10.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameViewController.h"

// 遵从游戏视图代理
@interface ViewController : UIViewController <GameViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

