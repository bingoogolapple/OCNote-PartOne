//
//  BGAProvince.h
//  PickerView城市选择
//
//  Created by bingoogol on 15/3/3.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BGAProvince : NSObject
@property (nonatomic,copy) NSString * name;
@property (nonatomic,strong) NSArray *cities;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)provinceWithDictionary:(NSDictionary *)dict;
@end