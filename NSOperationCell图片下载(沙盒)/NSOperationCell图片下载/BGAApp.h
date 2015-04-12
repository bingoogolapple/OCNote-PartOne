//
//  BGAApp.h
//  NSOperationCell图片下载
//
//  Created by iqeggandroid on 15/4/12.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BGAApp : NSObject
/**
 *  应用名称
 */
@property (nonatomic, copy) NSString *name;
/**
 *  下载量
 */
@property (nonatomic, copy) NSString *download;
/**
 *  应用图标url
 */
@property (nonatomic, copy) NSString *icon;

+(instancetype)appWithDict:(NSDictionary *)dict;
@end
