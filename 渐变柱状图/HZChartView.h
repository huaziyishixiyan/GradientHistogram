//
//  HZChartView.h
//  HealthAppBoss
//
//  Created by 华子 on 16/6/1.
//  Copyright © 2016年 北京华信龙链科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HZChartView : UIView
/***  表格标题 */
@property (weak, nonatomic) IBOutlet UILabel *chartTitle;
/***  姓名区域 */
@property (weak, nonatomic) IBOutlet UIView *nameView;
/***  进度条区域 */
@property (weak, nonatomic) IBOutlet UIView *progressView;
/***  金额区域 */
@property (weak, nonatomic) IBOutlet UIView *moneyView;
/***  姓名数组 */
@property (strong , nonatomic) NSArray *nameArray;
/***  数量数组 */
@property (strong , nonatomic) NSArray *numberArray;

@end
