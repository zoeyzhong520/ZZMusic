//
//  MidDrawerViewControllerViewModel.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/10.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MidDrawerViewController.h"

@interface MidDrawerViewControllerViewModel : NSObject

+ (void)handleMidDrawerMineViewClickBlockWithType:(MidDrawerMineViewClickType)type vc:(MidDrawerViewController *)vc;

@end
