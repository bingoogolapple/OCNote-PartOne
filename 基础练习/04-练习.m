/*
 设计一个方法，用来和其他比较车速，返回车速的差距
 */

#import <Foundation/Foundation.h>

@interface Car : NSObject
{
    @public
    int speed;
}
- (int)compareSpeedWithOther:(Car *)other;
@end

@implementation Car
- (int)compareSpeedWithOther:(Car *)other
{
    return speed - other->speed;
}
@end

int main()
{
    Car *car1 = [Car new];
    car1->speed = 300;
    Car *car2 = [Car new];
    car2->speed = 280;
    int a = [car2 compareSpeedWithOther:car1];
    NSLog(@"%d",a);
}