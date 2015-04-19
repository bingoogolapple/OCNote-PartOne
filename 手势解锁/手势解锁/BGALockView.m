//
//  BGALockView.m
//  手势解锁
//
//  Created by iqeggandroid on 15/4/9.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGALockView.h"

@interface BGALockView()

@property (nonatomic, strong) NSMutableArray *selectedBtns;
// 当前手指移动所在位置
@property (nonatomic, assign) CGPoint moveP;

@end

@implementation BGALockView

// 手动创建时会调用该方法
-(instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        NSLog(@"%s", __func__);
    }
    return self;
}

// 解析xib的时候调用
-(id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        NSLog(@"%s", __func__);
        [self addBtns];
    }
    return self;
}

// 加载xib完成后会调用该方法
-(void)awakeFromNib {
    NSLog(@"%s", __func__);
}

-(void)addBtns {
    for (int i = 0; i < 9; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        [button setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
        // 不允许用户交互
        button.userInteractionEnabled = NO;
        [self addSubview:button];
    }
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat row = 0;
    CGFloat col = 0;
    CGFloat btnW = 74;
    CGFloat btnH = 74;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    
    int totalCol = 3;
    CGFloat margin = (self.bounds.size.width - totalCol * btnW)/(totalCol + 1);
    
    for (int i = 0; i < self.subviews.count; i++) {
        UIButton *button = self.subviews[i];
        row = i / 3;
        col = i % 3;
        btnX = margin + (margin + btnW) * col;
        //        btnY = margin + (margin + btnH) * row;
        btnY = (margin + btnH) * row;
        button.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
}

-(CGPoint)pointWithTouches:(NSSet *)touches {
    UITouch *touch = [touches anyObject];
    return [touch locationInView:self];
}

//-(UIButton *)buttonWithPoint:(CGPoint)point {
//    for (UIButton *btn in self.subviews) {
//        // 要用frame，使其在同一个坐标系中，不能用bounds
//        if(CGRectContainsPoint(btn.frame, point)) {
//            return btn;
//        }
//    }
//    return nil;
//}

-(UIButton *)buttonWithPoint:(CGPoint)point {
    CGFloat wh = 30;
    
    for (UIButton *btn in self.subviews) {
        CGFloat x = btn.center.x - wh * 0.5;
        CGFloat y = btn.center.y - wh * 0.5;
        CGRect frame = CGRectMake(x, y, wh, wh);
        // 要用frame，使其在同一个坐标系中，不能用bounds
        if(CGRectContainsPoint(frame, point)) {
            return btn;
        }
    }
    return nil;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    
    // 当前触摸点
    CGPoint pos = [self pointWithTouches:touches];
    
    // 获取触摸按钮
    UIButton *btn = [self buttonWithPoint:pos];
    if (btn && !btn.selected) {
        btn.selected = YES;
        [self.selectedBtns addObject:btn];
        NSLog(@"在按钮上");
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    // 当前触摸点
    self.moveP = [self pointWithTouches:touches];
    
    // 获取触摸按钮
    UIButton *btn = [self buttonWithPoint:self.moveP];
    if (btn && !btn.selected) {
        btn.selected = YES;
        [self.selectedBtns addObject:btn];
        NSLog(@"在按钮上");
    }
    
    // 重绘
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSMutableString *result = [NSMutableString string];
    for (UIButton *button in self.selectedBtns) {
        [result appendFormat:@"%d", button.tag];
    }
    NSLog(@"result = %@", result);
    
    
    // 取消所有按钮的选中状态
    [self.selectedBtns makeObjectsPerformSelector:@selector(setSelected:) withObject:NO];
    // 清空所有选中按钮
    [self.selectedBtns removeAllObjects];
    [self setNeedsDisplay];
}

-(NSMutableArray *)selectedBtns {
    if(!_selectedBtns) {
        _selectedBtns = [NSMutableArray array];
    }
    return _selectedBtns;
}

-(void)drawRect:(CGRect)rect {
    if (!self.selectedBtns.count) {
        return;
    }
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    // 所有选中按钮都连线
    for (int i = 0; i < self.selectedBtns.count; i++) {
        UIButton *btn = self.selectedBtns[i];
        if (i == 0) {
            [path moveToPoint:btn.center];
        } else {
            [path addLineToPoint:btn.center];
        }
    }
    [path addLineToPoint:self.moveP];
    
    [[UIColor greenColor] setStroke];
    path.lineWidth = 8;
    path.lineJoinStyle = kCGLineCapRound;
    path.lineCapStyle = kCGLineCapRound;
    [path stroke];
}

@end