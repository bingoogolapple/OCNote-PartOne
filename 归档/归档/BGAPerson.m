//
//  BGAPerson.m
//  归档
//
//  Created by iqeggandroid on 15/4/4.
//  Copyright (c) 2015年 iqeggandroid. All rights reserved.
//

#import "BGAPerson.h"

@implementation BGAPerson

// 当将一个自定义对象保存到文件的时候就会调用该方法，在该方法中说明如何存储自定义对象的属性
- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        NSLog(@"initWithCoder BGAPerson");
        self.name = [coder decodeObjectForKey:@"name"];
        self.age = [coder decodeIntForKey:@"age"];
        self.height = [coder decodeDoubleForKey:@"height"];
        self.book = [coder decodeObjectForKey:@"book"];
    }
    return self;
}

// 当从文件中读取一个对象的时候就会调用该方法，在该方法中说明如何读取保存在文件中的对象
- (void)encodeWithCoder:(NSCoder *)coder {
    NSLog(@"encodeWithCoder BGAPerson");
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeInt:self.age forKey:@"age"];
    [coder encodeDouble:self.height forKey:@"height"];
    [coder encodeObject:self.book forKey:@"book"];
}
@end
