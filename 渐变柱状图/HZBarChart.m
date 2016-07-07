//
//  HZBarChart.m
//  BarView
//
//  Created by 华子 on 16/5/11.
//  Copyright © 2016年 华子. All rights reserved.
//

#import "HZBarChart.h"
#import "HZBar.h"

/**
 *  x轴item宽度
 */
#define XLineItemHeight 13.f

/**
 *  x轴item间隔
 */
#define XLineItemGapLength 13.f


@interface HZBarChart ()

/** 标题Label */
@property (nonatomic, strong) UILabel * titleLabel;


@end

@implementation HZBarChart

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.showsHorizontalScrollIndicator = NO;
        [self strokePath];
        
        //标题Label
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 30)];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:18.f];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.textColor = [UIColor redColor];
        [self addSubview:self.titleLabel];
    }
    
    return self;
}


#pragma mark - 柱状条

/**
 *  画柱状条
 */
- (void)drawBar{
    [self removeAllBar];
    
    for (NSInteger i = 0; i < self.xLineValueArray.count; i++) {
        CGFloat xPos = -170;
        CGFloat yPos = XLineItemGapLength + (XLineItemHeight + XLineItemGapLength) * i;
        CGFloat width = 13.f;
        CGFloat height = XLineItemHeight;
        
//        HZBar * bar1 = [[HZBar alloc] initWithFrame:CGRectMake(xPos, yPos, width, height)];
//            bar1.percent = -1.f;
//            bar1.barBackgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg2.png"]];
//        [bar1 strokePath];
//        [self addSubview:bar1];
        
        HZBar * bar = [[HZBar alloc] initWithFrame:CGRectMake(xPos, yPos, width, height)];
        //当前数值超过y轴显示上限时，柱状改为红色
        if ([self.xLineValueArray[i] floatValue] / _yLineMaxValue <= 1) {
            bar.percent = -[self.xLineValueArray[i] floatValue] / _yLineMaxValue;
        }else{
            bar.percent = 1.f;
            bar.barBackgroundColor = [UIColor redColor];
        }
        [bar strokePath];
        [self addSubview:bar];
    }
}

/**
 *  清除之前所有柱状条
 */
- (void)removeAllBar{
    for (UIView * view in self.subviews) {
        if ([view isKindOfClass:[HZBar class]]) {
            [(HZBar *)view removeFromSuperview];
        }
    }
}

#pragma mark - public method

/**
 *  重绘
 */
- (void)strokePath{
    [self drawBar];
    self.contentSize = self.frame.size;
}


- (void)setTitle:(NSString *)title{
    _title = title;
    self.titleLabel.text = _title;
}

- (void)drawRect:(CGRect)rect

{
    
    for (NSInteger i = 0; i < self.xLineValueArray.count; i++) {
        CGFloat yPos = XLineItemGapLength + (XLineItemHeight + XLineItemGapLength) * i;
        CGFloat height = XLineItemHeight;
        
        //创建路径并获取句柄
        CGMutablePathRef path = CGPathCreateMutable();
        //指定矩形
        CGRect rectangle = CGRectMake(0, yPos, 170, height);
        
        //将矩形添加到路径中
        CGPathAddRect(path,NULL,rectangle);
        
        //获取上下文
        CGContextRef currentContext = UIGraphicsGetCurrentContext();
        //将路径添加到上下文
        CGContextAddPath(currentContext, path);
        
        //设置矩形填充色
        [[UIColor colorWithPatternImage:[UIImage imageNamed:@"home_progress_background"]] setFill];
        
        //矩形边框颜色
//        [HZWhiteColor setStroke];
        //边框宽度
        CGContextSetLineWidth(currentContext,0);
        //绘制
        CGContextDrawPath(currentContext, kCGPathFillStroke);
        CGPathRelease(path);
    }
}


@end
