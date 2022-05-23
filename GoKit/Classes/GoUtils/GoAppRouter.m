//
//  GoAppRouter.m
//  GoKit
//
//  Created by Vic on 2022/4/18.
//

#import "GoAppRouter.h"

@implementation GoAppRouter

+ (void)openAppSettings {
  [self openURL:UIApplicationOpenSettingsURLString];
}

+ (void)openURL:(NSString *)url {
  NSURL *URL = [NSURL URLWithString:url];
  if (@available(iOS 10.0, *)) {
    if ([[UIApplication sharedApplication] canOpenURL:URL]) {
      [[UIApplication sharedApplication] openURL:URL options:@{} completionHandler:nil];
    }
  } else {
    if ([[UIApplication sharedApplication] canOpenURL:URL]) {
      [[UIApplication sharedApplication] openURL:URL];
    }
  }
}

@end
