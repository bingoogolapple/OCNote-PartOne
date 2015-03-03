//
//  BGAProvince.m
//  PickerView城市选择
//
//  Created by bingoogol on 15/3/3.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGAProvince.h"

@implementation BGAProvince

- (instancetype) initWithDictionary:(NSDictionary *)dict {
    if(self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype) provinceWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

@end