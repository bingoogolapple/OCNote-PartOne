//
//  ViewController.m
//  归档
//
//  Created by iqeggandroid on 15/4/4.
//  Copyright (c) 2015年 iqeggandroid. All rights reserved.
//

#import "ViewController.h"
#import "BGAPerson.h"
#import "BGAStudent.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)onClickSaveBtn:(id)sender {
    [self test2];
}

- (void)test2 {
    BGABook *book = [[BGABook alloc] init];
    book.name = @"iOS";
    book.price = 10;
    BGAStudent *student = [[BGAStudent alloc] init];
    student.name = @"wanghao";
    student.age = 23;
    student.height = 1.74;
    student.weight = 60;
    student.book = book;
    
    NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    // 扩展名随便写
    NSString *path = [document stringByAppendingPathComponent:@"student.arc"];
    NSLog(@"%@", document);
    [NSKeyedArchiver archiveRootObject:student toFile:path];
}

- (void)test1 {
    BGABook *book = [[BGABook alloc] init];
    book.name = @"iOS";
    book.price = 10;
    BGAPerson *person = [[BGAPerson alloc] init];
    person.name = @"wanghao";
    person.age = 23;
    person.height = 1.74;
    person.book = book;
    
    NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    // 扩展名随便写
    NSString *path = [document stringByAppendingPathComponent:@"person.arc"];
    NSLog(@"%@", document);
    [NSKeyedArchiver archiveRootObject:person toFile:path];
}

- (IBAction)onClickReadBtn:(id)sender {
    [self test22];
}

- (void)test22 {
    NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [document stringByAppendingPathComponent:@"student.arc"];
    BGAStudent *student = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSLog(@"%@ %d %.1f %.1f %@ %d",student.name, student.age, student.height, student.weight, student.book.name, student.book.price);
}

- (void)test11 {
    NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [document stringByAppendingPathComponent:@"person.arc"];
    BGAPerson *person = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSLog(@"%@ %d %.1f %@ %d",person.name, person.age, person.height, person.book.name, person.book.price);
}

@end
