//
//  GBGradientButton.h
//  AFNetworking
//
//  Created by Vic on 2022/2/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GoGradientButton : UIButton

/// 渐变开始色
@property (nonatomic, strong) UIColor *beginColor;

/// 渐变结束色
@property (nonatomic, strong) UIColor *endColor;

@end

NS_ASSUME_NONNULL_END
