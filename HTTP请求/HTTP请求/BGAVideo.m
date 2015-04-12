//
//  BGAVideo.m
//  HTTP请求
//
//  Created by iqeggandroid on 15/4/12.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGAVideo.h"

@implementation BGAVideo
+ (instancetype)videoWithDict:(NSDictionary *)dict {
    BGAVideo *video = [[self alloc] init];
    [video setValuesForKeysWithDictionary:dict];
    return video;
}
@end
