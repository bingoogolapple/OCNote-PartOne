//
//  BGAEditViewController.h
//  私人通讯录
//
//  Created by bingoogol on 15/3/17.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import <UIKit/UIKit.h>
// 如果没有这一句，- (void)editViewControllerDidClickAddBtn:(BGAEditViewController *) editVc contact:(BGAContact *)contact;编译不能通过
@class BGAEditViewController,BGAContact;

@protocol BGAEditViewControllerDelegate <NSObject>

- (void)editViewControllerDidClickAddBtn:(BGAEditViewController *) editVc contact:(BGAContact *)contact;

@end

@interface BGAEditViewController : UIViewController
@property (nonatomic,weak) id<BGAEditViewControllerDelegate> mDelegate;
@end