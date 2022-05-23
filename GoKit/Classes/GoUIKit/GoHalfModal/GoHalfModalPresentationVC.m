//
//  PresentationVC.m
//  HalfScreenTransitioning
//
//  Created by Vic on 2022/2/9.
//

#import "GoHalfModalPresentationVC.h"
#import "GoHalfModalProtocol.h"
#import "GoHalfModalPresentingVC.h"

@interface GoHalfModalPresentationVC ()

@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIVisualEffectView *blurView;
@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;

@end

@implementation GoHalfModalPresentationVC

- (UITapGestureRecognizer *)tapGestureRecognizer {
  if (!_tapGestureRecognizer) {
    _tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
  }
  return _tapGestureRecognizer;
}

- (UIView *)backgroundView {
  if (!_backgroundView) {
    UIView *view = [[UIView alloc] init];
//    [view addSubview:self.blurView];
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    view.backgroundColor = [UIColor clearColor];
    [view addGestureRecognizer:self.tapGestureRecognizer];
    _backgroundView = view;
  }
  return _backgroundView;
}

- (UIVisualEffectView *)blurView {
  if (!_blurView) {
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    _blurView = [[UIVisualEffectView alloc] initWithEffect:effect];
    _blurView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _blurView.userInteractionEnabled = YES;
  }
  return _blurView;
}

- (void)dismiss {
  [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Override
- (CGRect)frameOfPresentedViewInContainerView {
  CGFloat width = CGRectGetWidth(self.containerView.bounds);
  CGFloat height = CGRectGetHeight(self.containerView.bounds) * 0.5;
  
  if ([self.presentedViewController conformsToProtocol:@protocol(GoHalfModalPresentable)]) {
    GoHalfModalPresentingVC *vc = (GoHalfModalPresentingVC *)self.presentedViewController;
    height = [vc presentingHeight];
  }
  
  CGFloat y = CGRectGetHeight(self.containerView.bounds) - height;
  
  return CGRectMake(0, y, width, height);
}

- (void)presentationTransitionWillBegin {
//  self.blurView.alpha = 0;
  [self.containerView addSubview:self.backgroundView];
  self.backgroundView.frame = self.containerView.bounds;
  [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
//    self.blurView.alpha = 1;
  } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
    
  }];
}

- (void)dismissalTransitionWillBegin {
  [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
    self.blurView.alpha = 0;
  } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
    
  }];
}

- (void)containerViewWillLayoutSubviews {
  [super containerViewWillLayoutSubviews];
//  self.presentedView.layer.cornerRadius = 10;
//  self.presentedView.layer.masksToBounds = YES;
}

- (void)containerViewDidLayoutSubviews {
  [super containerViewDidLayoutSubviews];
  self.presentedView.frame = [self frameOfPresentedViewInContainerView];
  self.blurView.frame = self.containerView.bounds;
}

@end
