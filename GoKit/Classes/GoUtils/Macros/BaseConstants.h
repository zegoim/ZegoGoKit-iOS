//
//  BaseConstants.h
//  GoKit
//
//  Created by zegomjf on 2022/8/11.
//

#ifndef BaseConstants_h
#define BaseConstants_h

//是否是X系列手机
#define Go_iPhoneX_Series  ({ \
BOOL ipX = NO; \
if (@available(iOS 11.0, *)) { \
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject]; \
    ipX = window.safeAreaInsets.bottom > 0; \
} \
  ipX; \
})

//是否是 iOS11 的系统
#define IOS_IOS_11  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.f)
//是否是X
#define IOS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)

//全局的宏定义
#define GoScreenW       ([[UIScreen mainScreen] bounds].size.width)
#define GoScreenH       ([[UIScreen mainScreen] bounds].size.height)

//适配iPhone X
#define SafeAreaTopH            (Go_iPhoneX_Series ? 44.0 : 20.0)
#define SafeAreaBottomH         (Go_iPhoneX_Series? 34.0 : 0.0)
#define SafeAreaAllTopH         (Go_iPhoneX_Series ? 88.0 : 64.0)
#define SafeAreaAllBottomH      (Go_iPhoneX_Series ? 83.0 : 49.0)

#define Go_STATUSBAR_HEIGHT             (Go_iPhoneX_Series ? 44.0f : 20.0f)  // 状态栏高度
#define Go_NAVBAR_HEIGHT                44.0f   // 导航栏高度
#define Go_STATUSBAR_NAVBAR_HEIGHT      (Go_STATUSBAR_HEIGHT + Go_NAVBAR_HEIGHT) // 状态栏+导航栏高度

#define GoMFont(font) [UIFont systemFontOfSize:font weight:UIFontWeightMedium]
#define GoRFont(font) [UIFont systemFontOfSize:font weight:UIFontWeightRegular]
#define GoBFont(font) [UIFont systemFontOfSize:font weight:UIFontWeightBold]

#define GoStringFormatInt(n) [NSString stringWithFormat:@"%d",n]
#define GoStringFormatString(n)  [NSString stringWithFormat:@"%@",n]
#define GoStringFormatInteger(n) [NSString stringWithFormat:@"%ld",(long)n]



#define GoHexColorWithAlpha(colorName,alph) [UIColor Go_colorWithHexString:colorName alpha:alph]
#define GoHexColor(colorName) [UIColor Go_colorWithHexString:colorName alpha:1]


#endif /* BaseConstants_h */
