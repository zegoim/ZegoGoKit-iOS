//
//  GoReportDataRequest.h
//  GoMetaLive
//
//  Created by zegomjf on 2022/7/3.
//

#import <YTKNetwork/YTKNetwork.h>

NS_ASSUME_NONNULL_BEGIN

@interface GoReportDataRequest : YTKBaseRequest

/**
 * 是否打印调试 log, 默认不打印
 */
@property (nonatomic, assign, readwrite) BOOL debugLog;

/**
 * 接口参数 用于  overwrite
 */
- (NSDictionary * _Nullable)parameters;

/**
 * 服务接口地址 用于 overwrite
 */
- (NSString * _Nullable)subPath;

/**
 * 是否是测试环境 默认 NO
 */
@property (nonatomic, assign) BOOL  isTestEnv;

/**
 * 调用该方法发起请求
 */
- (void)ls_startWithComplete:(void(^)(BOOL success ,NSDictionary * data ,NSString * msg))complete
                           failure:(void(^)(__kindof YTKBaseRequest * _Nonnull request))failure;
@end

NS_ASSUME_NONNULL_END


