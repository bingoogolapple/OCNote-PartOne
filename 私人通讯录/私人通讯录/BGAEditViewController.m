//
//  BGAEditViewController.m
//  私人通讯录
//
//  Created by bingoogol on 15/3/17.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGAEditViewController.h"
#import "BGAContactsTableViewController.h"
#import "BGAContact.h"

@interface BGAEditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTf;
@property (weak, nonatomic) IBOutlet UITextField *phoneTf;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end

@implementation BGAEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.拿到通知中心
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    // 2.注册监听
    [center addObserver:self selector:@selector(textChanged) name:UITextFieldTextDidChangeNotification object:self.usernameTf];
    [center addObserver:self selector:@selector(textChanged) name:UITextFieldTextDidChangeNotification object:self.phoneTf];
}

- (void)textChanged {
    self.addBtn.enabled = (self.usernameTf.text.length > 0 && self.phoneTf.text.length > 0);
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (IBAction)onClickAddBtn:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
    NSString *name = self.usernameTf.text;
    NSString *phone = self.phoneTf.text;
    
    BGAContact *contact = [[BGAContact alloc] init];
    contact.name = name;
    contact.phone = phone;
    if([self.mDelegate respondsToSelector:@selector(editViewControllerDidClickAddBtn:contact:)]) {
        [self.mDelegate editViewControllerDidClickAddBtn:self contact:contact];
    }
}

@end
