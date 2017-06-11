//
//  GCBarrageClock.m
//  GCBarrageView
//
//  Created by Charles on 2017/6/11.
//  Copyright © 2017年 Fission. All rights reserved.
//

#import "GCBarrageClock.h"
@interface GCBarrageClock()
{
    CADisplayLink *_clock;
    CFTimeInterval _previousDate; // 上一次更新时间
    CGFloat _pausedTimeSpeed; // 暂停之前的时间流速
}
@property(nonatomic,assign)id<GCBarrageClockDelegate>delegate;

@property(nonatomic,assign)CGFloat time;

@property(nonatomic,assign)BOOL launched;
@property(nonatomic,assign)BOOL paused;

@end
@implementation GCBarrageClock
-(instancetype)initWithDelegate:(id<GCBarrageClockDelegate>)delegate{
    if (self = [super init]) {
        [self setDelegate:delegate];
        [self initClock];
        [self pause];
    }
    return self;
}

-(void)initClock{
    if (!_clock) {
         _clock = [CADisplayLink displayLinkWithTarget:self selector:@selector(runClock:)];
    }
}
-(void)runClock:(CADisplayLink  *)clock{
    [self updateTime];
    
    if ([self.delegate respondsToSelector:@selector(barrageClock:updateTime:)]) {
        [self.delegate barrageClock:self updateTime:self.time];
    }

}
-(void)setTimeSpeed:(CGFloat)timeSpeed{
    
    self.timeSpeed = MAX(timeSpeed, 0);
    
    if (timeSpeed == 0) {
        [self pause];
    }
}
                  
-(void)start{
    if (!_clock) {
        [self initClock];
    }
    
    if (self.launched) {
        _timeSpeed = _pausedTimeSpeed;
    } else {
         _previousDate = CACurrentMediaTime();
         _timeSpeed = 1.0f;
        [_clock addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
        self.launched = YES;
        self.paused = NO;
    }
}

-(void)stop{
    if (_clock) {
        [_clock invalidate];
        _clock = nil;
    }
    self.launched = NO;
}

-(void)pause{
    //  暂停
    if (!self.paused) {
        _pausedTimeSpeed = _timeSpeed;
        //  更新时间速度
        _timeSpeed = 0;
        self.paused = YES;
    }
}

-(void)resume{
    if (self.paused) {
        _timeSpeed = _pausedTimeSpeed;
        self.paused = NO;
    }
}
/// 更新逻辑时间系统
- (void)updateTime{
    
    CFTimeInterval currentDate = CACurrentMediaTime();
    self.time += (currentDate - _previousDate) * self.timeSpeed;
    _previousDate = currentDate;
}

@end
