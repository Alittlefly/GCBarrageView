//
//  GCBarrageView.m
//  GCBarrageView
//
//  Created by Charles on 2017/5/13.
//  Copyright © 2017年 Fission. All rights reserved.
//

#import "GCBarrageView.h"
#import "GCBarrageConsts.h"
#import "CGBarrageUintMaker.h"

@interface GCBarrageView()<CGBarrageUintMakerDelegate>
{
    GCBarrageState _state;
    CGBarrageUintMaker *_maker;
}
@property(nonatomic,strong)UIView *contentView;
@property(nonatomic,strong)NSMutableArray *barrageUints;
@end

@implementation GCBarrageView

-(instancetype)initWithView:(UIView *)barrageView{
    
    self = [super init];
    
    if (barrageView) {
        self.contentView = barrageView;
    }else{
        self.contentView = [[UIView alloc] init];
        [self.contentView setBackgroundColor:[UIColor grayColor]];
    }
    
    _state = GCBarrageStateStoped;
    _maker = [CGBarrageUintMaker makerWithTimeDistance:0.2 withBarrageView:self.contentView];
    [_maker setDelegate:self];
    
    [self addSubview:self.contentView];
    
    return self;
}
-(NSMutableArray *)barrageUints{
    if (!_barrageUints) {
        _barrageUints = [NSMutableArray array];
    }
    return _barrageUints;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self.contentView setFrame:self.bounds];
}
-(void)insertData:(id)model{
    
    NSAssert(model, @"插入的元素不能为空!");
    
    if(model)
        [self.barrageUints addObject:model];
}
-(void)barrageStart{
    
    if (_state == GCBarrageStateStoped) {
        NSMutableArray *showedDatas = [NSMutableArray array];
        
        if([self.delegate respondsToSelector:@selector(barrageViewShouldShowedDatas)]){
            NSArray *array = [self.delegate barrageViewShouldShowedDatas];
            [showedDatas addObjectsFromArray:array];
        }
        
        [self.barrageUints removeAllObjects];
        [self.barrageUints addObjectsFromArray:showedDatas];
        
        [_maker setUints:self.barrageUints];
        [self startPlayBarrageUint];
    }
  
    _state = GCBarrageStateStarted;
}
-(void)barrageStop{
    [_maker stopMakeUint];
    _state = GCBarrageStateStoped;
}
-(void)barragePause{
    [_maker pauseMakeUint];
    _state = GCBarrageStatePause;
}
-(void)barrageResume{
    [_maker resumeMakeUint];
    _state = GCBarrageStateResume;
}

-(void)startPlayBarrageUint{
    // 
    [_maker startMakeUint];
}
@end
