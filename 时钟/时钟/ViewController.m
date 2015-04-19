//
//  ViewController.m
//  时钟
//
//  Created by bingoogol on 15/4/19.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "ViewController.h"

// 每秒秒针旋转6度
#define PERSECONDA 6
// 每分钟分针转6度
#define PERMINUTEA 6
// 每小时转30度
#define PERHOUR 30
// 每分钟时针转0.5度
#define PERMINUTEHOURA 0.5


// 角度转弧度，一个参数对应一个括号，结尾也要对应一个括号
#define angle2radian(x) ((x) / 180.0 * M_PI)

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *clockView;
@property (weak, nonatomic) CALayer *secondLayer;
@property (weak, nonatomic) CALayer *minuteLayer;
@property (weak, nonatomic) CALayer *hourLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSecondLayer];
    [self addMinuteLayer];
    [self addHourLayer];
    
    [self update];
}

- (void)addSecondLayer {
    CGFloat clockW = _clockView.bounds.size.width;
    CGFloat clockH = _clockView.bounds.size.height;
    
    CALayer *secondLayer = [CALayer layer];
    secondLayer.anchorPoint = CGPointMake(0.5, 1);
    secondLayer.position = CGPointMake(clockW * 0.5, clockH * 0.5);
    secondLayer.bounds = CGRectMake(0, 0, 1, clockH * 0.5 - 20);
    secondLayer.backgroundColor = [[UIColor redColor] CGColor];
    [self.clockView.layer addSublayer:secondLayer];
    self.secondLayer = secondLayer;
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(update) userInfo:nil repeats:YES];
}

- (void)addMinuteLayer {
    CGFloat clockW = _clockView.bounds.size.width;
    CGFloat clockH = _clockView.bounds.size.height;
    
    CALayer *minuteLayer = [CALayer layer];
    minuteLayer.anchorPoint = CGPointMake(0.5, 1);
    minuteLayer.position = CGPointMake(clockW * 0.5, clockH * 0.5);
    minuteLayer.bounds = CGRectMake(0, 0, 2, clockH * 0.5 - 40);
    minuteLayer.backgroundColor = [[UIColor blackColor] CGColor];
    minuteLayer.cornerRadius = 2;
    [self.clockView.layer addSublayer:minuteLayer];
    self.minuteLayer = minuteLayer;
    [NSTimer scheduledTimerWithTimeInterval:60 target:self selector:@selector(update) userInfo:nil repeats:YES];
}

- (void)addHourLayer {
    CGFloat clockW = _clockView.bounds.size.width;
    CGFloat clockH = _clockView.bounds.size.height;
    
    CALayer *hourLayer = [CALayer layer];
    hourLayer.anchorPoint = CGPointMake(0.5, 1);
    hourLayer.position = CGPointMake(clockW * 0.5, clockH * 0.5);
    hourLayer.bounds = CGRectMake(0, 0, 3, clockH * 0.5 - 60);
    hourLayer.backgroundColor = [[UIColor blackColor] CGColor];
    hourLayer.cornerRadius = 3;
    [self.clockView.layer addSublayer:hourLayer];
    self.hourLayer = hourLayer;
    [NSTimer scheduledTimerWithTimeInterval:60 target:self selector:@selector(update) userInfo:nil repeats:YES];
}

- (void)update {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour fromDate:[NSDate date]];
    CGFloat secondA = angle2radian(components.second * PERSECONDA);
    self.secondLayer.transform = CATransform3DMakeRotation(secondA, 0, 0, 1);
    
    CGFloat minuteA = angle2radian(components.minute * PERMINUTEA);
    self.minuteLayer.transform = CATransform3DMakeRotation(minuteA, 0, 0, 1);
    
    CGFloat hourA = angle2radian(components.hour * PERHOUR + components.minute * PERMINUTEHOURA);
    self.hourLayer.transform = CATransform3DMakeRotation(hourA, 0, 0, 1);
    
}


@end
