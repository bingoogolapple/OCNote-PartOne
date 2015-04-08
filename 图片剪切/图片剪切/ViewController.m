//
//  ViewController.m
//  图片剪切
//
//  Created by bingoogol on 15/3/15.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Tool.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.image = [UIImage imageWithName:@"me" border:5 borderColor:[UIColor blueColor]];
    
    
     NSData *data = UIImagePNGRepresentation([UIImage imageWithCaptureView:self.view]);
    [data writeToFile:@"/Users/iqeggandroid/test.png" atomically:YES];
}

@end
