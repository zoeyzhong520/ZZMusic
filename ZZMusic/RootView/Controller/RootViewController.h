//
//  RootViewController.h
//  ZZMusic
//
//  Created by 仲召俊 on 2018/8/26.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "BaseViewController.h"
#import "LeftDrawerViewController.h"
#import "MidDrawerViewController.h"
#import "BaseNavigationController.h"

@interface RootViewController : BaseViewController

@property (nonatomic, strong) LeftDrawerViewController *leftDrawerView;

@property (nonatomic, strong) MidDrawerViewController *midDrawerView;

- (void)hideLeftDrawer:(UIGestureRecognizer *)gesture;

@end
