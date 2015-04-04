//
//  ViewController.m
//  数据存储plist
//
//  Created by iqeggandroid on 15/4/4.
//  Copyright (c) 2015年 iqeggandroid. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

/**
 *  Documents 保存应用程序运行时生成的需要持久化的数据，iTunes同步设备时会备份该目录。例如，游戏应用可将游戏存档保存在该目录
 *  tmp 保存应用运行时所需的临时数据，使用完毕后再将相应的文件从该目录删除。应用没有运行时，系统也可能会清楚该目录下的文件。iTunes同步设备时不会备份该目录
 *  Library/Caches 保存应用运行时生成的需要持久化的数据，iTunes同步设备时不会备份该目录。一般存储体积大，不需要备份的非重要数据。
 *  Library/Preference 保存应用的所有偏好设置，iOS的Settings（设置）应用会在该目录中查找应用的设置信息。iTunes同步设备时会备份该目录。
 */
/**
 *  plist不能保存自定义的对象，只能存储系统自带的一些常规的类，也就是有writeToFile方法的对象才可以使用plist保存数据  字符串、字典、数据、NSNumber、NSDictionary
 */
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)onClickSaveBtn:(id)sender {
    [self test2];
}

- (void)test2 {
    NSArray *arr = @[@"111",@"222"];
    NSDictionary *dict = @{@"name":@"bga",@"age":@"23"};
    /**
     *  NSDocumentDirectory 查找Documents文件夹
     *  NSUserDomainMask 在用户目录下查找
     *  expandTilde YES代表不使用用户目录的~
     *
     *  由于只有一个Documents文件夹，所以结果去最后一个
     */
    NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"%@", document);

    [arr writeToFile:[document stringByAppendingPathComponent:@"arr.plist"] atomically:YES];
    [dict writeToFile:[document stringByAppendingPathComponent:@"dict.plist"] atomically:YES];
}

- (void)test1 {
    NSArray *arr = @[@"111",@"222"];
    NSDictionary *dict = @{@"name":@"bga",@"age":@"23"};
    
    // 获取应用程序沙盒目录
    NSString *home = NSHomeDirectory();
    // atomically  线程安全的，YES表示先写到临时文件，当数据完全写完时，才把临时文件变成正式文件
    //    [arr writeToFile:[home stringByAppendingString:@"/arr.plist"] atomically:YES];
    [arr writeToFile:[home stringByAppendingPathComponent:@"arr.plist"] atomically:YES];
    [dict writeToFile:[home stringByAppendingPathComponent:@"dict.plist"] atomically:YES];
}

- (IBAction)onClickReadBtn:(id)sender {
    NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[document stringByAppendingPathComponent:@"dict.plist"]];
    NSLog(@"%@", dict);
}

@end