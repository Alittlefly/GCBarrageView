//
//  GCBarrageConsts.h
//  GCBarrageView
//
//  Created by Charles on 2017/5/13.
//  Copyright © 2017年 Fission. All rights reserved.
//

#ifndef GCBarrageConsts_h
#define GCBarrageConsts_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,GCBarrageState){
    GCBarrageStateStarted = 0,
    GCBarrageStateStoped,
    GCBarrageStatePause,
    GCBarrageStateResume
};

@protocol GCBarrageAnimationProtocol <NSObject>

-(void)barrageUintAnimation:(UIView *)superView withModel:(id)model uintView:(UIView *)uintView;

@end

@protocol GCBarrageLocationProtocol <NSObject>

-(CGPoint)barrageUintLocation:(UIView *)superView withModel:(id)model uintView:(UIView *)uintView;

@end

@protocol GCBarrageUintProtocol <NSObject>

-(UIView *)barrageUintWithModel:(id)model;

@end


#endif /* GCBarrageConsts_h */
