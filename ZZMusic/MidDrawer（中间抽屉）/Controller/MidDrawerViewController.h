//
//  MidDrawerViewController.h
//  ZZMusic
//
//  Created by 仲召俊 on 2018/8/26.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "BaseViewController.h"

@interface MidDrawerViewController : BaseViewController

///添加到midDrawerView的蒙层
@property (nonatomic, strong) UIView *mongolianView;

@property (nonatomic, strong) BaseNavigationBar *navigationBar;

///点击蒙层
@property (nonatomic, copy) dispatch_block_t clickMongolianView;

@end
