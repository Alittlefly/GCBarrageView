//
//  GCBarrageUnitProtocol.h
//  GCBarrageView
//
//  Created by Charles on 2017/6/11.
//  Copyright © 2017年 Fission. All rights reserved.
//

#ifndef GCBarrageUnitProtocol_h
#define GCBarrageUnitProtocol_h

#endif /* GCBarrageUnitProtocol_h */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/// 弹幕点击事件
typedef void(^GCBarrageClickAction)(void);

/// UIView 弹幕协议
@protocol GCBarrageViewProtocol <NSObject>

@required
@property(nonatomic,strong) UIColor *backgroundColor;
@property(nonatomic,assign) CGFloat borderWidth;
@property(nonatomic,strong) UIColor *borderColor;
/// 圆角,此属性十分影响绘制性能,谨慎使用
@property(nonatomic,assign) CGFloat cornerRadius;
/// 强制性大小,默认为CGSizeZero,大小自适应; 否则使用mandatorySize的值来设置view大小
@property(nonatomic,assign) CGSize mandatorySize;

@end

/// Action 弹幕协议
@protocol GCBarrageActionProtocol <NSObject>

/// 注入点击行为
@property(nonatomic,strong) GCBarrageClickAction clickAction;

@end

/// UILabel 弹幕协议
@protocol GCBarrageTextProtocol <GCBarrageViewProtocol>

@required
@property(nonatomic,strong) NSString *text;
@property(nonatomic,strong) UIColor *textColor; // 字体颜色
@property(nonatomic,assign) CGFloat fontSize;
@property(nonatomic,strong) NSString *fontFamily;
@property(nonatomic,retain) UIColor *shadowColor;
@property(nonatomic) CGSize shadowOffset;
@property(nonatomic,strong) NSAttributedString *attributedText;

@end

/// UIImageView 弹幕协议
@protocol GCBarrageImageProtocol <GCBarrageViewProtocol>

@property(nonatomic,strong) UIImage *image;
@property(nonatomic,strong) NSString *imgURLStr;

@end
