//
//  GoDataReport.h
//  GoKit
//
//  Created by zegomjf on 2022/7/4.
//

#import <Foundation/Foundation.h>
@class GoReportDataRequest;

NS_ASSUME_NONNULL_BEGIN

@interface GoDataReport : NSObject
+ (instancetype)shareInstance;

/**
 * 是否打印调试 log, 默认不打印
 */
@property (nonatomic, assign, readwrite) BOOL debugLog;

/**
 * 是否是测试环境 默认 NO
 */
@property (nonatomic, assign) BOOL  isTestEnv;

- (void)startReportData:(GoReportDataRequest *)api;

@end

NS_ASSUME_NONNULL_END
