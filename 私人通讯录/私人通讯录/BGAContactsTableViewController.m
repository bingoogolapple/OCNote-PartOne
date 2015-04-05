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
#import "BGAContactCell.h"

#define BGAContactPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"contact.arc"]

@interface BGAContactsTableViewController ()<UIActionSheetDelegate, BGAAddViewControllerDelegate, BGAEditViewControllerDelegate>
@property (nonatomic, strong)NSMutableArray *contacts;
@end

@implementation BGAContactsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 60;
    
    // storyboard中默认只有两个导航按钮，要多于两个时需要通过代码的方式添加
    // 先取出添加按钮
    UIBarButtonItem *addBbi = self.navigationItem.rightBarButtonItem;
    UIBarButtonItem *editBbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(onClickEditBtn)];
    self.navigationItem.rightBarButtonItems = @[addBbi,editBbi];
}

- (void)onClickEditBtn {
    [self.tableView setEditing:!self.tableView.editing animated:YES];
}

- (NSMutableArray *)contacts {
    if(_contacts == nil) {
        _contacts = [NSKeyedUnarchiver unarchiveObjectWithFile:BGAContactPath];
        // 没有归档文件的情况
        if(_contacts == nil) {
            _contacts = [NSMutableArray array];
        }
    }
    return _contacts;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BGAContactCell *cell = [BGAContactCell cellWithTableView:tableView];
    BGAContact *contact = self.contacts[indexPath.row];
    cell.contact = contact;
    return cell;
}

// 无论是手动类型的segue还是自动类型的segue，在跳转之前都会执行该方法    顺传用segue拿到目标控制器，逆传用代理
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *vc = segue.destinationViewController;
    if([vc isKindOfClass:[BGAAddViewController class]]) {
        BGAAddViewController *addVc = (BGAAddViewController *)vc;
        addVc.delegate = self;
        
        self.tableView.editing = NO;
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
    [self saveData];
}

- (void)editViewControllerDidClickSaveBtn:(BGAEditViewController *)editViewController contact:(BGAContact *)contact {
    // 引用传递，不用传contact回来
    //    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
//    self.contacts[path.row] = contact;
    
    [self.tableView reloadData];
    [self saveData];
}

- (void)saveData {
    NSLog(@"%@", BGAContactPath);
    [NSKeyedArchiver archiveRootObject:self.contacts toFile:BGAContactPath];
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

// 只要实现该方法，手机在cell上面滑动的时候就自动实现了删除按钮，点击添加或者删除按钮是会调用该方法
// editingStyle 传输删除/添加
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.contacts removeObjectAtIndex:indexPath.row];
        // reloadData会重新调用数据的所有方法，刷新所有的行
//        [self.tableView reloadData];
        // 该方法用于删除tableview上制定行的cell
        // 注意：使用该方法的时候，模型中删除的数据的条数必须和deleteRowsAtIndexPaths方法中删除的条数一致，否则会报错
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        
        [self saveData];
    } else if(editingStyle == UITableViewCellEditingStyleInsert) {
        NSLog(@"添加");
        BGAContact *contact = [[BGAContact alloc] init];
        contact.name = @"namesdfsdf";
        contact.phone = @"23423423423";
        [self.contacts insertObject:contact atIndex:indexPath.row + 1];
        NSIndexPath *path = [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationRight];
    }
}

// 用于告诉系统开启的编辑模式是什么模式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%d", indexPath.row);
    if (indexPath.row % 2 == 0) {
        return UITableViewCellEditingStyleInsert;
    } else {
        return UITableViewCellEditingStyleDelete;
    }
}


@end