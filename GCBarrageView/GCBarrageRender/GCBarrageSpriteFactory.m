//
//  GCBarrageSpriteFactory.m
//  GCBarrageView
//
//  Created by Zhang Liqiang on 2017/6/11.
//  Copyright © 2017年 Fission. All rights reserved.
//

#import "GCBarrageSpriteFactory.h"
#import "GCBarrageSprite.h"
#import "GCBarrageDescriptor.h"

@implementation GCBarrageSpriteFactory

+ (GCBarrageSprite *)createSpriteWithDescriptor:(GCBarrageDescriptor *)descriptor
{
    GCBarrageSprite * sprite = nil;
    
    if (descriptor.spriteName.length != 0) {
        Class class = NSClassFromString(descriptor.spriteName);
        if (class) {
            sprite = [[class alloc]init];
        }
    }
    if (sprite) {
        sprite.bindObject = descriptor.bindObject;
    }
    return sprite;
}

@end
