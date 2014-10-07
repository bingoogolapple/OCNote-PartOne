//
//  ViewController.h
//  Hello
//
//  Created by bingoogol on 14-6-4.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
// UI元素一般用assign即可
@property (nonatomic,weak) IBOutlet UITextField *qq;
@property (nonatomic,weak) IBOutlet UITextField *pwd;

@property (nonatomic,weak) IBOutlet UITextField *number1;
@property (nonatomic,weak) IBOutlet UITextField *number2;
@property (nonatomic,weak) IBOutlet UILabel *result;

// IBAction其实就是void，IBAction可以让方法名显示到右击列表中
- (IBAction) login:(id)sender;


- (IBAction) calculator:(id)sender;


- (IBAction)indexChange:(UISegmentedControl *)sender;

@end

