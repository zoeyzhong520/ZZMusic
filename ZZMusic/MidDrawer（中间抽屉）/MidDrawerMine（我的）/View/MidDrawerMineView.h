//
//  MidDrawerMineView.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/29.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark 我的

@interface MidDrawerMineView : UIView

@property (nonatomic, copy) void(^clickBlock)(MidDrawerMineViewClickType type);

@end
