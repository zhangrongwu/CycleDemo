//
//  ViewController.m
//  CycleDemo
//
//  Created by zhangrongwu on 2018/8/14.
//  Copyright © 2018年 ENN. All rights reserved.
//

#import "ViewController.h"
#import "CycleViewForLaoZhao.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    CycleViewForLaoZhao *cycle = [[CycleViewForLaoZhao alloc] init];
    cycle.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:cycle];
    [cycle createCycleItems];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
