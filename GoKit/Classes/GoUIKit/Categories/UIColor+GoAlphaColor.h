//
//  NSBundle+GoAlphaColor.h
//  GoKit
//
//  Created by zegomjf on 2022/8/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (GoAlphaColor)
+ (instancetype)Go_colorWithHex:(NSString *)hexStr;
+ (UIColor *)Go_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
@end

NS_ASSUME_NONNULL_END
