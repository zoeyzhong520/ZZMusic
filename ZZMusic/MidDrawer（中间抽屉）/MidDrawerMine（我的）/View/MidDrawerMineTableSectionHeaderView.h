//
//  MidDrawerMineTableSectionHeaderView.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/31.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark 我的 TableView 组头View

typedef enum : NSUInteger {
    MidDrawerMineTableSectionHeaderViewAdd = 0,
    MidDrawerMineTableSectionHeaderViewManage
} MidDrawerMineTableSectionHeaderViewClickType;

@interface MidDrawerMineTableSectionHeaderView : UIView

@property (nonatomic, copy) void(^clickBlock)(MidDrawerMineTableSectionHeaderViewClickType type);

@end
