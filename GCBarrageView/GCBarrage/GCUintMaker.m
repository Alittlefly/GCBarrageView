//
//  GCUintMaker.m
//  GCBarrageView
//
//  Created by Charles on 2017/5/14.
//  Copyright © 2017年 Fission. All rights reserved.
//

#import "GCUintMaker.h"

@implementation GCUintMaker
-(UIView *)barrageUintWithModel:(id)model{
    
    UILabel *view = [[UILabel alloc] init];
    [view setFrame:CGRectMake(0, 0, 20, 20)];
    if ([model isKindOfClass:[NSString class]]) {
        NSString *text = (NSString *)model;
        [view setText:text];
        [view sizeToFit];
    }
    [view setTextColor:[UIColor whiteColor]];
    [view setBackgroundColor:[UIColor clearColor]];
    return view;
}
@end
