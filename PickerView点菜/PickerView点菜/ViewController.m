//
//  ViewController.m
//  PickerView点菜
//
//  Created by bingoogol on 15/3/2.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDataSource, UIPickerViewDelegate>

/**
 * 所有食物
 */
@property (nonatomic, strong) NSArray *foods;
@property (weak, nonatomic) IBOutlet UILabel *fruitLabel;
@property (weak, nonatomic) IBOutlet UILabel *stapleLabel;
@property (weak, nonatomic) IBOutlet UILabel *drinkLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;


- (IBAction)randomFood:(UIButton *)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for (int component = 0; component < self.foods.count; component++) {
        [self pickerView:self.pickerView  didSelectRow:0 inComponent:component];
    }
}

#pragma mark - UIPickerViewDataSource
// 返回pickerView一共有多少列
- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return self.foods.count;
}

// 返回pickerView的第component列有多少行
- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSArray *subFoods = self.foods[component];
    return subFoods.count;
}

#pragma mark - UIPickerViewDelegate
// 返回第component列的第row行显示什么内容
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSArray *subFoods = self.foods[component];
    return subFoods[row];
}

// 只有通过手指选中某一行的时候才会调用
- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSString *name = self.foods[component][row];
    if (0 == component) {
        self.fruitLabel.text = name;
    } else if(1 == component) {
        self.stapleLabel.text = name;
    } else {
        self.drinkLabel.text = name;
    }
}

#pragma mark - 懒加载
- (NSArray *)foods {
    if (_foods == nil) {
        NSString *fullPath = [[NSBundle mainBundle] pathForResource:@"foods.plist" ofType:nil];
        _foods = [NSArray arrayWithContentsOfFile:fullPath];
    }
    return _foods;
}

- (IBAction)randomFood:(UIButton *)sender {
    // - (id)objectAtIndex:(NSUInteger)index; 返回的事id类型
//    [self.foods objectAtIndex:0] == self.foods[0];
    // 下面这行能编译通过
//    [self.foods[0] count];
    // 下面这行编译不能通过，Property 'count' not found on object of type 'id'
//    self.foods[0].count;

    for (int component = 0; component < self.foods.count; component++) {
        int total = [self.foods[component] count];
        int row = arc4random() % total;
        int preRow = [self.pickerView selectedRowInComponent:component];
        while (row == preRow) {
            row = arc4random() % total;
        }
        
        // 该方法执行后不会触发- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component方法
        [self.pickerView selectRow:row inComponent:component animated:true];
        
        // 需要通过代码选中某一行
        [self pickerView:self.pickerView didSelectRow:row inComponent:component];
    }
    
}
@end