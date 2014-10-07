#import <Foundation/Foundation.h>

/*
 计算器类
 方法：
 1>返回π
 2>计算某个整数的平方
 3>计算两个整数的和
 */
@interface JiSuanQi : NSObject
- (double)pi;
// OC方法中，一个参数对应一个冒号
- (int)pingFang:(int)num;
//- (int)sum:(int)num1 : (int)num2;
// 方法名：sumWithNum1:andNum2:
- (int)sumWithNum1:(int)num1 andNum2:(int)num2;
@end

@implementation JiSuanQi
- (double)pi
{
    return 3.14;
}
- (int)pingFang:(int)num
{
    return num*num;
}
/*
- (int)sum:(int)num1 : (int)num2
{
    return num1 + num2;
}
 */
- (int)sumWithNum1:(int)num1 andNum2:(int)num2
{
    return num1 + num2;
}
@end

int main()
{
    JiSuanQi *jsq = [JiSuanQi new];
    double a = [jsq pi];
    NSLog(@"%f",a);
    
    int b = [jsq pingFang:10];
    NSLog(@"%d",b);
    
    //int c = [jsq sum:2:3];
    int c = [jsq sumWithNum1:2 andNum2:3];
    NSLog(@"%d",c);
    return 0;
}