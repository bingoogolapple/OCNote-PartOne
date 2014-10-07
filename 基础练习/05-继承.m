#import <Foundation/Foundation.h>
/*Animal的声明*/
@interface Animal : NSObject
{
    int _age;
    int _weight;
}
- (void)setAge:(int)age;
- (int)age;

- (void)setWeight:(int)weight;
- (int)weight;
@end

/*Animal的实现*/
@implementation Animal
- (void)setAge:(int)age
{
    _age = age;
}
- (int)age
{
    return _age;
}

- (void)setWeight:(int)weight
{
    _weight = weight;
}
- (int)weight
{
    return _weight;
}
@end

@interface Cat : Animal
@end
@implementation Cat
@end

@interface Dog : Animal
@end
@implementation Dog
@end



int main()
{
    Dog *d = [Dog new];
    [d setWeight:10];
    NSLog(@"%d",[d weight]);
    return 0;
}
