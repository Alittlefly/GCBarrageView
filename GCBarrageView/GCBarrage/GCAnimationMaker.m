//
//  GCAnimationMaker.m
//  GCBarrageView
//
//  Created by Charles on 2017/5/14.
//  Copyright © 2017年 Fission. All rights reserved.
//

#import "GCAnimationMaker.h"
#import <objc/runtime.h>
static NSString *uintAnimation;
@interface GCAnimationMaker()<CAAnimationDelegate>
{
    UIView *_uintView;
}
@end

@implementation GCAnimationMaker
-(void)barrageUintAnimation:(UIView *)superView withModel:(id)model uintView:(UIView *)uintView{
    
    /*   */
    CALayer *viewLayer = [uintView layer];
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"position.x"];
    animation.duration = arc4random_uniform(10.f) + 10.0f;
    animation.autoreverses = NO;
    animation.fromValue= @(CGRectGetMaxX(superView.frame));
     animation.toValue= @(CGRectGetMinX(superView.frame) - CGRectGetWidth(uintView.frame));
     animation.removedOnCompletion = YES; // 最大
    [animation setDelegate:self];
    [animation setValue:@"scale" forKey:@"animationName"];
    [viewLayer addAnimation:animation forKey:@"scale"];
  
    _uintView = uintView;
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [UIView animateWithDuration:2.0 animations:^{
        [_uintView setAlpha:0];
    } completion:^(BOOL finished) {
        [_uintView removeFromSuperview];
        _uintView = nil;
        
    }];
}
@end
