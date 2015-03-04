//
//  BGACountry.m
//  PickerView国旗
//
//  Created by bingoogol on 15/3/4.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGACountry.h"

@implementation BGACountry

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)countryWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

@end