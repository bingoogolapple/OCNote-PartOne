//
//  ViewController.m
//  AFN基本使用
//
//  Created by iqeggandroid on 15/4/12.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()

@end


// AFHTTPSessionManager 底层对NSURLSession的封装
// AFHTTPRequestOperationManager 底层对NSURLConnection的封装
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // http://www.bingoogolapple.cn:8080/MJServer/login?username=123&pwd=123&method=get&type=JSON
    [self getSession];
}

- (void)getSession {
    
    AFHTTPSessionManager *afnManager = [AFHTTPSessionManager manager];

    NSString *url = @"http://www.bingoogolapple.cn:8080/MJServer/login";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"username"] = @"123";
    params[@"pwd"] = @"123";
    
    [afnManager GET:url parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"请求成功----%@----%@", [responseObject class], responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"请求失败");
    }];
}

- (void)postJson {
    AFHTTPRequestOperationManager *afnManager = [AFHTTPRequestOperationManager manager];
    
    // 默认就是AFJSONResponseSerializer
    //    afnManager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSString *url = @"http://www.bingoogolapple.cn:8080/MJServer/login";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"username"] = @"123";
    params[@"pwd"] = @"123";
    
    [afnManager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"请求成功----%@----%@", [responseObject class], responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败");
    }];
}

- (void)getData {
    AFHTTPRequestOperationManager *afnManager = [AFHTTPRequestOperationManager manager];
    // 声明：不要对服务器返回的数据进行解析，直接返回data即可
    // 如果是文件下载，肯定是用这个
    afnManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSString *url = @"http://www.bingoogolapple.cn:8080/MJServer/login";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"username"] = @"123";
    params[@"pwd"] = @"123";
    params[@"type"] = @"XML";
    
    [afnManager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"请求成功----%@----%@", [responseObject class], responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败");
    }];
}

- (void)getXml {
    AFHTTPRequestOperationManager *afnManager = [AFHTTPRequestOperationManager manager];
    
    afnManager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    
    NSString *url = @"http://www.bingoogolapple.cn:8080/MJServer/login";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"username"] = @"123";
    params[@"pwd"] = @"123";
    params[@"type"] = @"XML";
    
    [afnManager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, NSXMLParser *responseObject) {
        NSLog(@"请求成功----%@----%@", [responseObject class], responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败");
    }];
}

- (void)getJson {
    AFHTTPRequestOperationManager *afnManager = [AFHTTPRequestOperationManager manager];

    // 默认就是AFJSONResponseSerializer
//    afnManager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSString *url = @"http://www.bingoogolapple.cn:8080/MJServer/login";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"username"] = @"123";
    params[@"pwd"] = @"123";
    
    [afnManager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"请求成功----%@----%@", [responseObject class], responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败");
    }];
}

@end
