//
//  ViewController.m
//  PickerView城市选择
//
//  Created by bingoogol on 15/3/3.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "ViewController.h"
#import "BGAProvince.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (nonatomic,strong) NSArray *provinces;

@property (nonatomic,weak) UIPickerView *pickerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    pickerView.dataSource = self;
    pickerView.delegate = self;
    [self.view addSubview:pickerView];
    self.pickerView = pickerView;
}

- (NSArray *)provinces {
    if(_provinces == nil) {
        NSString *fullPath = [[NSBundle mainBundle] pathForResource:@"cities" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:fullPath];
        NSMutableArray *models = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dict in array) {
            BGAProvince *province = [BGAProvince provinceWithDictionary:dict];
            [models addObject:province];
        }
        _provinces = [models copy];
    }
    return _provinces;
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if(0 == component) {
        // 省份的行数
        return self.provinces.count;
    } else {
        // 当前选中省份
        NSInteger selectIndex = [self.pickerView selectedRowInComponent:0];
        BGAProvince *province = self.provinces[selectIndex];
        return province.cities.count;
    }
    
}

#pragma mark - UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if(0 == component) {
        // 省份
        BGAProvince *province = self.provinces[row];
        return province.name;
    } else {
        // 当前选中省份
        NSInteger selectIndex = [self.pickerView selectedRowInComponent:0];
        BGAProvince *province = self.provinces[selectIndex];
        return province.cities[row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if(0 == component) {
        NSLog(@"省份变化");
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:true];
        [self pickerView:self.pickerView didSelectRow:0 inComponent:1];
    } else {
        NSInteger selectIndex = [self.pickerView selectedRowInComponent:0];
        BGAProvince *province = self.provinces[selectIndex];
        NSLog(@"选中 %@ %@",province.name,province.cities[row]);
    }
}
@end