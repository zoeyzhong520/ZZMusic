//
//  EnumMacro.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/7.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#ifndef EnumMacro_h
#define EnumMacro_h

//枚举类的宏
typedef enum : NSUInteger {
    LeftDrawerViewPersonalityDress = 0,
    LeftDrawerViewMessageCenter,
    LeftDrawerViewFreeTrafficService,
    LeftDrawerViewSongPreference,
    LeftDrawerViewNetDisc,
    LeftDrawerViewCleanSpace,
    LeftDrawerViewHelp,
    LeftDrawerViewAbout
} LeftDrawerViewClickType;

typedef enum : NSUInteger {
    Setting = 0,
    Login = 1
} LeftDrawerFooterClickType;

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

typedef enum : NSUInteger {
    MidDrawerAllMusicViewSinger = 0,
    MidDrawerAllMusicViewAlbum
} MidDrawerAllMusicViewClickType;

typedef enum : NSUInteger {
    MidDrawerMusicHallViewSinger = 0,
    MidDrawerMusicHallViewRanking,
    MidDrawerMusicHallViewCategorySongList,
    MidDrawerMusicHallViewRadio,
    MidDrawerMusicHallViewVideo,
    MidDrawerMusicHallViewPersonalityRadio,
    MidDrawerMusicHallViewDigitalAlbum,
    MidDrawerMusicHallViewNewSongNewAlbum,
    MidDrawerMusicHallViewRecommengSongList,
    MidDrawerMusicHallViewNewestAlbum,
    MidDrawerMusicHallViewExclusiveContent,
    MidDrawerMusicHallViewFeaturedRadio,
    MidDrawerMusicHallViewMV,
    MidDrawerMusicHallViewColumn,
    MidDrawerMusicHallViewMusician
} MidDrawerMusicHallViewClickType;

#endif /* EnumMacro_h */
