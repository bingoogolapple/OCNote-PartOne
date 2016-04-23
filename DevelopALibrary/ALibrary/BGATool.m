//
//  BGATool.m
//  DebugALibrary
//
//  Created by bingoogol on 16/4/22.
//  Copyright © 2016年 bingoogolapple. All rights reserved.
//

#import "BGATool.h"

@implementation BGATool

+ (int)sumWithNum1:(int)num1 andNum2:(int)num2 {
    return num1 + num2;
}

+ (UIImage *)loadAvatarImage {
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"avatar.png" ofType:nil inDirectory:@"BGATool.bundle"];
    return [UIImage imageWithContentsOfFile:imagePath];
    
//    return [UIImage imageNamed:@"BGATool.bundle/avatar.png"];
}

@end
