//
//  MidDrawerViewControllerViewModel.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/10.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerViewControllerViewModel.h"

@implementation MidDrawerViewControllerViewModel

+ (void)handleMidDrawerMineViewClickBlockWithType:(MidDrawerMineViewClickType)type vc:(UIViewController *)vc {
    
    switch (type) {
        case MidDrawerMineViewLogin:
            [vc presentLoginViewController];
            break;
        case MidDrawerMineViewActivity:
            [vc showWebViewControllerWithUrl:@""];
            break;
        case MidDrawerMineViewVIP:
            [vc showWebViewControllerWithUrl:@""];
            break;
        case MidDrawerMineViewAllMusic:
            [vc showViewControllerWithClassName:@"MidDrawerAllMusicViewController"];
            break;
        case MidDrawerMineViewDownload:
            [vc showViewControllerWithClassName:@"MidDrawerDownloadMusicViewController"];
            break;
        case MidDrawerMineViewRecentlyPlayed:
            [vc showViewControllerWithClassName:@"MidDrawerRecentlyPlayedViewController"];
            break;
        case MidDrawerMineViewLike:
            
            break;
        case MidDrawerMineViewPurchasedMusic:
            
            break;
        case MidDrawerMineViewRunningStation:
            
            break;
        case MidDrawerMineViewAdd:
            
            break;
        case MidDrawerMineViewManage:
            
            break;
        case MidDrawerMineViewCellClick:
            
            break;
        default:
            break;
    }
}

+ (void)handleMidDrawerMusicHallViewClickBlockWithType:(MidDrawerMusicHallViewClickType)type vc:(UIViewController *)vc {
    
    switch (type) {
        case MidDrawerMusicHallViewSinger:
            [vc showViewControllerWithClassName:@"MidDrawerSingerViewController"];
            break;
        case MidDrawerMusicHallViewRanking:
            [vc showViewControllerWithClassName:@"MidDrawerRankingViewController"];
            break;
        case MidDrawerMusicHallViewCategorySongList:
            [vc showWebViewControllerWithUrl:@""];
            break;
        case MidDrawerMusicHallViewRadio:
            
            break;
        case MidDrawerMusicHallViewVideo:
            [vc showWebViewControllerWithUrl:@""];
            break;
        case MidDrawerMusicHallViewPersonalityRadio:
            
            break;
        case MidDrawerMusicHallViewNewSongNewAlbum:
            
            break;
        case MidDrawerMusicHallViewDigitalAlbum:
            [vc showWebViewControllerWithUrl:@""];
            break;
        case MidDrawerMusicHallViewRecommengSongList:
            
            break;
        case MidDrawerMusicHallViewNewestAlbum:
            
            break;
        case MidDrawerMusicHallViewExclusiveContent:
            
            break;
        case MidDrawerMusicHallViewFeaturedRadio:
            
            break;
        case MidDrawerMusicHallViewMV:
            
            break;
        case MidDrawerMusicHallViewColumn:
            
            break;
        case MidDrawerMusicHallViewMusician:
            
            break;
        default:
            break;
    }
}

@end
