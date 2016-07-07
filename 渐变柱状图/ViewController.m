//
//  ViewController.m
//  渐变柱状图
//
//  Created by 华子 on 16/7/7.
//  Copyright © 2016年 华子. All rights reserved.
//

#import "ViewController.h"
#import "HZChartView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HZChartView *chartView = [[[NSBundle mainBundle] loadNibNamed:@"HZChartView" owner:nil options:nil] lastObject];
    chartView.frame = CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width - 20, 180);
    [self.view addSubview:chartView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
