//
//  GCLocationMaker.m
//  GCBarrageView
//
//  Created by Charles on 2017/5/14.
//  Copyright © 2017年 Fission. All rights reserved.
//

#import "GCLocationMaker.h"

@interface GCLocationMaker()
{
    NSUInteger _roads;
}
@end
@implementation GCLocationMaker
-(instancetype)init{
    if (self = [super init]) {
        _roads = 6;
    }
    return self;
}
-(CGPoint)barrageUintLocation:(UIView *)superView withModel:(id)model uintView:(UIView *)uintView{
    if (!superView) {
        return CGPointZero;
    }
    if (!_roads) {
        return CGPointZero;
    }
    
    
    if (CGRectGetWidth(uintView.frame) != 0) {
        _roads = CGRectGetHeight(superView.frame)/CGRectGetHeight(uintView.frame);
    }
    
    CGRect  rect = superView.bounds;
    uint32_t roadRange = (uint32_t)(_roads - 1);
    if (roadRange <= 0) {
        roadRange = 5;
    }
    NSInteger roadIndex = arc4random_uniform(roadRange);
    
    CGFloat roadHeight = CGRectGetHeight(superView.frame)/_roads;
    
    
    CGFloat pointx =  CGRectGetWidth(rect) + 2 *CGRectGetWidth(uintView.frame);
    CGFloat pointy =  roadIndex * roadHeight + (roadHeight - CGRectGetHeight(uintView.frame)/2.0);

    return CGPointMake(pointx, pointy);
}
@end
