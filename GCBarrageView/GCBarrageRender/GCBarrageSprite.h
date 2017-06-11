//
//  GCBarrageUint.h
//  GCBarrageView
//
//  Created by Charles on 2017/6/11.
//  Copyright © 2017年 Fission. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCBarrageSprite : NSObject

// 用于传值，或者绘制自定义UI 使用
@property(nonatomic,strong)id bindObject;

@property(nonatomic,assign)BOOL vaild;

@end
