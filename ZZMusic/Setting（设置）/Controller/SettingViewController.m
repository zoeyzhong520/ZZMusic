//
//  SettingViewController.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/28.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingView.h"

@interface SettingViewController ()

@property (nonatomic, strong) SettingView *settingView;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setPage];
}

- (void)setPage {
    self.title = @"设置";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.settingView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Lazy
- (SettingView *)settingView {
    if (!_settingView) {
        _settingView = [[SettingView alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT + NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, CONTENT_HEIGHT)];
    }
    return _settingView;
}

@end
