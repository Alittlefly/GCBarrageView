//
//  ViewController.m
//  GCBarrageView
//
//  Created by Charles on 2017/5/13.
//  Copyright © 2017年 Fission. All rights reserved.
//

#import "ViewController.h"
#import "GCBarrageView.h"
@interface ViewController ()<GCBarrageViewDelagate>
{
    GCBarrageView *_barrage;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *barrage = [UIView new];
    [barrage setBackgroundColor:[UIColor yellowColor]];
    
    GCBarrageView *view = [[GCBarrageView alloc] initWithView:nil];
    [view setFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 300)];
    [view setDelegate:self];
    _barrage = view;
    [self.view addSubview:view];
    
    UIButton *startButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame) - 50, 450, 100, 100)];
    [startButton setBackgroundColor:[UIColor redColor]];
    [startButton addTarget:self action:@selector(startPlay) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:startButton];
}

-(void)startPlay{
    [_barrage barrageStart];
    
    [self performSelector:@selector(addNewBarrage) withObject:nil afterDelay:2.0];
}
-(void)addNewBarrage{
    [_barrage insertData:[self randomText]];
    [self performSelector:@selector(addNewBarrage) withObject:nil afterDelay:1.0];
}
-(NSString *)randomText{
    
    NSInteger randomLength = arc4random_uniform(20) + 1;
    
    NSString *final = @"";
    for (NSInteger index = 0; index < randomLength; index ++ ) {
        NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        
        NSInteger randomH = 0xA1+arc4random()%(0xFE - 0xA1+1);
        NSInteger randomL = 0xB0+arc4random()%(0xF7 - 0xB0+1);
        NSInteger number = (randomH<<8)+randomL;
        NSData *data = [NSData dataWithBytes:&number length:2];
        
        NSString *string = [[NSString alloc] initWithData:data encoding:gbkEncoding];
        final = [final stringByAppendingString:string];
    }
    return final;
}

-(NSArray *)barrageViewShouldShowedDatas{
    NSArray *datas = @[@"123",@"哈哈哈哈",@"爱神的箭奥斯卡就"];
    return datas;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
