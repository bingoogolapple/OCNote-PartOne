//
//  ViewController.m
//  PickerView国旗
//
//  Created by bingoogol on 15/3/4.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "ViewController.h"
#import "BGACountry.h"
#import "BGACountryView.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic,strong) NSArray *countrys;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (NSArray *)countrys {
    if(_countrys == nil) {
        NSString *fullPath = [[NSBundle mainBundle] pathForResource:@"flags.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:fullPath];
        
        NSMutableArray *models = [NSMutableArray arrayWithCapacity:dictArray.count];
        for (NSDictionary *dict in dictArray) {
            BGACountry *country = [BGACountry countryWithDictionary:dict];
            [models addObject:country];
        }
        _countrys = models;
    }
    return _countrys;
}

#pragma - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.countrys.count;
}

#pragma - UIPickerViewDelegate
// 当系统调用该方法的时候会自动传入可重用的view
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    BGACountryView *countryView = (BGACountryView *)view;
    if(view == nil) {
        countryView = [BGACountryView countryView];
    }
    
    NSLog(@"%p %p", countryView, view);
    countryView.country = self.countrys[row];
    return countryView;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return [BGACountryView rowHeight];
}


@end