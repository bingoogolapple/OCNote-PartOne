//
//  ViewController.m
//  HTTP请求
//
//  Created by iqeggandroid on 15/4/12.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD+MJ.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTf;
@property (weak, nonatomic) IBOutlet UITextField *pwdTf;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (IBAction)login:(UIButton *)sender {
    // 1.用户名
    NSString *usernameText = self.userNameTf.text;
    if (usernameText.length == 0) {
        [MBProgressHUD showError:@"请输入用户名"];
        return;
    }
    
    // 2.密码
    NSString *pwdText = self.pwdTf.text;
    if (pwdText.length == 0) {
        [MBProgressHUD showError:@"请输入密码"];
        return;
    }
    
    /**
     
     接口文档：定义描述服务器端的请求接口
     1> 请求路径URL：客户端应该请求哪个路径
     * http://www.bingoogolapple.cn:8080/MJServer/login
     
     2> 请求参数：客户端要发给服务器的数据
     * username - 用户名
     * pwd - 密码
     
     3> 请求结果：服务器会返回什么东西给客户端
     */
    
    // 3.发送用户名和密码给服务器(走HTTP协议)
    // 创建一个URL ： 请求路径
    NSString *urlStr = [NSString stringWithFormat:@"http://www.bingoogolapple.cn:8080/MJServer/login?username=%@&pwd=%@",usernameText, pwdText];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    // 创建一个请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 发送一个同步请求(在主线程发送请求)
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSLog(@"%@", data);
}

@end
