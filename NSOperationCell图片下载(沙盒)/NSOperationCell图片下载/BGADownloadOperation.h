//
//  BGADownloadOperation.h
//  NSOperationCell图片下载
//
//  Created by iqeggandroid on 15/4/12.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class BGADownloadOperation;

@protocol BGADownloadOperationDelegate <NSObject>
@optional
- (void)downloadOperation:(BGADownloadOperation *)operation didFinishDownload:(UIImage *)image;
@end

@interface BGADownloadOperation : NSOperation

@property (nonatomic, copy) NSString *imgUrl;
@property (nonatomic, assign) id<BGADownloadOperationDelegate> delegate;
@property (nonatomic, strong) NSIndexPath *indexPath;

@end