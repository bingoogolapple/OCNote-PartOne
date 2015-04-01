//
//  BGALoginViewController.m
//  私人通讯录
//
//  Created by bingoogol on 15/3/17.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGALoginViewController.h"
#import "MBProgressHUD+NJ.h"

@interface BGALoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTf;
@property (weak, nonatomic) IBOutlet UITextField *pwdTf;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UISwitch *remPwdSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;


- (IBAction)remPwdChange:(UISwitch *)sender;
- (IBAction)autoLogonChange:(UISwitch *)sender;
- (IBAction)onClickLogin:(UIButton *)sender;


@end

@implementation BGALoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.拿到通知中心
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    // 2.注册监听
    [center addObserver:self selector:@selector(textChanged) name:UITextFieldTextDidChangeNotification object:self.usernameTf];
    [center addObserver:self selector:@selector(textChanged) name:UITextFieldTextDidChangeNotification object:self.pwdTf];
    
}

- (void)textChanged {
    self.loginBtn.enabled = (self.usernameTf.text.length > 0 && self.pwdTf.text.length > 0);
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



- (IBAction)remPwdChange:(UISwitch *)sender {
    if (!sender.isOn) {
//        self.autoLoginSwitch.on = NO;
        [self.autoLoginSwitch setOn:NO animated:YES];
    }
}

- (IBAction)autoLogonChange:(UISwitch *)sender {
    if (sender.isOn) {
        self.remPwdSwitch.on = YES;
        [self.remPwdSwitch setOn:YES animated:YES];
    }
}

- (IBAction)onClickLogin:(UIButton *)sender {
    [MBProgressHUD showMessage:@"正在拼命加载ing......"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUD];
        if([self.usernameTf.text isEqualToString:@"bga"] && [self.pwdTf.text isEqualToString:@"123"]) {
            // 自动类型的Segue，从控件到控制器；手动类型的Segue，从控制器到控制器
//            [self performSegueWithIdentifier:@"login2contact" sender:nil];
            
            [self performSegueWithIdentifier:@"login2contact" sender:@"testsender"];
        } else {
//            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"用户名或密码错误" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
//            [alertView show];
            [MBProgressHUD showError:@"用户名或密码错误"];
        }
    });
   
}

// 在segue跳转之前调用，会传入performSegueWithIdentifier方法创建好的segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"%@", sender);
    UIViewController *destinationViewController = segue.destinationViewController;
//    destinationViewController.navigationItem.title = [NSString stringWithFormat:@"%@的联系人列表",self.usernameTf.text];
    destinationViewController.title = [NSString stringWithFormat:@"%@的联系人列表",self.usernameTf.text];
}

@end