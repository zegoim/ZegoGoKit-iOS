//
//  KTVCreateRoomVC.m
//  HalfScreenTransitioning
//
//  Created by Vic on 2022/2/15.
//

#import "GoHalfModalPresentingVC.h"
#import "NSBundle+GoKit.h"

@interface GoHalfModalPresentingVC ()

@property (weak, nonatomic) IBOutlet UIView *barView;
@property (weak, nonatomic) IBOutlet UIView *dragView;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (nonatomic, assign) CGPoint panStartingPoint;
@property (nonatomic, assign) CGRect startingFrame;

@end

@implementation GoHalfModalPresentingVC

- (void)viewDidLoad {
    [super viewDidLoad];
  
  [self setupUI];
  
  if (self.beingPresented) {
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panToDismiss:)];
    [self.dragView addGestureRecognizer:pan];
  }
}

+ (instancetype)loadVCFromNib {
  NSBundle *bundle = [NSBundle GoKit_bundle];
  return [[self alloc] initWithNibName:@"GoHalfModalPresentingVC" bundle:bundle];
}

- (void)viewDidLayoutSubviews {
  [super viewDidLayoutSubviews];
  self.startingFrame = self.view.frame;
}

- (void)setupUI {
  
  self.view.layer.cornerRadius = 10;
  
  if (self.backgroundColor) {
    self.view.backgroundColor = self.backgroundColor;
  }
  
  [self setupBarView];
  [self setupContentView:self.contentView];
}

- (void)setupBarView {
  self.barView.layer.cornerRadius = 2;
}

- (void)setBarViewBackgroundColor:(UIColor *)barViewBackgroundColor {
  self.barView.backgroundColor = barViewBackgroundColor;
}

- (void)dismiss {
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)panToDismiss:(UIPanGestureRecognizer *)pan {
  
  CGPoint point = [pan locationInView:self.presentingViewController.view];
  
  switch (pan.state) {
    case UIGestureRecognizerStateBegan:
      self.panStartingPoint = point;
      break;
      
    case UIGestureRecognizerStateChanged:
    {
      CGFloat dy = point.y - self.panStartingPoint.y;
      CGFloat y = CGRectGetMinY(self.startingFrame) + dy;
      y = MAX(CGRectGetMinY(self.startingFrame), y);
      
      CGRect newFrame = CGRectMake(0,
                                   y,
                                   CGRectGetWidth(self.view.frame),
                                   CGRectGetHeight(self.view.frame));
      self.view.frame = newFrame;
    }
      
      break;
      
    case UIGestureRecognizerStateCancelled:
    case UIGestureRecognizerStateEnded:
    {
      CGFloat dy = point.y - self.panStartingPoint.y;
      CGFloat threshhold = 0.3 * CGRectGetHeight(self.view.frame);
      
      if (dy > threshhold) {
        [self dismiss];
      } else {
        [UIView animateWithDuration:0.2 animations:^{
          self.view.frame = CGRectMake(0,
                                       CGRectGetHeight(self.presentingViewController.view.frame) - self.presentingHeight,
                                       CGRectGetWidth(self.view.frame),
                                       self.presentingHeight);
        }];
      }
    }
      
      break;
      
    default:
      break;
  }
}

#pragma mark - Protocol methods
- (CGFloat)presentingHeight {
  return 275;
}

- (void)setupContentView:(UIView *)contentView {
  
}

@end
