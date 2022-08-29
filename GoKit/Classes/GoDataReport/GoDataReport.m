//
//  GoDataReport.m
//  GoKit
//
//  Created by zegomjf on 2022/7/4.
//

#import "GoDataReport.h"
#import "GoReportDataRequest.h"

@implementation GoDataReport

static dispatch_once_t onceToken;
static id _instance;

+ (instancetype)shareInstance {
  
  dispatch_once(&onceToken, ^{
    _instance = [[self alloc] init];
  });
  return _instance;
}

- (void)startReportData:(GoReportDataRequest *)api{
  api.isTestEnv = self.isTestEnv;
  api.debugLog = self.debugLog;
  [api ls_startWithComplete:^(BOOL success, NSDictionary * _Nonnull data, NSString * _Nonnull msg) {
    if (success) {
      NSLog(@"[GoDataReport API] [成功]");
    } else {
      NSInteger code = [data[@"ret"][@"code"] integerValue];
      NSLog(@"[GoDataReport API] [失败] code = %ld message = %@",(long)code,msg);
    }
  } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
    NSLog(@"[GoDataReport API] [FAILURE] Response error: %@", request.error);

  }];
}
@end
