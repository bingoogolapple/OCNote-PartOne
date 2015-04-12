//
//  BGADownloadOperation.m
//  NSOperationCell图片下载
//
//  Created by iqeggandroid on 15/4/12.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGADownloadOperation.h"

@implementation BGADownloadOperation

// 当operation被添加到queue中后，会自动调用该方法（注意：自定义Operation时需要自己创建自动释放池）
- (void)main {
    @autoreleasepool {
        if (self.isCancelled) return;
        
        NSURL *url = [NSURL URLWithString:self.imgUrl];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        
        if (self.isCancelled) return;
        
        // 下载完图片，回到主线程
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            if ([self.delegate respondsToSelector:@selector(downloadOperation:didFinishDownload:)]) {
                [self.delegate downloadOperation:self didFinishDownload:image];
            }
        }];
    }
}

@end