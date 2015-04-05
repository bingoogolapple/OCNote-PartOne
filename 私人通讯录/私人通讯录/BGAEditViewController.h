//
//  BGAEditViewController.h
//  私人通讯录
//
//  Created by bingoogol on 15/3/17.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BGAContact,BGAEditViewController;

@protocol BGAEditViewControllerDelegate <NSObject>

- (void) editViewControllerDidClickSaveBtn:(BGAEditViewController *)editViewController contact:(BGAContact *)contact;

@end

@interface BGAEditViewController : UIViewController<UITextFieldDelegate>
// 用户接收联系人列表传递过来的数据
@property (nonatomic, strong) BGAContact *contact;
@property (nonatomic, weak) id<BGAEditViewControllerDelegate> delegate;
@end