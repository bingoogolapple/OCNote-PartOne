//
//  ViewController.m
//  星座转盘
//
//  Created by bingoogol on 15/4/20.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "ViewController.h"
#import "BGAWheelView.h"

@interface ViewController ()

@property (nonatomic, weak) BGAWheelView *wheelView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BGAWheelView *wheelView = [BGAWheelView wheelView];
    wheelView.center = self.view.center;
    [self.view addSubview:wheelView];
    self.wheelView = wheelView;
}

- (IBAction)start {
    [self.wheelView startRotating];
}

- (IBAction)stop {
    [self.wheelView stopRotating];
}

@end
