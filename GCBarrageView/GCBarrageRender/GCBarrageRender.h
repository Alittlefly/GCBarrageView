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

#pragma mark - config
// 画布的边距
@property(nonatomic,assign)UIEdgeInsets canvasMargin;
// 画布是否拦截事件
@property(nonatomic,assign)BOOL masked;


#pragma mark - output
// 返回给外部的view
@property(nonatomic,weak)UIView * view;

@end
