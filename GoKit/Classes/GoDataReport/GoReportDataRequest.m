//
//  GoReportDataRequest.m
//  GoMetaLive
//
//  Created by zegomjf on 2022/7/3.
//

#import "GoReportDataRequest.h"

@implementation GoReportDataRequest
- (void)ls_startWithComplete:(void(^)(BOOL success ,NSDictionary * data ,NSString * msg))complete
                  failure:(void(^)(__kindof YTKBaseRequest * _Nonnull request))failure {
  [self startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {

    if (self.debugLog) {
      NSLog(@"[GO_DATAREPORT][LOG] Request URL: %@", [NSString stringWithFormat:@"%@%@", request.baseUrl, request.requestUrl]);
      NSLog(@"[GO_DATAREPORT][LOG] Request Args: %@", [self jsonStringEncoded:request.requestArgument]);
      NSLog(@"[GO_DATAREPORT][LOG] Response JSON: %@", request.responseString);
    }
    
    NSDictionary *rspDict = request.responseJSONObject;
    NSInteger code = [rspDict[@"ret"][@"code"] integerValue];
    NSString *message = [NSString stringWithFormat:@"%@",rspDict[@"ret"][@"message"]];
    BOOL succ = (code == 0) ? YES : NO;
    if (complete) {
      complete(succ ,rspDict,message);
    }
  } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
    
    if (self.debugLog) {
      NSLog(@"[GO_DATAREPORT][FAILURE_LOG] Request URL: %@", [NSString stringWithFormat:@"%@%@", request.baseUrl, request.requestUrl]);
      NSLog(@"[GO_DATAREPORT][FAILURE_LOG] Request Args: %@", request.requestArgument);
      NSLog(@"[GO_DATAREPORT][FAILURE_LOG] Response error: %@", request.error);
    }
    
    if (failure) {
      failure(request);
    }
  }];
}

- (NSString *)baseUrl {
  NSString *baseUrl  ;
  if (self.isTestEnv) {
    baseUrl = @"https://boss-alpha-service.zego.im";
  }else{
    baseUrl = @"https://boss-service.zego.im";
  }
  return baseUrl;
}

- (NSString *)requestUrl {
  NSString *alpha = @"/BossGoEnjoyOperation";
  return [NSString stringWithFormat:@"%@%@", alpha, [self subPath]];
}

- (NSTimeInterval)requestTimeoutInterval {
  return 15.f;
}

- (YTKRequestMethod)requestMethod {
  return YTKRequestMethodPOST;
}

- (YTKRequestSerializerType)requestSerializerType {
  return YTKRequestSerializerTypeJSON;
}

- (id)requestArgument {
  return self.parameters;
}

- (NSDictionary *)parameters {
  return nil;
}

- (NSString *)jsonStringEncoded:(id)obj {
  if (!obj) {
    return nil;
  }
  if ([NSJSONSerialization isValidJSONObject:obj]) {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:obj options:0 error:&error];
    NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    if (!error) return json;
  }
  return nil;
}
@end
