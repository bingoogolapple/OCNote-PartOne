//
//  BGAWheelView.m
//  星座转盘
//
//  Created by bingoogol on 15/4/20.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGAWheelView.h"
#import "BGAWheelButton.h"

#define angle2radian(x) ((x) / 180.0 * M_PI)

@interface BGAWheelView()
@property (weak, nonatomic) IBOutlet UIImageView *rotationView;



@property (weak, nonatomic) BGAWheelButton *selectedButton;

@property (nonatomic, strong) CADisplayLink *link;
@end

@implementation BGAWheelView

+ (instancetype)wheelView {
    return [[NSBundle mainBundle] loadNibNamed:@"BGAWheelView" owner:nil options:nil][0];
}

// 还没有连好线
- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        // rotationView为nil
        NSLog(@"%s-%@", __func__, self.rotationView);
    }
    return self;
}

// 已经连好线了
- (void)awakeFromNib {
    NSLog(@"%s-%@", __func__, self.rotationView);
    // 设置图片允许用户交互，否则图片中的子控件不能处理用户点击事件
    self.rotationView.userInteractionEnabled = YES;
    
    // 裁剪的大图
    UIImage *bigImage = [UIImage imageNamed:@"LuckyAstrology"];
    UIImage *bigSelectedImage = [UIImage imageNamed:@"LuckyAstrologyPressed"];
    // 图片的尺寸
    CGFloat imageW = 40 * [UIScreen mainScreen].scale;
    CGFloat imageH = 47 * [UIScreen mainScreen].scale;
    
    for (int i = 0; i < 12; i++) {
        BGAWheelButton *button = [BGAWheelButton buttonWithType:UIButtonTypeCustom];
        button.layer.anchorPoint = CGPointMake(0.5, 1);
        button.layer.position = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
        
        button.layer.transform = CATransform3DMakeRotation(angle2radian(i * 30), 0, 0, 1);
        
        button.bounds = CGRectMake(0, 0, 68, 143);
        [button setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
        
        CGRect clipRect = CGRectMake(i * imageW, 0, imageW, imageH);
        CGImageRef smallImage = CGImageCreateWithImageInRect(bigImage.CGImage, clipRect);
        [button setImage:[UIImage imageWithCGImage:smallImage] forState:UIControlStateNormal];
        
        CGImageRef smallSelectedImage = CGImageCreateWithImageInRect(bigSelectedImage.CGImage, clipRect);
        [button setImage:[UIImage imageWithCGImage:smallSelectedImage] forState:UIControlStateSelected];
        
        [button addTarget:self action:@selector(onClickBtn:) forControlEvents:UIControlEventTouchDown];
        
        [self.rotationView addSubview:button];
        
        if (i == 0) {
            [self onClickBtn:button];
        }
    }
}

- (void)onClickBtn:(BGAWheelButton *)button {
    NSLog(@"%s", __func__);
    self.selectedButton.selected = NO;
    
    self.selectedButton = button;
    self.selectedButton.selected = YES;
}

- (void)startRotating {
    self.link.paused = NO;
}

- (CADisplayLink *)link {
    if(_link == nil) {
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
        [_link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
    return _link;
}

- (void)update {
    self.rotationView.transform = CGAffineTransformRotate(self.rotationView.transform, angle2radian(45 / 60.0));
}

- (void)stopRotating {
    self.link.paused = YES;
}

- (IBAction)startSelect:(UIButton *)sender {
    self.rotationView.userInteractionEnabled = NO;
    [self stopRotating];
    
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.rotation";
    anim.toValue = @(M_PI * 2 * 3);
    anim.duration = 1;
    anim.delegate = self;
    
    [self.rotationView.layer addAnimation:anim forKey:nil];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    self.rotationView.userInteractionEnabled = YES;
    
    // 让选中按钮回到最上面的中间位置
    CGFloat angle = atan2(self.selectedButton.transform.b, self.selectedButton.transform.a);
    // 把转盘反向旋转选中按钮当前旋转的角度
    self.rotationView.transform = CGAffineTransformMakeRotation(-angle);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self startRotating];
    });
}


@end