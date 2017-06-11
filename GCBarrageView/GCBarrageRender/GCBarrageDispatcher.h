//
//  GCBarrageDispatcher.h
//  GCBarrageView
//
//  Created by Charles on 2017/6/11.
//  Copyright © 2017年 Fission. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GCBarrageSprite;
@class GCBarrageDispatcher;

@protocol GCBarrageDispatcherDelegate <NSObject>

@optional
/// 是否激活此弹幕精灵.
- (BOOL)shouldActiveSprite:(GCBarrageSprite *)sprite;
- (NSTimeInterval)timeForBarrageDispatcher:(GCBarrageDispatcher *)dispatcher;

@required
- (void)willActiveSprite:(GCBarrageSprite *)sprite;
- (void)willDeactiveSprite:(GCBarrageSprite *)sprite;

@end

/// 弹幕调度器, 主要完成负载均衡的工作.
@interface GCBarrageDispatcher : NSObject
/// 添加精灵.
- (void)addSprite:(GCBarrageSprite *)sprite;

/// 派发精灵.
- (void)dispatchSprites;

/// 停止当前被激活的精灵
- (void)deactiveAllSprites;

/// 当前活跃的精灵.
@property (nonatomic,strong,readonly)NSArray * activeSprites;

@property (nonatomic,weak)id<GCBarrageDispatcherDelegate> delegate;

@end
