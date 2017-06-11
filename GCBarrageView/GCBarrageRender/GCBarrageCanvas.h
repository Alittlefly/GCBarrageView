//
//  GCBarrageCanvas.h
//  GCBarrageView
//
//  Created by Zhang Liqiang on 2017/6/11.
//  Copyright © 2017年 Fission. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GCBarrageCanvas : UIView

@property(nonatomic, assign)UIEdgeInsets margin;
@property(nonatomic, assign)BOOL masked; // canvas是否拦截事件, 默认 YES.

@end
