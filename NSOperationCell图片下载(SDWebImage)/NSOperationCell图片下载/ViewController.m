//
//  ViewController.m
//  NSOperationCell图片下载
//
//  Created by iqeggandroid on 15/4/12.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "ViewController.h"
#import "BGAApp.h"
#import "UIImageView+WebCache.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *apps;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (NSMutableArray *)apps {
    if(!_apps) {
        // 加载plist
        NSString *file = [[NSBundle mainBundle] pathForResource:@"apps" ofType:@"plist"];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:file];
        // 字典转模型
        NSMutableArray *appArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            BGAApp *app = [BGAApp appWithDict:dict];
            [appArray addObject:app];
        }
        _apps = appArray;
    }
    return _apps;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.apps.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"app";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    BGAApp *app = self.apps[indexPath.row];
    cell.textLabel.text = app.name;
    cell.detailTextLabel.text = app.download;
    
    NSURL *url = [NSURL URLWithString:app.icon];
    UIImage *placeholderImage = [UIImage imageNamed:@"placeholder"];
//    [cell.imageView sd_setImageWithURL:url placeholderImage:placeholderImage];
    
    SDWebImageOptions options = SDWebImageRetryFailed | SDWebImageLowPriority;
    [cell.imageView sd_setImageWithURL:url placeholderImage:placeholderImage options:options progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        // 这个block可能会被调用多次
        NSLog(@"下载进度：%f", (double)receivedSize / expectedSize);
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        NSLog(@"----图片加载完毕---%@", image);
    }];
    
    // SDWebImage默认缓存时间是1周
    return cell;
}

@end