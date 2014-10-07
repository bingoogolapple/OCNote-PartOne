//
//  GameViewController.m
//  shuertebiao
//
//  Created by bingoogol on 14-6-10.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()
{
    // 用户上次点击的数字
    NSInteger _lastTapNumber;
    // 游戏开始时间
    NSDate *_gameStartTime;
    // 游戏时钟
    NSTimer *_gameTimer;
}
@end

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // 需要做一个测试，Collection中保存的对象是无序的，我们需要自己找办法保持顺序
   NSArray *numberArray = [self createNumberArray];
    // 设置按钮上面的数字
    for (UIButton *button in _numberButtons) {
        // 经过包装后的整数，是一个NSNumber类型，需要转成NSString
        NSString *text = [numberArray[button.tag] stringValue];
        [button setTitle:text forState:UIControlStateNormal];
    }
    _lastTapNumber = 0;
    // 第一个参数：多长时间会触发一次
    // 第二个参数：如果看到函数的参数有target，一般情况下，都用self
    // 第三个参数：SEL，需要调用其他的方法，就是每次时钟被触发的时候，去执行的方法（最多可以带一个参数，就是时钟本身）
    // 第四个参数：暂时不用考虑，设置成nil
    // 第五个参数：是否重复，通常会设置YES
    _gameTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];
    // 记录一下游戏开始时间
    _gameStartTime = [NSDate date];
}
#pragma mark - Actions

- (void)updateTimer:(NSTimer *)sender {
    // 在此处设置游戏计时器标签的内容，提示玩家当前过了多少秒
    // fireDate是时钟的当前触发时间
    NSInteger deltaTime = [sender.fireDate timeIntervalSinceDate:_gameStartTime];
    // 设置时间的字符串 00:00 mm:ss
    NSString *text = [NSString stringWithFormat:@"%02d:%02d",deltaTime/60,deltaTime%60];
    [_timerLabel setText:text];
    NSLog(@"过了%d秒",deltaTime);
}

/**
 生成一个连续数字的数组，用于设置界面上按钮中显示的数字
 */
//创建数字数组
- (NSArray *)createNumberArray {
    NSMutableArray *array = [NSMutableArray array];
    for(NSInteger i = 1; i< 10; i++) {
        [array addObject:@(i)];
    }
    // 打乱数组的顺序
    
    for(NSInteger i = 0; i < 9; i++) {
        NSInteger seed = i + arc4random_uniform(9 - i);
        [array exchangeObjectAtIndex:i withObjectAtIndex:seed];
    }
    NSLog(@"%@", array);
    return array;
}


#pragma mark 返回主界面
- (IBAction)done {
    // 关闭游戏时钟
    [_gameTimer invalidate];
    // 关闭当前试图控制器，因为当前试图控制器是被上级视图控制器推出来得
    // 因此，关闭了当前这个试图控制器，原来的就露出来了
    // 提醒：关闭之后，当前试图控制器会被释放
    // 再次点击上级试图控制器的按钮，本试图控制器的viewDidLoad方法仍然会执行
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 按钮点击事件
- (IBAction)tapNumberButton:(UIButton *)sender {
    NSString *text = [[sender titleLabel] text];
    NSInteger number = [text integerValue];
    if((_lastTapNumber + 1) == number) {
        _lastTapNumber++;
        [sender setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [sender setEnabled:NO];
    } else {
        NSLog(@"点错了");
    }
    
    if(_lastTapNumber == 9) {
        // 关闭游戏时钟
        [_gameTimer invalidate];
        // 取出标签中的文本，提示用户
        NSString *message = [NSString stringWithFormat:@"帅呆了 用时：%@", _timerLabel.text];
        // 委托代理执行方法，如果没有设置代理，这条指令不生效，但也不会报错
        [_delegate gameViewDidDone:_timerLabel.text];
        
        // 如果只有一个按钮，那么载cancelButtonTitle设置的文字“确定”
        // 要坚挺消息框的确定按钮被点击，需要遵从消息框的协议
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"点击了确定");
    [self done];
}
@end
