//
//  ViewController.m
//  水印图片
//
//  Created by iqeggandroid on 15/4/8.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *oldImage = [UIImage imageNamed:@"img"];
    
    // 开启上下文
    // size 新的图片大小
    // opaque YES不透明 NO透明
    // scale
    UIGraphicsBeginImageContextWithOptions(oldImage.size, YES, 0.0);
    [oldImage drawAtPoint:CGPointZero];
    
    NSString *text = @"测试文字";
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor redColor]};
    [text drawAtPoint:CGPointMake(100, 100) withAttributes:dict];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    self.imageView.image = newImage;
    
    // 把图片转换成png格式的二进制数据
    NSData *data = UIImagePNGRepresentation(newImage);
    [data writeToFile:@"/Users/iqeggandroid/test.png" atomically:YES];
}


@end
