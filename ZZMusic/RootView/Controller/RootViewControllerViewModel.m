//
//  RootViewControllerViewModel.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/7.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "RootViewControllerViewModel.h"

@implementation RootViewControllerViewModel

+ (void)handleLeftDrawerFooterViewBlockWithType:(LeftDrawerFooterClickType)clickType vc:(RootViewController *)vc {
    
    [vc hideLeftDrawer:nil];
    
    switch (clickType) {
        case Setting:
            [vc.midDrawerView showViewControllerWithClassName:@"SettingViewController"];
            break;
        case Login:
            [vc presentLoginViewController];
            break;
        default:
            break;
    }
}

+ (void)handleLeftDrawerViewBlockWithType:(LeftDrawerViewClickType)clickType vc:(RootViewController *)vc {
    
    [vc hideLeftDrawer:nil];
    
    switch (clickType) {
        case LeftDrawerViewPersonalityDress:
            [vc showWebViewControllerWithUrl:@""];
            break;
        case LeftDrawerViewMessageCenter:
            
            break;
        case LeftDrawerViewFreeTrafficService:
            [vc showWebViewControllerWithUrl:@""];
            break;
        case LeftDrawerViewSongPreference:
            
            break;
        case LeftDrawerViewNetDisc:
            
            break;
        case LeftDrawerViewCleanSpace:
            [vc showViewControllerWithClassName:@"CleanSpaceViewController"];
            break;
        case LeftDrawerViewHelp:
            [vc showWebViewControllerWithUrl:@""];
            break;
        case LeftDrawerViewAbout:
            [vc showViewControllerWithClassName:@"AboutViewController"];
            break;
        default:
            break;
    }
}

@end
