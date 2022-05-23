//
//  GBGradientButton.m
//  AFNetworking
//
//  Created by Vic on 2022/2/23.
//

#import "GoGradientButton.h"

@interface GoGradientButton ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation GoGradientButton

- (instancetype)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {
    [self setupUI];
  }
  return self;
}

- (void)setupUI {
  [self setupSubviews];
}

- (void)layoutSubviews {
  [super layoutSubviews];
  self.gradientLayer.frame = self.bounds;
  self.gradientLayer.colors = @[(__bridge id)self.beginColor.CGColor,
                                (__bridge id)self.endColor.CGColor];
}

- (void)setupSubviews {
  [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  [self.titleLabel setTextColor:[UIColor whiteColor]];
  [self.titleLabel setFont:[UIFont systemFontOfSize:14]];
}

- (CAGradientLayer *)gradientLayer {
  if (!_gradientLayer) {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    
    UIColor *leftColor = self.beginColor;
    UIColor *rightColor = self.endColor;
    
    gradientLayer.colors = @[(__bridge id)leftColor.CGColor,
                             (__bridge id)rightColor.CGColor];
    gradientLayer.locations = @[@0.3, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    [self.layer insertSublayer:gradientLayer atIndex:0];
    
    _gradientLayer = gradientLayer;
  }
  return _gradientLayer;
}

- (UIColor *)beginColor {
  if (!_beginColor) {
    _beginColor = [UIColor colorWithRed:1 green:89/255.0 blue:64/255.0 alpha:1];
  }
  return _beginColor;
}

- (UIColor *)endColor {
  if (!_endColor) {
    _endColor = [UIColor colorWithRed:1 green:55/255.0 blue:114/255.0 alpha:1];
  }
  return _endColor;
}

@end
