//
//  MidDrawerMineTableHeaderView.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/31.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark 我的 TableHeaderView

typedef enum : NSUInteger {
    MidDrawerMineTableHeaderViewLogin = 0,
    MidDrawerMineTableHeaderViewActivity,
    MidDrawerMineTableHeaderViewVIP,
    MidDrawerMineTableHeaderViewAllMusic,
    MidDrawerMineTableHeaderViewDownload,
    MidDrawerMineTableHeaderViewRecentlyPlayed,
    MidDrawerMineTableHeaderViewLike,
    MidDrawerMineTableHeaderViewPurchasedMusic,
    MidDrawerMineTableHeaderViewRunningStation,
    MidDrawerMineTableHeaderViewSelfBuildSongList,
    MidDrawerMineTableHeaderViewCollectionSongList
} MidDrawerMineTableHeaderViewClickType;

@interface MidDrawerMineTableHeaderView : UIView

@property (nonatomic, copy) void(^clickBlock)(MidDrawerMineTableHeaderViewClickType type);

@end
