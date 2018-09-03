//
//  SizeMacro.h
//  ZZMusic
//
//  Created by 仲召俊 on 2018/8/26.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

//尺寸类的宏

#ifndef SizeMacro_h
#define SizeMacro_h

///状态栏高度
#define STATUS_BAR_HEIGHT [UIApplication sharedApplication].statusBarFrame.size.height

///NavBar高度
#define NAVIGATION_BAR_HEIGHT 44

///状态栏 + 导航栏 高度
#define STATUS_AND_NAVIGATION_HEIGHT ((STATUS_BAR_HEIGHT) + (NAVIGATION_BAR_HEIGHT))

///屏幕 rect
#define SCREEN_RECT ([UIScreen mainScreen].bounds)

///屏幕宽度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

///屏幕高度
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define CONTENT_HEIGHT (SCREEN_HEIGHT - NAVIGATION_BAR_HEIGHT - STATUS_BAR_HEIGHT)

///屏幕分辨率
#define SCREEN_RESOLUTION (SCREEN_WIDTH * SCREEN_HEIGHT * ([UIScreen mainScreen].scale))

///广告栏高度
#define BANNER_HEIGHT 140

///气泡视图宽度
#define BUBBLE_WIDTH 130
#define BUBBLE_SINGLEROW_HEIGHT 40

///搜索栏高度
#define SEARCHBAR_HEIGHT 56

#endif /* SizeMacro_h */
