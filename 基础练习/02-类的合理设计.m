#import <Foundation/Foundation.h>
/*
 学生
 成员变量：性别、生日、体重、最喜欢的颜色、狗(体重，毛色，吃，跑)
 方法：吃、跑步、遛狗(让狗跑)、喂狗（让狗吃）
 */

// 枚举常量的名称通常已枚举类型名开头
typedef enum {
    SexMan,SexWoman
} Sex;
typedef struct {
    int year;
    int month;
    int day;
} Date;
typedef enum {
    ColorBlack,ColorRed,ColorGreen
} Color;

@interface Dog : NSObject
{
    @public
    double weight; //体重
    Color curColor; //毛色
}
- (void)eat;
- (void)run;
@end
@implementation Dog
- (void)eat
{
    // 每吃一次，体重就加1
    weight += 1;
    NSLog(@"吃完这次后狗的体重是%f",weight);
}
- (void)run
{
    // 没跑一次，体重减1
    weight -= 1;
    NSLog(@"跑完这次后狗的体重是%f",weight);
}
@end


@interface Student : NSObject
{
    @public
    Sex sex; // 性别
    Date birthday; //生日
    double weight; //体重（kg）
    Color favColor; //最喜欢的颜色
    char *name;
    Dog *dog;
}
- (void)eat;
- (void)run;
- (void)print;
- (void)liuDog;
- (void)weiDog;
@end

@implementation Student

- (void)eat
{
    // 每吃一次，体重就加1
    weight += 1;
    NSLog(@"吃完这次后学生的体重是%f",weight);
}
- (void)run
{
    // 没跑一次，体重减1
    weight -= 1;
    NSLog(@"跑完这次后学生的体重是%f",weight);
}
- (void)print
{
    NSLog(@"性别=%d，喜欢的颜色=%d，姓名=%s，生日=%d-%d-%d",sex,favColor,name,birthday.year,birthday.month,birthday.day);
}
- (void)liuDog
{
    [dog run];
}
- (void)weiDog
{
    [dog eat];
}
@end

int main()
{
    Student *s = [Student new];
    s->weight = 50;
    // 性别
    s->sex = SexMan;
    // 生日
    //s->birthday = {2011,9,10}; 错误写法
    //大括号初始化只能使用这种方式 Date d= {2011,9,10};
    /*
     Date d= {2011,9,10};
     s->birthday = d;
     */
    s->birthday.year = 2011;
    s->birthday.month = 10;
    s->birthday.day = 9;
    s->name = "bingo";
    //喜欢的颜色
    s->favColor = ColorBlack;
    
    Dog *d = [Dog new];
    d->curColor = ColorGreen;
    d->weight = 20;
    
    s->dog = d;
    
    [s liuDog];
    [s weiDog];
    
    [s print];
    return 0;
}


void test()
{
    Student *s = [Student new];
    s->weight = 50;
    // 性别
    s->sex = SexMan;
    // 生日
    //s->birthday = {2011,9,10}; 错误写法
    //大括号初始化只能使用这种方式 Date d= {2011,9,10};
    /*
     Date d= {2011,9,10};
     s->birthday = d;
     */
    s->birthday.year = 2011;
    s->birthday.month = 10;
    s->birthday.day = 9;
    s->name = "bingo";
    //喜欢的颜色
    s->favColor = ColorBlack;
    
    /*
     [s eat];
     [s eat];
     [s run];
     [s run];
     */
    [s print];
}