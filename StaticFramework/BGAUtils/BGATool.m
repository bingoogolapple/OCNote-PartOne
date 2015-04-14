//
//  BGATool.m
//  StaticLibrary
//
//  Created by bingoogol on 15/4/13.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGATool.h"

@implementation BGATool
+ (int)sumWithNum1:(int)num1 andNum2:(int)num2 {
    return num1 + num2;
}

+ (UIImage *)loadLogoImage {
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"touxiang.jpg" ofType:nil inDirectory:@"BGATool.bundle"];
    return [UIImage imageWithContentsOfFile:imagePath];
}
@end
