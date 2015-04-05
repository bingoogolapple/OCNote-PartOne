//
//  BGAEditViewController.m
//  私人通讯录
//
//  Created by bingoogol on 15/3/17.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGAEditViewController.h"
#import "BGAContact.h"

@interface BGAEditViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTf;
@property (weak, nonatomic) IBOutlet UITextField *phoneTf;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end

@implementation BGAEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.拿到通知中心
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    // 2.注册监听
    [center addObserver:self selector:@selector(textChanged) name:UITextFieldTextDidChangeNotification object:self.nameTf];
    [center addObserver:self selector:@selector(textChanged) name:UITextFieldTextDidChangeNotification object:self.phoneTf];
    
    self.nameTf.delegate = self;
    self.phoneTf.delegate = self;
    [self fillData];
}

- (void)textChanged {
    self.saveBtn.enabled = (self.nameTf.text.length > 0 && self.phoneTf.text.length > 0);
}

// 因为控制器的view是懒加载的，用到的时候再加载，而设置模型数据是在控制器跳转之前，此时没有用到控制器的view，所以控制器的view还没有创建，他的子控件也没有创建
- (void)setContact:(BGAContact *)contact {
    _contact = contact;
//    self.nameTf.text = contact.name;
//    self.phoneTf.text = contact.phone;
}

- (void)fillData {
    self.nameTf.text = self.contact.name;
    self.phoneTf.text = self.contact.phone;
}

- (IBAction)onClickEditBtn:(UIBarButtonItem *)sender {
    if (self.nameTf.enabled) {
        self.nameTf.enabled = NO;
        self.phoneTf.enabled = NO;
        self.saveBtn.hidden = YES;
        [self.phoneTf resignFirstResponder];
        sender.title = @"编辑";
        [self fillData];
        [self.view endEditing:YES];
    } else {
        self.nameTf.enabled = YES;
        self.phoneTf.enabled = YES;
        self.saveBtn.hidden = NO;
        [self.phoneTf becomeFirstResponder];
        sender.title = @"取消";
        
        self.saveBtn.enabled = (self.nameTf.text.length > 0 && self.phoneTf.text.length > 0);
    }
    
}

- (IBAction)onClickSaveBtn:(UIButton *)sender {
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
    self.contact.name = self.nameTf.text;
    self.contact.phone = self.phoneTf.text;
    if ([self.delegate respondsToSelector:@selector(editViewControllerDidClickSaveBtn:contact:)]) {
        [self.delegate editViewControllerDidClickSaveBtn:self contact:self.contact];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.nameTf) {
        [self.phoneTf becomeFirstResponder];
    } else if(textField == self.phoneTf) {
        [self onClickSaveBtn:self.saveBtn];
    }
    return NO;
}

@end