//
//  BaseNavigationBar.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/27.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseNavigationTitleView.h"

@interface BaseNavigationBar : UIView

///左侧菜单按钮
@property (nonatomic, copy) dispatch_block_t leftButtonClickBlock;
///右侧气泡视图按钮
@property (nonatomic, copy) dispatch_block_t rightButtonClickBlock;
///titleView
@property (nonatomic, strong) BaseNavigationTitleView *titleView;
///是否显示左边菜单按钮
@property (nonatomic, assign) BOOL isLeftMenuButtonVisible;
///是否显示右边气泡视图按钮
@property (nonatomic, assign) BOOL isRightBubbleButtonVisible;

@end
