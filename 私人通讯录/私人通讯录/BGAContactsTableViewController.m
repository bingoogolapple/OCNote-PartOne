//
//  BGAContactsTableViewController.m
//  私人通讯录
//
//  Created by bingoogol on 15/3/17.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGAContactsTableViewController.h"
#import "BGAEditViewController.h"
#import "BGAContact.h"

@interface BGAContactsTableViewController ()<UIActionSheetDelegate, BGAEditViewControllerDelegate>
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    BGAContact *contact = self.contacts[indexPath.row];
    cell.textLabel.text = contact.name;
    cell.detailTextLabel.text = contact.phone;
    return cell;
}

// 无论是手动类型的segue还是自动类型的segue，在跳转之前都会执行该方法
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    BGAEditViewController *editVc = segue.destinationViewController;
    editVc.mDelegate = self;
}

- (void)editViewControllerDidClickAddBtn:(BGAEditViewController *)editVc contact:(BGAContact *)contact {
    NSLog(@"添加联系人 %@,%@", contact.name, contact.phone);
    [self.contacts addObject:contact];
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