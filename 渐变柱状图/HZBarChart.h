//
//  HZBarChart.h
//  BarView
//
//  Created by 华子 on 16/5/11.
//  Copyright © 2016年 华子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HZBarChart : UIScrollView

/** 标题 */
@property (nonatomic, copy) NSString * title;
/** x轴数值数组 (存储的是NSString类型) */
@property (nonatomic, strong) NSMutableArray * xLineValueArray;
/** y轴数值显示的上限 */
@property (nonatomic, assign) float yLineMaxValue;

#pragma mark - public method
/**
 *  重绘
 */
- (void)strokePath;


@end
