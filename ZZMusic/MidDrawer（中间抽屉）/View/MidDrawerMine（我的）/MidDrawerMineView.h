//
//  MidDrawerMineView.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/29.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark 我的

typedef enum : NSUInteger {
    MidDrawerMineViewLogin = 0,
    MidDrawerMineViewActivity,
    MidDrawerMineViewVIP,
    MidDrawerMineViewAllMusic,
    MidDrawerMineViewDownload,
    MidDrawerMineViewRecentlyPlayed,
    MidDrawerMineViewLike,
    MidDrawerMineViewPurchasedMusic,
    MidDrawerMineViewRunningStation,
    MidDrawerMineViewSelfBuildSongList,
    MidDrawerMineViewCollectionSongList,
    MidDrawerMineViewAdd,
    MidDrawerMineViewManage,
    MidDrawerMineViewCellClick
} MidDrawerMineViewClickType;

@interface MidDrawerMineView : UIView

@property (nonatomic, copy) void(^clickBlock)(MidDrawerMineViewClickType type);

@end
