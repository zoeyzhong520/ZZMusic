//
//  MidDrawerViewControllerViewModel.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/10.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerViewControllerViewModel.h"

@implementation MidDrawerViewControllerViewModel

+ (void)handleMidDrawerMineViewClickBlockWithType:(MidDrawerMineViewClickType)type vc:(MidDrawerViewController *)vc {
    
    switch (type) {
        case MidDrawerMineViewLogin:
            
            break;
        case MidDrawerMineViewActivity:
            
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

@end
