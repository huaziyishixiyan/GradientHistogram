//
//  HZChartView.m
//  HealthAppBoss
//
//  Created by 华子 on 16/6/1.
//  Copyright © 2016年 北京华信龙链科技有限公司. All rights reserved.
//

#import "HZChartView.h"
#import "HZBarChart.h"
#import "UIView+Extension.h"

@interface HZChartView ()
/***  日期类型 */
@property (nonatomic , weak) HZBarChart *barChart;
@end

@implementation HZChartView

- (void)awakeFromNib {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 5;
    
    HZBarChart *barChart = [[HZBarChart alloc] initWithFrame:CGRectMake(0, 0, 170, 140)];
    self.barChart = barChart;
    barChart.backgroundColor = [UIColor colorWithRed:251 green:251 blue:251 alpha:1];
    barChart.xLineValueArray = [NSMutableArray arrayWithObjects:@"480", @"255", @"308", @"273", @"236", nil];
    self.nameArray = [NSArray arrayWithObjects:@"小丽", @"小丽", @"小丽", @"小丽", @"小丽", nil];
    self.numberArray = [NSArray arrayWithObjects:@"480", @"255", @"308", @"273", @"236", nil];
    barChart.yLineMaxValue = 500;
    [self.progressView addSubview:barChart];
    
    for (int i = 0; i < self.nameArray.count; i ++) {
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 6 + i * 26, self.nameView.width, 26)];
        [self.nameView addSubview:nameLabel];
        nameLabel.font = [UIFont systemFontOfSize:14];
        nameLabel.text = [NSString stringWithFormat:@"%d.%@", i + 1, self.nameArray[i]];
    }
    
    for (int i = 0; i < self.numberArray.count; i ++) {
        UILabel *moneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 6 + i * 26, self.moneyView.width, 26)];
        [self.moneyView addSubview:moneyLabel];
        moneyLabel.font = [UIFont systemFontOfSize:14];
        moneyLabel.text = [NSString stringWithFormat:@"￥%@元",self.numberArray[i]];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.barChart strokePath];
}
@end
