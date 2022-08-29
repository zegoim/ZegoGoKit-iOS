//
//  GoClickRangeSlider.m
//  GoKit
//
//  Created by zegomjf on 2022/8/11.
//

#import "GoClickRangeSlider.h"
#define thumbBound_x 10

#define thumbBound_y 20
@interface GoClickRangeSlider ()
{
  CGRect  lastBounds;
}
@end
@implementation GoClickRangeSlider

//MARK:扩大滑块的触摸区域

- (CGRect)thumbRectForBounds:(CGRect)bounds trackRect:(CGRect)rect value:(float)value{
  rect.origin.x = rect.origin.x;
  rect.size.width = rect.size.width ;
  CGRect result = [super thumbRectForBounds:bounds trackRect:rect value:value];
  
  lastBounds = result;
  return result;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
  if (!self.enabled) return nil;
  UIView *result = [super hitTest:point withEvent:event];
    if (point.x < 0 || point.x > self.bounds.size.width){
      return result;
    }

if ((point.y >= -thumbBound_y) && (point.y < lastBounds.size.height + thumbBound_y)) {
      float value = 0.0;
      value = point.x - self.bounds.origin.x;
      value = value/self.bounds.size.width;
      
      value = value < 0? 0 : value;
      value = value > 1? 1: value;
      
      value = value * (self.maximumValue - self.minimumValue) + self.minimumValue;
      [self setValue:value animated:YES];
  }
  return result;
    
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
  BOOL result = [super pointInside:point withEvent:event];
  if (!result && point.y > -10) {
      if ((point.x >= lastBounds.origin.x - thumbBound_x) && (point.x <= (lastBounds.origin.x + lastBounds.size.width + thumbBound_x)) && (point.y < (lastBounds.size.height + thumbBound_y))) {
          result = YES;
      }
  }
  return result;
}

/// 设置track（滑条）尺寸
- (CGRect)trackRectForBounds:(CGRect)bounds{
  return CGRectMake(0, 0, bounds.size.width, 3);
}

@end
