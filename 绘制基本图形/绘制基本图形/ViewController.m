//
//  ViewController.m
//  绘制基本图形
//
//  Created by bingoogol on 15/3/9.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "ViewController.h"
#import "BGADownloadProgressView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet BGADownloadProgressView *downloadPV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)valueChanged:(UISlider *)sender {
    self.downloadPV.progress = sender.value;
    
}

@end
