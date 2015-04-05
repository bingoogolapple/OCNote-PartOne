//
//  ViewController.m
//  Autorezing
//
//  Created by iqeggandroid on 15/4/5.
//  Copyright (c) 2015年 iqeggandroid. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *testView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     // 注意：代码中的约束和storyboard中是相反
     UIViewAutoresizingNone
     UIViewAutoresizingFlexibleLeftMargin
     UIViewAutoresizingFlexibleWidth
     UIViewAutoresizingFlexibleRightMargin
     UIViewAutoresizingFlexibleTopMargin
     UIViewAutoresizingFlexibleHeight
     UIViewAutoresizingFlexibleBottomMargin
     */

    self.testView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
}


@end
