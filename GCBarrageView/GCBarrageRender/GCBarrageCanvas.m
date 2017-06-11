//
//  GCBarrageCanvas.m
//  GCBarrageView
//
//  Created by Zhang Liqiang on 2017/6/11.
//  Copyright © 2017年 Fission. All rights reserved.
//

#import "GCBarrageCanvas.h"

@implementation GCBarrageCanvas

- (instancetype)init
{
    if (self = [super init]) {
        self.userInteractionEnabled = NO;
        self.backgroundColor = [UIColor clearColor];
        self.clipsToBounds = YES;
        _margin = UIEdgeInsetsZero;
        _masked = YES;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.superview) {
        CGRect frame = UIEdgeInsetsInsetRect(self.superview.bounds, self.margin);
        if (!CGRectEqualToRect(self.frame, frame)) {
            self.frame = frame;
        }
    }
}

- (void)setMargin:(UIEdgeInsets)margin
{
    if(!UIEdgeInsetsEqualToEdgeInsets(margin, _margin))
    {
        _margin = margin;
        [self setNeedsLayout];
    }
}

- (void)didMoveToSuperview
{
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

// 画布文字点击
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (self.masked) {
        return [super hitTest:point withEvent:event];
    }
    for (UIView *view in self.subviews) {
        UIView *responder = [view hitTest:[view convertPoint:point fromView:self] withEvent:event];
        if (responder) {
            return responder;
        }
    }
    return nil;
}

@end
