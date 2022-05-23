//
//  TransitioningDelegate.h
//  HalfScreenTransitioning
//
//  Created by Vic on 2022/2/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GoHalfModalTransitioningDelegate : NSObject <UIViewControllerTransitioningDelegate>

- (instancetype)initWithViewController:(UIViewController *)viewController presentingViewController:(UIViewController *)presentingViewController;

@end

NS_ASSUME_NONNULL_END
