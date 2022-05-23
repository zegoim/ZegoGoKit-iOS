//
//  GoAppRouter.h
//  GoKit
//
//  Created by Vic on 2022/4/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GoAppRouter : NSObject

/**
 * 跳转至应用设置页面
 */
+ (void)openAppSettings;

/**
 * 跳转至系统级别 URL
 */
+ (void)openURL:(NSString *)url;

@end

NS_ASSUME_NONNULL_END
