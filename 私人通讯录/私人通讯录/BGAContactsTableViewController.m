//
//  BGAContactsTableViewController.m
//  私人通讯录
//
//  Created by bingoogol on 15/3/17.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGAContactsTableViewController.h"
#import "BGAAddViewController.h"
#import "BGAEditViewController.h"
#import "BGAContact.h"

@interface BGAContactsTableViewController ()<UIActionSheetDelegate, BGAAddViewControllerDelegate, BGAEditViewControllerDelegate>
@property (nonatomic, strong)NSMutableArray *contacts;
@end

@implementation BGAContactsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSMutableArray *)contacts {
    if(_contacts == nil) {
        _contacts = [NSMutableArray array];
    }
    return _contacts;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"contacts";
    // 缓存中找不到则到storyboard中找
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    BGAContact *contact = self.contacts[indexPath.row];
    cell.textLabel.text = contact.name;
    cell.detailTextLabel.text = contact.phone;
    return cell;
}

// 无论是手动类型的segue还是自动类型的segue，在跳转之前都会执行该方法    顺传用segue拿到目标控制器，逆传用代理
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *vc = segue.destinationViewController;
    if([vc isKindOfClass:[BGAAddViewController class]]) {
        BGAAddViewController *addVc = (BGAAddViewController *)vc;
        addVc.delegate = self;
    } else if([vc isKindOfClass:[BGAEditViewController class]]) {
        BGAEditViewController *editVc = (BGAEditViewController *)vc;
        // 通过tableview获取被点击的行
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        BGAContact *contact = self.contacts[path.row];
        editVc.contact = contact;
        editVc.delegate = self;
    }
}

- (void)addViewControllerDidClickAddBtn:(BGAAddViewController *)editVc contact:(BGAContact *)contact {
    NSLog(@"添加联系人 %@,%@", contact.name, contact.phone);
    [self.contacts addObject:contact];
    [self.tableView reloadData];
}

- (void)editViewControllerDidClickSaveBtn:(BGAEditViewController *)editViewController contact:(BGAContact *)contact {
    // 引用传递，不用传contact回来
    //    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
//    self.contacts[path.row] = contact;
    
    [self.tableView reloadData];
}

- (IBAction)logout:(UIBarButtonItem *)sender {
    // 最后一个必须是nil，因为系统是根据nil来判断是否还有其他按钮
//    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"确定要注销？" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:@"第三个按钮",@"第四个按钮", nil];
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"确定要注销？" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:nil];
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}


@end