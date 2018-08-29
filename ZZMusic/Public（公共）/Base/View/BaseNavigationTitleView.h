//
//  BaseNavigationTitleView.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/29.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNavigationTitleView : UIView

///initWithFrame
- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;

@property (nonatomic, copy) void(^buttonClickBlock)(NSInteger index);
///传入当前应高亮的标签下标
@property (nonatomic, assign) NSInteger selectedIndex;

@end
