//
//  NSBundle+GoKit.m
//  AFNetworking
//
//  Created by Vic on 2022/4/21.
//

#import "NSBundle+GoKit.h"

@interface GoKitBundleStubClass : NSObject

@end

@implementation GoKitBundleStubClass

@end

@implementation NSBundle (GoKit)

+ (NSBundle *)GoKit_bundle {
  NSBundle *currentBundle = [NSBundle bundleForClass:[GoKitBundleStubClass class]];
  NSURL *url = [currentBundle URLForResource:@"GoKit" withExtension:@"bundle"];
  return [self bundleWithURL:url];
}

@end
