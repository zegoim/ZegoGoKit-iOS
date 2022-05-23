//
//  GoNotice.m
//  GoKit
//
//  Created by Vic on 2022/4/19.
//

#import "GoNotice.h"
#import <Toast/Toast.h>
#import <MBProgressHUD/MBProgressHUD.h>

@implementation GoNotice

#pragma mark - Toast
+ (void)showToast:(NSString *)message onView:(UIView *)view {
  [self showToast:message duration:2 onView:view];
}

+ (void)showToast:(NSString *)message duration:(NSTimeInterval)duration onView:(UIView *)view {
  [self showToast:message duration:duration onView:view position:GoNoticePositionCenter];
}

+ (void)showToast:(NSString *)message
         duration:(NSTimeInterval)duration
           onView:(UIView *)view
         position:(GoNoticePosition)position {
  const NSString * csPosition = nil;
  switch (position) {
    case GoNoticePositionTop:
      csPosition = CSToastPositionTop;
      break;
    case GoNoticePositionCenter:
      csPosition = CSToastPositionCenter;
      break;
    case GoNoticePositionBottom:
      csPosition = CSToastPositionBottom;
      break;
  }
  
  CSToastStyle *style = [[CSToastStyle alloc] initWithDefaultStyle];
  style.titleAlignment = NSTextAlignmentCenter;
  style.messageAlignment = NSTextAlignmentCenter;
  
  [view makeToast:message duration:duration position:csPosition style:style];
}

#pragma mark - Activity
+ (void)showActivityOnView:(UIView *)view {
  MBProgressHUD *hud = [self hudWithDimBackgroundOnView:view];
  [hud showAnimated:YES];
}

+ (void)showActivityWithText:(NSString *)text onView:(UIView *)view {
  MBProgressHUD *hud = [self hudWithDimBackgroundOnView:view];
  hud.label.text = text;
  [hud showAnimated:YES];
}

+ (void)hideActivityOnView:(UIView *)view {
  [MBProgressHUD hideHUDForView:view animated:YES];
}

+ (MBProgressHUD *)hudWithDimBackgroundOnView:(UIView *)view {
  MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
  hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
  hud.backgroundView.color = [UIColor colorWithWhite:0.f alpha:0.1f];
  return hud;
}

@end
