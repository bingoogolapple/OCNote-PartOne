//
//  BGATool.m
//  BGATool
//
//  Created by bingoogol on 15/4/13.
//  Copyright (c) 2015年 bingoogolapple. All rights reserved.
//

#import "BGATool.h"

// Build Phases中的Copy Files中添加头文件

// 注意, 静态库并不会将资源打包进入, 如果静态库中用到了其它资源, 必须手动的导入
// 开发技巧, 不建议大家直接导入资源

// 真机文件夹下得静态库只能用于真机上, 模拟器文件夹下得静态库只能用于模拟器下

// 可以借助 lipo -info 静态库文件地址 指令查看当前静态库支持的平台
// 可以借助 lipo -create libdev/lib08-staticDemo.a  libPro/lib08-staticDemo.a  -output HMTool.a 指令将模拟器和真机的静态库合并为一个静态库
//  lipo -create 需要合并的静态库1 需要合并的静态库2 -output 合并之后的文件名称

// 注意: 虽然将真机和模拟器的静态库合并在一起之后, 以后我们就不用关心当前是允许在模拟器还是真机了, 但是如果在程序发布时还是建议大家使用真机的静态库. 小
@implementation BGATool
+ (int)sumWithNum1:(int)num1 andNum2:(int)num2 {
    return num1 + num2;
}

+ (UIImage *)loadLogoImage {
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"touxiang.jpg" ofType:nil inDirectory:@"BGATool.bundle"];
    return [UIImage imageWithContentsOfFile:imagePath];
}

@end