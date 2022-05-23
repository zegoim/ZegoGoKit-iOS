//
//  TransitioningDelegate.m
//  HalfScreenTransitioning
//
//  Created by Vic on 2022/2/9.
//

#import "GoHalfModalTransitioningDelegate.h"
#import "GoHalfModalPresentationVC.h"

@interface GoHalfModalTransitioningDelegate ()

@property (nonatomic, strong) UIViewController *viewController;
@property (nonatomic, strong) UIViewController *presentingViewController;

@end

@implementation GoHalfModalTransitioningDelegate

- (instancetype)initWithViewController:(UIViewController *)viewController presentingViewController:(UIViewController *)presentingViewController {
  self = [super init];
  if (self) {
    _viewController = viewController;
    _presentingViewController = viewController;
  }
  return self;
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
  return [[GoHalfModalPresentationVC alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

@end
