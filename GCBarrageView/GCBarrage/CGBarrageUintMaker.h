//
//  CGBarrageUintMaker.h
//  GCBarrageView
//
//  Created by Charles on 2017/5/13.
//  Copyright © 2017年 Fission. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCBarrageConsts.h"

@protocol CGBarrageUintMakerDelegate <NSObject>

@optional

-(id<GCBarrageAnimationProtocol>)barrageAnimation;

-(id<GCBarrageLocationProtocol>)barrageLocation;

-(id<GCBarrageUintProtocol>)barrageUintFilter;

@end


@interface CGBarrageUintMaker : NSObject

@property(nonatomic,assign)id<CGBarrageUintMakerDelegate>delegate;
@property(nonatomic,strong)NSArray *uints;
// 时间间距
@property(nonatomic,assign)NSUInteger distanceTime;
+(instancetype)maker;
+(instancetype)makerWithTimeDistance:(NSUInteger)distanceTime withBarrageView:(UIView *)barrageView;


-(void)startMakeUint;
-(void)stopMakeUint;
-(void)pauseMakeUint;
-(void)resumeMakeUint;


// 定时执行 
-(void)makeBarrageUint;
@end
