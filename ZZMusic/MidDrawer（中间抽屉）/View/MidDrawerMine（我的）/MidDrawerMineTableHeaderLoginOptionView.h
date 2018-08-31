//
//  MidDrawerMineTableHeaderLoginOptionView.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/31.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark 我的 TableHeaderView 登录操作View（登录、活动中心、会员中心）

typedef enum : NSUInteger {
    LoginOptionViewLogin = 0,
    LoginOptionViewActivity,
    LoginOptionViewVIP
} LoginOptionViewClickType;

@interface MidDrawerMineTableHeaderLoginOptionView : UIView

@property (nonatomic, copy) void(^clickBlock)(LoginOptionViewClickType type);

@end
