//
//  MidDrawerSingerViewControllerViewModel.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/14.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerSingerViewControllerViewModel.h"

@implementation MidDrawerSingerViewControllerViewModel

+ (void)handleMidDrawerSingerViewClickBlockWithType:(MidDrawerSingerViewClickType)type vc:(UIViewController *)vc {
    
    switch (type) {
        case MidDrawerSingerViewSinger:
            [vc showViewControllerWithClassName:@"MidDrawerSingerDetailViewController"];
            break;
            
        default:
            break;
    }
}

@end
