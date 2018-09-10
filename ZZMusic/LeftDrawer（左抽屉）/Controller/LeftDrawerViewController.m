//
//  LeftDrawerViewController.m
//  ZZMusic
//
//  Created by 仲召俊 on 2018/8/26.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "LeftDrawerViewController.h"

@interface LeftDrawerViewController ()

@end

@implementation LeftDrawerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setPage];
}

- (void)setPage {
    [self.view addSubview:self.leftDrawerView];
    
    [self.view addSubview:self.footerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Lazy
- (LeftDrawerView *)leftDrawerView {
    if (!_leftDrawerView) {
        _leftDrawerView = [[LeftDrawerView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width*4/5, self.view.bounds.size.height)];
    }
    return _leftDrawerView;
}

- (LeftDrawerFooterView *)footerView {
    if (!_footerView) {
        _footerView = [[LeftDrawerFooterView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - fontSizeScale(50), self.view.bounds.size.width*4/5, fontSizeScale(50))];
    }
    return _footerView;
}

@end
