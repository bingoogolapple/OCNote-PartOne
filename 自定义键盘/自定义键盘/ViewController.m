//
//  ViewController.m
//  自定义键盘
//
//  Created by bingoogol on 15/3/5.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self test];
    
    UIToolbar *toolbar = [self getToolbar];
    UIDatePicker *datePicker = [self getDatePicker];
    self.textField.inputView = datePicker;
    // 设置文本输入框键盘的辅助视图
    self.textField.inputAccessoryView = toolbar;
}

- (UIToolbar *)getToolbar {
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    toolbar.barTintColor = [UIColor blueColor];
    toolbar.frame = CGRectMake(0, 0, self.view.frame.size.width, 44);
    
    UIBarButtonItem *preBbi = [[UIBarButtonItem alloc] initWithTitle:@"上一个" style:UIBarButtonItemStylePlain target:self action:@selector(onClickPreBbi)];
    UIBarButtonItem *nextBbi = [[UIBarButtonItem alloc] initWithTitle:@"下一个" style:UIBarButtonItemStylePlain target:self action:@selector(onClickNextBbi)];
    UIBarButtonItem *spaceBbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *finishBbi = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(onClickFinishBbi)];
    
    toolbar.items = @[preBbi, nextBbi, spaceBbi, finishBbi];
    return toolbar;
}

- (UIDatePicker *)getDatePicker {
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.frame = CGRectMake(0, 44, self.view.frame.size.width, 162);
    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    return datePicker;
}

- (void)test {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(0, self.view.frame.size.height - 162 - 44, self.view.frame.size.height, 162 + 44);
    
    UIToolbar *toolbar = [self getToolbar];
    [view addSubview:toolbar];
    
    UIDatePicker *datePicker = [self getDatePicker];
    [view addSubview:datePicker];

    [self.view addSubview:view];
}

- (void)onClickPreBbi {
    NSLog(@"上一个");
}

- (void)onClickNextBbi {
    NSLog(@"下一个");
}

- (void)onClickFinishBbi {
    NSLog(@"完成");
}

- (void)test:(UIDatePicker *)datePicker {
    NSLog(@"aaaaaa");
}

@end