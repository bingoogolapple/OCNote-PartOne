//
//  BGAWheelView.h
//  星座转盘
//
//  Created by bingoogol on 15/4/20.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BGAWheelView : UIView

+ (instancetype)wheelView;

- (void)startRotating;

- (void)stopRotating;

@end