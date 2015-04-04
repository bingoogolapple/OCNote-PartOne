//
//  BGAStudent.m
//  归档
//
//  Created by iqeggandroid on 15/4/4.
//  Copyright (c) 2015年 iqeggandroid. All rights reserved.
//

#import "BGAStudent.h"

@implementation BGAStudent

- (instancetype)initWithCoder:(NSCoder *)coder
{
    // 如果父类有initWithCoder方法，要先调用父类的initWithCoder方法
    self = [super initWithCoder:coder];
    if (self) {
        NSLog(@"initWithCoder BGAStudent");
        self.weight = [coder decodeFloatForKey:@"weight"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [super encodeWithCoder:coder];
    NSLog(@"encodeWithCoder BGAStudent");
    [coder encodeFloat:self.weight forKey:@"weight"];
}
@end
