//
//  ViewController.m
//  Hello
//
//  Created by bingoogol on 14-6-4.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    // 在viewDidLoad方法中，必须实现super方法
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 如果这句话没有执行，一定是StoryBoard出了问题
    NSLog(@"viewDidLoad-View加载完成");
    
    // 在oc中，所有你不熟悉的对象，实例化的时候，先敲一下它的名字
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    // 定义一下按钮的位置
    [button setFrame:CGRectMake(150, 450, 100, 40)];
    // 定义按钮正常状态下的文字
    [button setTitle:@"别摸我" forState:UIControlStateNormal];
    // 定义按钮按住时的文字
    [button setTitle:@"就摸你" forState:UIControlStateHighlighted];
    // 设置按钮正常状态下文字的颜色
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    // 设置按钮按下状态下文字的颜色
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    // 设置按钮的背景颜色，如果要设置阿牛的背景颜色，需要使用自定义类型的按钮
    [button setBackgroundColor:[UIColor orangeColor]];
    
    // 设置点击按钮时执行的方法
    [button addTarget:self action:@selector(tabButton:) forControlEvents:UIControlEventTouchUpInside];
    
    // 设置按钮的图像
    UIImage *image1 = [UIImage imageNamed:@"button1.png"];
   // [button setImage:image1 forState:UIControlStateNormal];
    UIImage *image2 = [UIImage imageNamed:@"button2.png"];
    //[button setImage:image2 forState:UIControlStateHighlighted];
    
    // 设置按钮的背景图像，会根据按钮尺寸拉伸
    [button setBackgroundImage:image1 forState:UIControlStateNormal];
    [button setBackgroundImage:image2 forState:UIControlStateHighlighted];
    
    // 将按钮添加到视图
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 按钮点击执行的方法
// 在StoryBoard连线的时候，这个方法的返回值是IBAction，所谓IBAction就是载头文件里面可以连线的void
- (void)tabButton:(UIButton *)sender {
    NSLog(@"我被摸了 %@", [sender.titleLabel text]);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // 要执行此代理方法，需要在Storybord中，将文本框的代理设置给controller
    // 当用户的光标在qq号码的时候，用户按下回车，光标切换到密码框
    if(textField == _qq) {
        [_pwd becomeFirstResponder];
    } else if(textField == _pwd) {
        [self login:nil];
    }
    
    // 当用户的光标在密码的时候，用户按下回车，执行login方法
    return YES;
}

- (void)login:(id)sender {
    NSString *qqText = _qq.text;
    NSString *pwdText = _pwd.text;
    NSLog(@"点击了登陆按钮,QQ=%@  密码=%@", qqText, pwdText);
    // 暂时理解：交出键盘的那个视图就是第一个响应者，resignFirstResponder代表这个视图不想当第一响应者了，于是键盘就会退出
    //[_qq resignFirstResponder];
    //[_pwd resignFirstResponder];
    
    // 如果第一响应者self.view里面，就可以退出键盘
    [self.view endEditing:YES];
}

- (void)calculator:(id)sender {
    // 获取文本输入框的值
    NSString *number1Text = self.number1.text;
    NSString *number2Text = self.number2.text;
    // 将字符串转为整数
    int numberInt1 = number1Text.intValue;
    int numberInt2 = number2Text.intValue;
    
    // 将结果显示到右边的文本中
    self.result.text = [NSString stringWithFormat:@"%d", numberInt1 + numberInt2];
    [self.view endEditing:YES];
}

- (IBAction)indexChange:(UISegmentedControl *)sender {
    NSLog(@"选中%ld", sender.selectedSegmentIndex);
}

@end
