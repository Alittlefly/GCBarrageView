//
//  GCBarrageRender.h
//  GCBarrageView
//
//  Created by Charles on 2017/6/11.
//  Copyright © 2017年 Fission. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GCBarrageRender : NSObject

@property(nonatomic,assign)CGFloat speed;

-(void)renderStart;

-(void)renderStop;

-(void)renderPause;

-(void)renderResume;

@end
