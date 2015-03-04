//
//  BGACountry.h
//  PickerView国旗
//
//  Created by bingoogol on 15/3/4.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BGACountry : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *icon;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)countryWithDictionary:(NSDictionary *)dict;
@end