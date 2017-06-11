//
//  GCBarrageDispatcher.m
//  GCBarrageView
//
//  Created by Charles on 2017/6/11.
//  Copyright © 2017年 Fission. All rights reserved.
//

#import "GCBarrageDispatcher.h"
#import "GCBarrageSprite.h"

@interface GCBarrageDispatcher()
{
    NSMutableArray *_activeSprites;
    
    NSTimeInterval _previousTime;
}
/// 当前等待的sprite.
@property (nonatomic,strong)NSMutableArray * waitingSprites;
/// 当前过期的sprite.
@property (nonatomic,strong)NSMutableArray * deadSprites;

@end
@implementation GCBarrageDispatcher

- (instancetype)init
{
    if (self = [super init]) {
        _activeSprites = [[NSMutableArray alloc]init];
        _waitingSprites = [[NSMutableArray alloc]init];
        _deadSprites = [[NSMutableArray alloc]init];
//        _cacheDeadSprites = NO;
        _previousTime = 0.0f;
    }
    return self;
}

- (void)setDelegate:(id<GCBarrageDispatcherDelegate>)delegate
{
    _delegate = delegate;
    _previousTime = [self currentTime];
}

- (void)addSprite:(GCBarrageSprite *)sprite
{
    if ([sprite isKindOfClass:[GCBarrageSprite class]]) {
        [_waitingSprites addObject:sprite];
    }
}
- (void)dispatchSprites
{
    for (NSInteger i = 0; i < _activeSprites.count; i ++) {
        GCBarrageSprite * sprite = [_activeSprites objectAtIndex:i];
//        if (!sprite.isValid) {
            [self deactiveSprite:sprite];
            [_activeSprites removeObjectAtIndex:i--];
//        }
    }
    static NSTimeInterval const MAX_EXPIRED_SPRITE_RESERVED_TIME = 0.5f; // 弹幕最大保留时间
    NSTimeInterval currentTime = [self currentTime];
    NSTimeInterval timeWindow = currentTime - _previousTime; // 有可能为正,也有可能为负(如果倒退的话)
    //    NSLog(@"内部时间:%f -- 变化时间:%f",currentTime,timeWindow);
    //如果是正, 可能是正常时钟,也可能是快进
    if (timeWindow >= 0) {
        for (NSInteger i = 0; i < _waitingSprites.count; i++) {
            GCBarrageSprite * sprite = [_waitingSprites objectAtIndex:i];
            NSTimeInterval overtime = currentTime - 0;//sprite.delay;
            if (overtime >= 0) {
                if (overtime < timeWindow && overtime <= MAX_EXPIRED_SPRITE_RESERVED_TIME) {
                    if ([self shouldActiveSprite:sprite]) {
                        [self activeSprite:sprite];
                        [_activeSprites addObject:sprite];
                    }
                }
                [_waitingSprites removeObjectAtIndex:i--];
            }
        }
    }
    else // 倒退,需要起死回生
    {
        for (NSInteger i = 0; i < _deadSprites.count; i++) { // 活跃精灵队列
            GCBarrageSprite * sprite = [_deadSprites objectAtIndex:i];
            if (/*sprite.delay*/0 > currentTime) {
                [_waitingSprites addObject:sprite];
                [_deadSprites removeObjectAtIndex:i--];
            }
            else if (/*sprite.delay*/ 0 == currentTime)
            {
                if ([self shouldActiveSprite:sprite]) {
                    [self activeSprite:sprite];
                    [_activeSprites addObject:sprite];
                    [_deadSprites removeObjectAtIndex:i--];
                }
            }
        }
    }
    
    _previousTime = currentTime;
}
/// 停止当前被激活的精灵
- (void)deactiveAllSprites
{
    for (NSInteger i = 0; i < _activeSprites.count; i ++) { // 活跃精灵队列
        GCBarrageSprite * sprite = [_activeSprites objectAtIndex:i];
        [self deactiveSprite:sprite];
        [_activeSprites removeObjectAtIndex:i--];
    }
}
- (void)deactiveSprite:(GCBarrageSprite *)sprite
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(willDeactiveSprite:)]) {
        [self.delegate willDeactiveSprite:sprite];
    }
}

- (NSTimeInterval)currentTime
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(timeForBarrageDispatcher:)]) {
        return [self.delegate timeForBarrageDispatcher:self];
    }
    return 0.0f;
}
- (BOOL)shouldActiveSprite:(GCBarrageSprite *)sprite
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(shouldActiveSprite:)]) {
        return [self.delegate shouldActiveSprite:sprite];
    }
    return YES;
}
/// 激活精灵
- (void)activeSprite:(GCBarrageSprite *)sprite
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(willActiveSprite:)]) {
        [self.delegate willActiveSprite:sprite];
    }
}
@end
