//
//  BGAVideo.h
//  HTTP请求
//
//  Created by iqeggandroid on 15/4/12.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BGAVideo : NSObject
/**
 *  ID
 */
@property (nonatomic, assign) int id;
/**
 *  时长
 */
@property (nonatomic, assign) int length;

/**
 *  图片（视频截图）
 */
@property (nonatomic, copy) NSString *image;

/**
 *  视频名字
 */
@property (nonatomic, copy) NSString *name;

/**
 *  视频的播放路径
 */
@property (nonatomic, copy) NSString *url;

+ (instancetype)videoWithDict:(NSDictionary *)dict;
@end
