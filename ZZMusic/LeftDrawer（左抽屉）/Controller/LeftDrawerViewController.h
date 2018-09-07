//
//  LeftDrawerViewController.h
//  ZZMusic
//
//  Created by 仲召俊 on 2018/8/26.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "BaseViewController.h"
#import "LeftDrawerFooterView.h"
#import "LeftDrawerView.h"

@interface LeftDrawerViewController : BaseViewController

@property (nonatomic, strong) LeftDrawerFooterView *footerView;

@property (nonatomic, strong) LeftDrawerView *leftDrawerView;

@end
