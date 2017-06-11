//
//  CGBarrageUintMaker.m
//  GCBarrageView
//
//  Created by Charles on 2017/5/13.
//  Copyright © 2017年 Fission. All rights reserved.
//

#import "CGBarrageUintMaker.h"
#import "GCAnimationMaker.h"
#import "GCLocationMaker.h"
#import "GCUintMaker.h"

@interface CGBarrageUintMaker()
{
//    NSTimer *_timer;
    
    CADisplayLink *_displayLink;
    id<GCBarrageLocationProtocol> _locationMaker;
    id<GCBarrageAnimationProtocol> _animationMaker;
    id<GCBarrageUintProtocol> _uintMaker;
    
    NSUInteger _playIndex;
}
@property(nonatomic,assign)UIView *barrageView;
@end
@implementation CGBarrageUintMaker
+(instancetype)maker{
    return [[CGBarrageUintMaker alloc] init];
}
+(instancetype)makerWithTimeDistance:(NSUInteger)distanceTime withBarrageView:(UIView *)barrageView{
    CGBarrageUintMaker *maker = [CGBarrageUintMaker maker];
    maker.distanceTime = distanceTime;
    maker.barrageView = barrageView;
    return maker;
}
-(instancetype)init{
    if (self = [super init]) {
        _distanceTime = 0.2;
        _playIndex = 0;
    }
    return self;
}

-(void)startMakeUint{
//    if (!_timer) {
//        _timer = [NSTimer scheduledTimerWithTimeInterval:_distanceTime target:self selector:@selector(makeBarrageUint) userInfo:nil repeats:YES];
//        
//        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
//    }
    _playIndex = 0;
//    [_timer setFireDate:[NSDate distantPast]];
    if(!_displayLink){
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(makeBarrageUint:)];
        
        [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
}
-(void)stopMakeUint{
//    if ([_timer isValid]) {
//        [_timer setFireDate:[NSDate distantFuture]];
//    }
    _playIndex = 0;
}
-(void)pauseMakeUint{
//    if ([_timer isValid]) {
//        [_timer setFireDate:[NSDate distantFuture]];
//    }
}
-(void)resumeMakeUint{
//    if ([_timer isValid]) {
//        [_timer setFireDate:[NSDate distantPast]];
//    }
}

-(void)makeBarrageUint:(CADisplayLink *)displayLink{
    
    NSLog(@"time");
    
    // 越界则不执行
    if (_playIndex >= [self.uints count]) {
        return;
    }
    
    if ([self.delegate respondsToSelector:@selector(barrageAnimation)]) {
        _animationMaker = [self.delegate barrageAnimation];
    }else{
        _animationMaker = [[GCAnimationMaker alloc] init];
    }
    
    if ([self.delegate respondsToSelector:@selector(barrageLocation)]) {
        _locationMaker = [self.delegate barrageLocation];
    }else{
        _locationMaker = [[GCLocationMaker alloc] init];
    }
    
    if ([self.delegate respondsToSelector:@selector(barrageUintFilter)]) {
        _uintMaker = [self.delegate barrageUintFilter];
    }else{
        _uintMaker = [[GCUintMaker alloc] init];
    }
    
    id model = [self.uints objectAtIndex:_playIndex];
    
    UIView *uint = [_uintMaker barrageUintWithModel:model];

    [_animationMaker barrageUintAnimation:self.barrageView withModel:model uintView:uint];

    CGPoint location = [_locationMaker barrageUintLocation:self.barrageView withModel:model uintView:uint];
    CGSize size = uint.frame.size;
    
     uint.frame = CGRectMake(location.x, location.y, size.width, size.height);
    [self.barrageView addSubview:uint];
    
    
    // 去取下次model
    _playIndex++;
}

@end
