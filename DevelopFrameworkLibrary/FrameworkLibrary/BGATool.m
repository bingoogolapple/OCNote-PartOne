//
//  BGATool.m
//  DebugALibrary
//
//  Created by bingoogol on 16/4/22.
//  Copyright © 2016年 bingoogolapple. All rights reserved.
//

#import "BGATool.h"

@implementation BGATool

+ (int)sumWithNum1:(int)num1 andNum2:(int)num2 {
    return num1 + num2;
}

+ (UIImage *)loadAvatarImage {
//    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"images/avatar.png" ofType:nil inDirectory:@"BGATool.bundle"];
//    return [UIImage imageWithContentsOfFile:imagePath];
    
//    return [UIImage imageNamed:@"BGATool.bundle/images/avatar.png"];
    
    return [BGATool imageFromBundleWithName:@"images/avatar"];
}


+ (UIImage *)imageFromBundleWithName:(NSString *)name {
    id image = [UIImage imageWithContentsOfFile:[BGATool resourceWithName:name]];
    if (image) {
        return image;
    } else {
        return [UIImage imageWithContentsOfFile:[[BGATool resourceWithName:name] stringByAppendingString:@".png"]];
    }
}

+ (NSString*)resourceWithName:(NSString*)fileName {
    NSBundle *bgaToolBundle = [NSBundle bundleForClass:[BGATool class]];
    NSString * fileRootPath = [[bgaToolBundle bundlePath] stringByAppendingString:@"/BGATool.bundle"];
    NSString * filePath = [fileRootPath stringByAppendingString:[NSString stringWithFormat:@"/%@", fileName]];
    return filePath;
}

@end
