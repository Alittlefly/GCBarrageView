//
//  GCBarrageUint.h
//  GCBarrageView
//
//  Created by Charles on 2017/5/13.
//  Copyright © 2017年 Fission. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GCBarrageUint : NSObject
@property(nonatomic,strong,readonly)UIView *barrageUint;
@property(nonatomic,strong,readonly)CAAnimation *barrageAnimation;
@property(nonatomic,assign,readonly)CGPoint startLocation;
@end
