//
//  CycleViewForLaoZhao.m
//  CycleDemo
//
//  Created by zhangrongwu on 2018/8/14.
//  Copyright © 2018年 ENN. All rights reserved.
//

#import "CycleViewForLaoZhao.h"

@implementation CycleViewForLaoZhao

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

-(void)createCycleItems {
    NSMutableArray *list = [[NSMutableArray alloc] init];
    for (int index=0 ; index <= 60; index++) {
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(0, 0, 5, 5);
        label.layer.cornerRadius = 2.5;
        label.layer.masksToBounds = YES;
        label.backgroundColor = [UIColor redColor];
        [list addObject:label];
        [self addSubview:label];
    }
    NSMutableArray *array = [[NSMutableArray alloc] init];
    CGFloat p1 =  2.0 *M_PI / list.count;
    for (NSInteger i = 0; i < list.count; i ++) {
        UILabel *label = list[i];
        CGFloat d =i*p1;
        label.center = [self getPointWithAngele:d];
        NSDictionary *dict = @{@"x":[NSNumber numberWithFloat:label.frame.origin.x],
                               @"y":[NSNumber numberWithFloat:label.frame.origin.y]};
        [array addObject:dict];
    }
    
    UILabel *bigLabel = [[UILabel alloc] init];
    bigLabel.backgroundColor = [UIColor redColor];
    bigLabel.frame = CGRectMake(0, 0, 10, 10);
    bigLabel.layer.cornerRadius = 5;
    bigLabel.layer.masksToBounds = YES;
    // 修改该数据可进行 i 处理默认点从哪个地方开始 0 < i < 60
    __block int i = 30;
    bigLabel.center = CGPointMake([array[i][@"x"] intValue] + 2, [array[i][@"y"] intValue] + 2);
    [self addSubview:bigLabel];
    [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        i++;
        if (i > 60) {
            i = 0;
        }
        [UIView animateWithDuration:0.2 animations:^{
            bigLabel.center = CGPointMake([array[i][@"x"] intValue] + 2, [array[i][@"y"] intValue] + 2);
        }];
    }];
}

- (CGPoint)getPointWithAngele:(CGFloat)angle{
    
    CGFloat tiltAngle = M_PI;
    CGFloat x = cos(angle)*180;
    CGFloat y = sin(angle)*180;
    CGFloat x1 = x*cos(tiltAngle)- y*sin(tiltAngle);
    CGFloat y1 = x*sin(tiltAngle)+ y*cos(tiltAngle);
    
    return CGPointMake(x1 + (self.frame.size.width)/2 , y1+(self.frame.size.height)/2);
}

@end
