//
//  GoNotice.h
//  GoKit
//
//  Created by Vic on 2022/4/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, GoNoticePosition) {
  GoNoticePositionTop,
  GoNoticePositionCenter,
  GoNoticePositionBottom,
};

@interface GoNotice : NSObject

#pragma mark - Toast
/**
 * 展示 toast 弹窗, 默认展示 2s 后自动消失
 * @param message 弹窗展示文本
 * @param view 添加弹窗的视图
 */
+ (void)showToast:(NSString *)message
           onView:(UIView *)view;

/**
 * 与 +[showToast:onView:] 作用方法相同, 但可以自定义展示时长
 */
+ (void)showToast:(NSString *)message
         duration:(NSTimeInterval)duration
           onView:(UIView *)view;

/**
 * 与 +[showToast:onView:] 作用方法相同, 但可以自定义展示时长和展示位置
 */
+ (void)showToast:(NSString *)message duration:(NSTimeInterval)duration onView:(UIView *)view position:(GoNoticePosition)position;

#pragma mark - Activity
/**
 * 展示 UIActivityIndicator
 */
+ (void)showActivityOnView:(UIView *)view;

/**
 * 展示带文字的 UIActivityIndicator
 */
+ (void)showActivityWithText:(NSString *)text onView:(UIView *)view;

/**
 * 隐藏 activity
 */
+ (void)hideActivityOnView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
