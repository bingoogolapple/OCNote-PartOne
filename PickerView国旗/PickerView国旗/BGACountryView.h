//
//  BGACountryView.h
//  PickerView国旗
//
//  Created by bingoogol on 15/3/4.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BGACountry.h"


@interface BGACountryView : UIView
@property (nonatomic, strong)BGACountry *country;

+ (instancetype)countryView;

+ (CGFloat)rowHeight;
@end