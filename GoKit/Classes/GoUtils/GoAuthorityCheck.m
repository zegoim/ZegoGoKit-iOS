//
//  ZegoAuthorizedCheck.m
//
//  Created by zego on 2020/5/28.
//  Copyright © 2020 zego. All rights reserved.
//

#import "GoAuthorityCheck.h"
#import <AVFoundation/AVFoundation.h>
#import <Photos/PHPhotoLibrary.h>

@implementation GoAuthorityCheck

+ (BOOL)isMicrophoneAuthorized {
  AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
  return status == AVAuthorizationStatusAuthorized;
}

+ (BOOL)isMicrophoneAuthorizationDetermined {
  AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
  return status != AVAuthorizationStatusNotDetermined;
}

+ (void)alertSystemRecordPermissionRequestWithCompletion:(void(^)(BOOL granted))completionBlock {
  AVAudioSession *avSession = [AVAudioSession sharedInstance];
  [avSession requestRecordPermission:^(BOOL granted) {
    if (completionBlock) {
      dispatch_async(dispatch_get_main_queue(), ^{      
        completionBlock(granted);
      });
    }
  }];
}

+ (BOOL)isCameraAuthorized {
  AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
  return status == AVAuthorizationStatusAuthorized;
}

+ (BOOL)isPhotoLibraryAccessAuthorized {
  PHAuthorizationStatus status  = [PHPhotoLibrary authorizationStatus];
  return status == AVAuthorizationStatusAuthorized;
}

+ (void)requestCameraAuthorityStatusWithCompletion:(void(^)(BOOL isOpenCamera))completion {
  [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
    if (completion) {
      completion(granted);
    }
  }];
}

+ (void)requestMicrophoneAuthorityStatusWithCompletion:(void(^)(BOOL isOpenMic))completion {
  [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio completionHandler:^(BOOL granted){
    if (completion) {
      completion(granted);
    }
  }];
}

@end
