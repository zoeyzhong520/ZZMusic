//
//  BaseNavigationBar.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/27.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    LeftMenuButton = 0,
    RightBubbleButton = 1,
} BarButtonType;

@interface BaseNavigationBar : UIView

@property (nonatomic, copy) void(^clickBlock)(BarButtonType);

@end
