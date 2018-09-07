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

///主色调
#define MAIN_COLOR RGB(0,192,125)

///34 34 34
///字体黑色
#define BLACK_TEXTCOLOR RGB(34,34,34)

///107 107 107
///字体灰色
#define GRAY_TEXTCOLOR RGB(107,107,107)

///蒙层背景色
#define MONGOLIANLAYER_COLOR RGBA(0,0,0,0.3)

///分割线条颜色
#define LINE_COLOR RGB(230,230,230)

///分组背景色
#define SECTION_BACKGROUNDCOLOR RGB(244,244,244)

///MidDrawer标签未选中字体颜色
//234 249 241
#define MIDDRAWER_UNSELECTED_COLOR RGB(234,249,241)

///阴影颜色
#define SHADOW_COLOR LINE_COLOR

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

///小号字体
#define SMALL_FONT ZZFont(12)
///常态字体
#define NORMAL_FONT ZZFont(14)
///大号字体
#define BIG_FONT ZZFont(16)

///小号加粗字体
#define SMALL_BOLDFONT ZZFont(12)
///常态加粗字体
#define NORMAL_BOLDFONT ZZFont(14)
///大号加粗字体
#define BIG_BOLDFONT ZZFont(16)

///动画执行时间
#define ANIMATE_DURATION 0.25

///WeakSelf
#define WeakSelf __weak typeof(self) weakSelf = self

///KeyWindow
#define ZZKEYWINDOW [UIApplication sharedApplication].keyWindow

///BANNER图片地址
#define BANNER_IMAGEPATH_FIRST @"http://pic.qiantucdn.com/58pic/19/43/70/56d3eb16b3c51_1024.jpg"
#define BANNER_IMAGEPATH_SECOND @"http://imgsrc.baidu.com/imgad/pic/item/8b82b9014a90f6038eed546a3212b31bb051edbb.jpg"
#define BANNER_IMAGEPATH_THIRD @"http://imgsrc.baidu.com/imgad/pic/item/9e3df8dcd100baa1706f8e964c10b912c8fc2e58.jpg"
#define BANNER_IMAGEPATH_FOURTH @"http://imgsrc.baidu.com/image/c0%3Dpixel_huitu%2C0%2C0%2C294%2C40/sign=92648692083b5bb5aada28be5fabb055/77094b36acaf2edd199cced0861001e93901939e.jpg"
#define BANNER_IMAGEPATH_FIFTH @"http://imgsrc.baidu.com/imgad/pic/item/b17eca8065380cd7ce6868c0aa44ad34598281ad.jpg"
#define BANNER_IMAGEPATH_SIXTH @"http://imgsrc.baidu.com/imgad/pic/item/4a36acaf2edda3cc0b837b0d0ae93901213f92bc.jpg"
///头像地址
#define AVATAR_PATH @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536214465177&di=8ebe2317e01aa7f74081cf8174490ec1&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fq_70%2Cc_zoom%2Cw_640%2Fimages%2F20180726%2Ffad321a0c441487aae8c6a65df639f72.jpeg"

///Banner占位图
#define PLACEHOLDER_IMAGE [UIImage imageNamed:@"placeholder"]

///版本号
#define VERSION_NUMBER [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]

#endif /* UtilsMacro_h */
