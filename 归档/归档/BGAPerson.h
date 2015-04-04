//
//  BGAPerson.h
//  归档
//
//  Created by iqeggandroid on 15/4/4.
//  Copyright (c) 2015年 iqeggandroid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BGABook.h"
/**
 *  如果想将一个自定义对象保存到文件中，必须实现NSCoding协议
 */
@interface BGAPerson : NSObject<NSCoding>
@property (nonatomic, copy)NSString *name;
@property (nonatomic, assign)int age;
@property (nonatomic, assign)double height;
@property (nonatomic, strong)BGABook *book;
@end