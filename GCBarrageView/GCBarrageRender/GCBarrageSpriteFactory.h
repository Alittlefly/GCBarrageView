//
//  GCBarrageSpriteFactory.h
//  GCBarrageView
//
//  Created by Zhang Liqiang on 2017/6/11.
//  Copyright © 2017年 Fission. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GCBarrageSprite;
@class GCBarrageDispatcher;

@interface GCBarrageSpriteFactory : NSObject

/// 通过描述符创建精灵
+ (GCBarrageSprite *)createSpriteWithDescriptor:(GCBarrageDispatcher *)descriptor;

@end
