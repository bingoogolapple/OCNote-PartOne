//
//  BGAApp.m
//  NSOperationCell图片下载
//
//  Created by iqeggandroid on 15/4/12.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGAApp.h"

@implementation BGAApp

+(instancetype)appWithDict:(NSDictionary *)dict {
    BGAApp *app = [[self alloc] init];
    [app setValuesForKeysWithDictionary:dict];
    return app;
}
@end
