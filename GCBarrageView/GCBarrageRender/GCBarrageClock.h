//
//  GCBarrageClock.h
//  GCBarrageView
//
//  Created by Charles on 2017/6/11.
//  Copyright © 2017年 Fission. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class GCBarrageClock;
@protocol GCBarrageClockDelegate <NSObject>
@optional
-(void)barrageClock:(GCBarrageClock *)clock updateTime:(NSTimeInterval)timeInterval;
@end

@interface GCBarrageClock : NSObject

@property(nonatomic,assign)CGFloat timeSpeed;

-(instancetype)initWithDelegate:(id<GCBarrageClockDelegate>)delegate;


-(void)start;
-(void)stop;
-(void)pause;
-(void)resume;
@end
