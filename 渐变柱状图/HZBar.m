//
//  HZBar.m
//  BarView
//
//  Created by 华子 on 16/5/11.
//  Copyright © 2016年 华子. All rights reserved.
//

#import "HZBar.h"

@interface HZBar ()

/** bar宽度 */
@property (nonatomic, assign) CGFloat barHeight;
/** bar高度上限 */
@property (nonatomic, assign) CGFloat barWidthLimit;
/** 动画时间 */
@property (nonatomic, assign) CGFloat animationDuration;

@end

@implementation HZBar

/**
 *  初始化默认变量
 */
- (void)commonInit{
    _barBackgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_progress_normal"]];
    _barHeight = 13.f;
    _barWidthLimit = 170;
    _percent = 0;
    _animationDuration = 2.f;
    
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    
    return self;
}

#pragma mark - bar

/**
 *  未填充
 *
 *  @return UIBezierPath
 */
- (UIBezierPath *)noFill{
    UIBezierPath * bezier = [UIBezierPath bezierPathWithRect:CGRectMake(_barWidthLimit, 0, 0, _barHeight)];
    [bezier fill];
    return bezier;
}

/**
 *  填充
 *
 *  @return UIBezierPath
 */
- (UIBezierPath *)fill{
    CGFloat currentWidth = _barWidthLimit * self.percent;
    
    UIBezierPath * bezier = [UIBezierPath bezierPathWithRect:CGRectMake( _barWidthLimit -currentWidth, 0, currentWidth, _barHeight)];
    [bezier fill];
    return bezier;
}

/**
 *  CAShapeLayer
 *
 *  @return CAShapeLayer
 */
- (CAShapeLayer *)shapeLayer{
    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.strokeColor = _barBackgroundColor.CGColor;
    layer.fillColor = _barBackgroundColor.CGColor;
    layer.lineCap = kCALineCapRound;
    
    CABasicAnimation * animation = [self animation];
    [layer addAnimation:animation forKey:nil];
    
    return layer;
}

#pragma mark - 动画

/**
 *  填充动画过程
 *
 *  @return CABasicAnimation
 */
- (CABasicAnimation *)animation{
    CABasicAnimation * fillAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    fillAnimation.duration = _animationDuration;
    fillAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    fillAnimation.fillMode = kCAFillModeForwards;
    fillAnimation.removedOnCompletion = NO;
    fillAnimation.fromValue = (id)[self noFill].CGPath;
    fillAnimation.toValue = (id)[self fill].CGPath;
    
    return fillAnimation;
}

#pragma mark - public method

/**
 *  重绘
 */
- (void)strokePath{
    for (CALayer * layer in self.layer.sublayers) {
        [layer removeAllAnimations];
        [layer removeFromSuperlayer];
    }
    [self.layer addSublayer:[self shapeLayer]];
}

@end
