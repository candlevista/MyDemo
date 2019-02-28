//
//  ICUtilsMarco.h
//  intochina-ios
//
//  Created by ClariS on 2018/11/19.
//  Copyright © 2018年 Wili. All rights reserved.
//

#ifndef ICUtilsMarco_h
#define ICUtilsMarco_h

//#define ON_LINE 1           ///< 线上环境
//#define IC_RELEASE 1        ///< 是否上架


#ifdef ON_LINE

#define kApiRootHost @""
#define kWebSocketurl @""

#else

#define kApiRootHost @""
#define kWebSocketurl @""

#endif


#pragma mark - 常用常量

static NSInteger const kDefaultPage = 1;                              ///< 默认起始页
static NSInteger const kDefaultCount = 10;                            ///< 默认条数
static NSInteger const kCountdown = 60;                               ///< 默认倒计时
static NSInteger const kPhoneLength = 11;                             ///< 手机号限制位数
static NSString *const kNetworkError = @"当前网络不顺畅哦";


#pragma mark - URL

static NSString *const kICShareUrl = @"http://intochina.deva.wili.us/share/#/register";


#pragma mark - 字体

#define IC_FONT_NAME @"PingFangSC-Regular"
#define IC_BOLD_NAME @"PingFangSC-Semibold"
#define IC_MEDIUM @"PingFangSC-Medium"
#define IC_LIGHT @"PingFangSC-Light"
#define IC_DIN @"DINPro-BlackCondensed"
#define IC_DIN_Slim @"DINPro"
#define ICFontWithSize(fontSize) ({[UIFont fontWithName:IC_FONT_NAME size:fontSize] ?: [UIFont systemFontOfSize:fontSize]; })
#define ICBoldWithSize(fontSize) ({[UIFont fontWithName:IC_BOLD_NAME size:fontSize] ?: [UIFont boldSystemFontOfSize:fontSize]; })
#define ICMediumWithSize(fontSize) ({[UIFont fontWithName:IC_MEDIUM size:fontSize] ?: [UIFont systemFontOfSize:fontSize]; })
#define ICLightWithSize(fontSize) ({[UIFont fontWithName:IC_LIGHT size:fontSize] ?: [UIFont systemFontOfSize:fontSize]; })
#define ICDINWithSize(fontSize) ({[UIFont fontWithName:IC_DIN size:fontSize] ?: [UIFont systemFontOfSize:fontSize]; })
#define ICDINSlimWithSize(fontSize) ({[UIFont fontWithName:IC_DIN_Slim size:fontSize] ?: [UIFont systemFontOfSize:fontSize]; })
#define ICFont(name, fontSize) ({[UIFont fontWithName:name size:fontSize] ?: [UIFont systemFontOfSize:fontSize]; })

#define ICLocalString(key) NSLocalizedStringFromTable(key, [[ICUserManager sharedInstance] currentLanguageFileName], nil)


#pragma mark - 屏幕

#define kScreenWidthRate SCREEN_WIDTH/375.0

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define SCREEN_SIZE ([UIScreen mainScreen].bounds.size)


#pragma mark - 调试

#if DEBUG

#define DD_LOG(...) NSLog(__VA_ARGS__)
#else
#define DD_LOG(...)
#endif

#endif /* ICUtilsMarco_h */
