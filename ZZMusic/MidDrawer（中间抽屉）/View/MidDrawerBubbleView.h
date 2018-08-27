//
//  MidDrawerBubbleView.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/27.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark 中间抽屉-气泡视图

@interface MidDrawerBubbleView : UIView

///sourceView
@property (nonatomic, strong) UIView *sourceView;

///initWithTitles
- (instancetype)initWithTitles:(NSArray *)titles images:(NSArray *)images;

///显示
- (void)show;

///隐藏
- (void)hide;

@end
