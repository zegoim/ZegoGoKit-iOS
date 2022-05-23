//
//  GoHalfModalProtocol.h
//  HalfScreenTransitioning
//
//  Created by Vic on 2022/2/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GoHalfModalPresentable <NSObject>

/// 弹窗高度, 若未实现, 则默认半屏
- (CGFloat)presentingHeight;

/// 配置实际内容, 主要是添加 subviews
- (void)setupContentView:(UIView *)contentView;

@end

NS_ASSUME_NONNULL_END
