//
//  GoHalfModalPresentationCoordinator.h
//  HalfScreenTransitioning
//
//  Created by Vic on 2022/2/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GoHalfModalPresentationCoordinator : NSObject

+ (void)presentWithPresentedVC:(UIViewController *)presentedVC
                  presentingVC:(UIViewController *)presentingVC;

/// Present 方法
/// @param presentedVC present 其他页面的页面
/// @param presentingVC 被 present 的页面
/// @param animated 是否动画
/// @param completion 结束回调
+ (void)presentWithPresentedVC:(UIViewController *)presentedVC
                  presentingVC:(UIViewController *)presentingVC
                      animated:(BOOL)animated
                    completion:(void(^ _Nullable)(void))completion;

@end

NS_ASSUME_NONNULL_END
