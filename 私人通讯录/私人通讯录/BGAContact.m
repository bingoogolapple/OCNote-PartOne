//
//  BGAContact.m
//  私人通讯录
//
//  Created by iqeggandroid on 15/4/4.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGAContact.h"

@implementation BGAContact
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.name = [coder decodeObjectForKey:@"name"];
        self.phone = [coder decodeObjectForKey:@"phone"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.phone forKey:@"phone"];
}
@end