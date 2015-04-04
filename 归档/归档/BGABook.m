//
//  BGABook.m
//  归档
//
//  Created by iqeggandroid on 15/4/4.
//  Copyright (c) 2015年 iqeggandroid. All rights reserved.
//

#import "BGABook.h"

@implementation BGABook
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        NSLog(@"initWithCoder BGABook");
        self.name = [coder decodeObjectForKey:@"name"];
        self.price = [coder decodeIntForKey:@"price"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    NSLog(@"encodeWithCoder BGABook");
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeInt:self.price forKey:@"price"];
}
@end
