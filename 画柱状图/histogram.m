//
//  histogram.m
//  画柱状图
//
//  Created by 上海均衡 on 2017/1/20.
//  Copyright © 2017年 上海均衡. All rights reserved.
//

#import "histogram.h"

@implementation histogram

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

*/
- (void)drawRect:(CGRect)rect {
    // Drawing code
    NSArray *arr=@[@25,@25,@50];
    CGFloat x=0;
    CGFloat y=0;
    CGFloat width=0;
    CGFloat height=0;
    
    for (int i=0; i<arr.count; i++) {
        width=rect.size.width/(2*arr.count-1);
        x=2 * width * i;
        height=[arr[i] floatValue]/100.0 * rect.size.height;
        y=rect.size.height-height;
        UIBezierPath *path=[UIBezierPath bezierPathWithRect:CGRectMake(x, y, width, height)];
        [[self setEveryColor] set];
        [path fill];
    }
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self setNeedsDisplay];
}
#pragma mark 设置每个区域颜色随机
-(UIColor *)setEveryColor{
    CGFloat red=arc4random_uniform(256)/255.0;
    CGFloat green=arc4random_uniform(256)/255.0;
    CGFloat blue=arc4random_uniform(256)/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1];
}
@end
