//
//  BGACountryView.m
//  PickerView国旗
//
//  Created by bingoogol on 15/3/4.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGACountryView.h"

@interface BGACountryView()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@end

@implementation BGACountryView

+ (instancetype)countryView {
    return [[NSBundle mainBundle] loadNibNamed:@"BGACountryView" owner:nil options:nil].firstObject;
}

+ (CGFloat)rowHeight {
    return 54;
}

- (void)setCountry:(BGACountry *)country {
    _country = country;
    self.name.text = _country.name;
    self.iconView.image = [UIImage imageNamed:_country.icon];
}

@end