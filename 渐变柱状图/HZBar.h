//
//  HZBar.h
//  BarView
//
//  Created by 华子 on 16/5/11.
//  Copyright © 2016年 华子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HZBar : UIView
/** bar颜色 */
@property (nonatomic, strong) UIColor * barBackgroundColor;
/** 百分比小数 */
@property (nonatomic, assign) CGFloat percent;

#pragma mark - public method
#define ZFDecimalColor(r, g, b, a) [UIColor colorWithRed:r green:g blue:b alpha:a]
/**
 *  重绘
 */
- (void)strokePath;


@end
