//
//  BaseNavigationController.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/7.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setPage];
}

- (void)setPage {
    //设置返回按钮颜色
    self.navigationBar.tintColor = BLACK_TEXTCOLOR;
    
    //设置导航栏字体
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:BIG_FONT, NSForegroundColorAttributeName:BLACK_TEXTCOLOR}];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
