//
//  BGABook.h
//  归档
//
//  Created by iqeggandroid on 15/4/4.
//  Copyright (c) 2015年 iqeggandroid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BGABook : NSObject<NSCoding>
@property (nonatomic, copy)NSString *name;
@property (nonatomic, assign)int price;
@end
