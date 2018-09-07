//
//  RootViewControllerViewModel.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/7.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RootViewController.h"

@interface RootViewControllerViewModel : NSObject

+ (void)handleLeftDrawerFooterViewBlockWithType:(LeftDrawerFooterClickType)clickType vc:(RootViewController *)vc;

+ (void)handleLeftDrawerViewBlockWithType:(LeftDrawerViewClickType)clickType vc:(RootViewController *)vc;

@end
