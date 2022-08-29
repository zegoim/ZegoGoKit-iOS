//
//  KTVCreateRoomVC.h
//  HalfScreenTransitioning
//
//  Created by Vic on 2022/2/15.
//

#import <UIKit/UIKit.h>
#import "GoHalfModalProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface GoHalfModalPresentingVC : UIViewController <GoHalfModalPresentable>

+ (instancetype)loadVCFromNib;

@property (nonatomic, strong) UIColor *backgroundColor;

@property (nonatomic, strong) UIColor *barViewBackgroundColor;

@end

NS_ASSUME_NONNULL_END
