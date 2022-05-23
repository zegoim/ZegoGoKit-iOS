//
//  GoHalfModalPresentationCoordinator.m
//  HalfScreenTransitioning
//
//  Created by Vic on 2022/2/15.
//

#import "GoHalfModalPresentationCoordinator.h"
#import "GoHalfModalTransitioningDelegate.h"

@implementation GoHalfModalPresentationCoordinator

+ (void)presentWithPresentedVC:(UIViewController *)presentedVC
                  presentingVC:(UIViewController *)presentingVC {
  [self presentWithPresentedVC:presentedVC presentingVC:presentingVC animated:YES completion:nil];
}

+ (void)presentWithPresentedVC:(UIViewController *)presentedVC
                  presentingVC:(UIViewController *)presentingVC
                      animated:(BOOL)animated
                    completion:(void (^)(void))completion {
  if (!presentedVC || !presentingVC) {
    return;
  }
  GoHalfModalTransitioningDelegate *transitioningDelegate = [[GoHalfModalTransitioningDelegate alloc] initWithViewController:presentedVC presentingViewController:presentingVC];
  presentingVC.transitioningDelegate = transitioningDelegate;
  presentingVC.modalPresentationStyle = UIModalPresentationCustom;
  [presentedVC presentViewController:presentingVC animated:animated completion:completion];
}

@end
