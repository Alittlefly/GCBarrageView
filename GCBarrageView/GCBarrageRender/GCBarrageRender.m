//
//  GCBarrageRender.m
//  GCBarrageView
//
//  Created by Charles on 2017/6/11.
//  Copyright © 2017年 Fission. All rights reserved.
//

#import "GCBarrageRender.h"
#import "GCBarrageClock.h"
@interface GCBarrageRender()<GCBarrageClockDelegate>
{
    // 
    GCBarrageClock *_clock;
}

@property(nonatomic,assign)NSTimeInterval time;
@end

@implementation GCBarrageRender

-(instancetype)init{
    if (self = [super init]) {
        [self initClock];
    }
    return self;
}
-(void)initClock{
    _clock = [[GCBarrageClock alloc] initWithDelegate:self];
}
-(CGFloat)speed{
    return _clock.timeSpeed;
}
-(void)setSpeed:(CGFloat)speed{
    [_clock setTimeSpeed:MAX(speed, 0)];
}
-(void)renderStart{
    
    [_clock start];
}

-(void)renderStop{
    [_clock stop];
}

-(void)renderPause{
    [_clock pause];
}

-(void)renderResume{
    [_clock resume];
}


#pragma mark - GCBarrageClockDelegate
-(void)barrageClock:(GCBarrageClock *)clock updateTime:(NSTimeInterval)timeInterval{
    // 时间流动
    self.time = timeInterval;
    
    [self updateCanvas];
}

#pragma mark -
-(void)updateCanvas{
    // 更新画布
}

@end
