//
//  MidDrawerAllMusicViewControllerViewModel.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/13.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerAllMusicViewControllerViewModel.h"

@implementation MidDrawerAllMusicViewControllerViewModel

+ (void)handleMidDrawerAllMusicViewBlockWithType:(MidDrawerAllMusicViewClickType)type vc:(UIViewController *)vc {
    
    switch (type) {
        case MidDrawerAllMusicViewSinger:
            [vc showViewControllerWithClassName:@"MidDrawerAllMusicDetailViewController"];
            break;
        case MidDrawerAllMusicViewAlbum:
            [vc showViewControllerWithClassName:@"MidDrawerAllMusicDetailViewController"];
            break;
        default:
            break;
    }
}

@end
