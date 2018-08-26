//
//  UtilsMacro.h
//  ZZMusic
//
//  Created by 仲召俊 on 2018/8/26.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

//工具类的宏

#ifndef UtilsMacro_h
#define UtilsMacro_h

#import "AppDelegate.h"

//获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

///获取系统时间戳
#define getCurentTime [NSString stringWithFormat:@"%ld", (long)[[NSDate date] timeIntervalSince1970]]

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

//机型判断
#define iPhone4s (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define iPhoneSE (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define iPhone7 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define iPhone7P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
#define iPhoneX (IS_IPHONE && SCREEN_MAX_LENGTH == 812.0)

///自适应字体大小
#define fontSizeScale(size) [(AppDelegate *)[UIApplication sharedApplication].delegate fontSizeScale:size]

///常用字体大小
#define ZZFont(size) [UIFont systemFontOfSize:fontSizeScale(size)]

///常用粗体大小
#define ZZBoldFont(size) [UIFont boldSystemFontOfSize:fontSizeScale(size)]

///动画执行时间
#define ANIMATE_DURATION 0.25

#endif /* UtilsMacro_h */
