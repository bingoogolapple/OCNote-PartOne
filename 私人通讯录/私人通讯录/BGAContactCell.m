//
//  BGAContactCell.m
//  私人通讯录
//
//  Created by iqeggandroid on 15/4/4.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGAContactCell.h"
#import "BGAContact.h"

@interface BGAContactCell()
@property (nonatomic, weak)UIView *devider;
@end

@implementation BGAContactCell

// 如果控件是通过xib或者storyboard创建出来的就会调用该方法，该方法只会调用一次
- (void)awakeFromNib {
    NSLog(@"awakeFromNib");

    UIView *devider = [[UIView alloc] init];
    devider.backgroundColor = [UIColor blackColor];
    devider.alpha = 0.1;
    // 注意：不要直接将子控件添加到cell中，要添加到contentView中
    [self.contentView addSubview:devider];
    self.devider = devider;
}

// 该方法只有在通过代码创建控件的时候才会调用，如果控件是通过xib或者storyboard创建出来的则不会调用该方法
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        NSLog(@"initWithStyle");
    }
    return self;
}

// 当控件的frame被修改的时候就会调用，一般在该方法中布局子控件
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat x = 0;
    CGFloat h = 1;
    CGFloat w = self.frame.size.width;
    CGFloat y = self.frame.size.height - h;
    self.devider.frame = CGRectMake(x, y, w, h);
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"contacts";
    // 首先回去缓存中找，如果找不到会去storyboard中找有没有叫contacts得cell，有就创建
    BGAContactCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    return cell;
}

- (void)setContact:(BGAContact *)contact {
    _contact = contact;
    self.textLabel.text = contact.name;
    self.detailTextLabel.text = contact.phone;
}

@end
