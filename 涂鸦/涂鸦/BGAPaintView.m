//
//  BGAPaintView.m
//  涂鸦
//
//  Created by iqeggandroid on 15/4/19.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGAPaintView.h"
#import "BGAPaintPath.h"

@interface BGAPaintView()
@property (nonatomic, strong) BGAPaintPath *path;
@property (nonatomic, strong) NSMutableArray *paths;

@end

@implementation BGAPaintView

- (void)drawRect:(CGRect)rect {
    if (!self.paths.count) {
        return;
    }
    
    for (BGAPaintPath *path in self.paths) {
        if ([path isKindOfClass:[UIImage class]]) {
            UIImage *image = (UIImage *)path;
            [image drawAtPoint:CGPointZero];
        } else {
            [path stroke];
        }
    }
}

// 加载xib完成后会调用该方法
-(void)awakeFromNib {
    self.lineWidth = 2;
    self.lineColor = [UIColor blackColor];
}

- (NSMutableArray *)paths {
    if(!_paths) {
        _paths = [NSMutableArray array];
    }
    return _paths;
}

-(CGPoint) pointWithTouches:(NSSet *)touches {
    UITouch *touch = [touches anyObject];
    return [touch locationInView:self];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // 确定起点
    CGPoint currentPoint = [self pointWithTouches:touches];
    self.path = [BGAPaintPath paintPathWithLineWidth:self.lineWidth lineColor:self.lineColor startPoint:currentPoint];
    
    [self.paths addObject:self.path];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    // 确定终点
    CGPoint currentPoint = [self pointWithTouches:touches];
    [self.path addLineToPoint:currentPoint];
    
    [self setNeedsDisplay];
}

-(void)clearScreen {
    [self.paths removeAllObjects];
    [self setNeedsDisplay];
}

-(void)undo {
    [self.paths removeLastObject];
    [self setNeedsDisplay];
}

-(void)setImage:(UIImage *)image {
    _image = image;
    [self.paths addObject:image];
    [self setNeedsDisplay];
}

@end