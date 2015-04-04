//
//  BGAContactCell.h
//  私人通讯录
//
//  Created by iqeggandroid on 15/4/4.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BGAContact;

@interface BGAContactCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) BGAContact *contact;

@end