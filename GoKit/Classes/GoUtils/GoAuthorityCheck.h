//
//  ZegoAuthorizedCheck.h
//
//  Created by zego on 2020/5/28.
//  Copyright © 2020 zego. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GoAuthorityCheck : NSObject

/**
 * 麦克风已是否授权
 */
+ (BOOL)isMicrophoneAuthorized;

/**
 * 用户是否已经选择过麦克风权限
 */
+ (BOOL)isMicrophoneAuthorizationDetermined;

/**
 * 请求麦克风系统弹窗
 */
+ (void)alertSystemRecordPermissionRequestWithCompletion:(void(^ _Nullable)(BOOL granted))completionBlock;

/**
 * 摄像头已是否授权
 */

+ (BOOL)isCameraAuthorized;

/**
 * 照片库已是否授权
 */
+ (BOOL)isPhotoLibraryAccessAuthorized;

/**
 * 首次点击摄像头权限弹窗回调
 */
+ (void)requestCameraAuthorityStatusWithCompletion:(void(^)(BOOL isAuthorized))completion;

/**
 * 首次点击麦克风权限弹窗回调
 */
+ (void)requestMicrophoneAuthorityStatusWithCompletion:(void(^)(BOOL isAuthorized))completion;

@end

NS_ASSUME_NONNULL_END
