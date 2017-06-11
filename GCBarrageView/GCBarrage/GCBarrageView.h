//
//  GCBarrageView.h
//  GCBarrageView
//
//  Created by Charles on 2017/5/13.
//  Copyright © 2017年 Fission. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GCBarrageView;
@protocol GCBarrageViewDelagate <NSObject>
@optional
// 需要展示的弹幕元素
-(NSArray *)barrageViewShouldShowedDatas;

// 点击单个弹幕元素
-(void)barrageViewClickBarrageUint:(id)uint;

@end

@interface GCBarrageView : UIView

@property(nonatomic,assign)id<GCBarrageViewDelagate>delegate;

-(instancetype)init NS_UNAVAILABLE;
-(instancetype)new NS_UNAVAILABLE;
/*** 
 * 初始化弹幕view
 * barrageView 为nil 会生成一个view
 * barrageView 不为nil 会把barrageView 作为展示的View
 * barrageView 的frame 是和 当前对象的frame相同 创建时可以不设置frame
 ***/
-(instancetype)initWithView:(UIView *)barrageView;
/***
 *
 * 添加新的弹幕元素
 *
 **/
-(void)insertData:(id)model;
/***
 *
 * 开始播放弹幕
 *
 ***/
-(void)barrageStart;
/***
 *
 * 停止播放弹幕
 *
 ***/
-(void)barrageStop;
/***
 *
 * 暂停播放弹幕
 *
 ***/
-(void)barragePause;
/***
 *
 *  继续播放弹幕
 *
 ***/
-(void)barrageResume;
@end
