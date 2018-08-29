//
//  MidDrawerViewController.m
//  ZZMusic
//
//  Created by 仲召俊 on 2018/8/26.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerViewController.h"
#import "MidDrawerView.h"

@interface MidDrawerViewController ()<UINavigationControllerDelegate>

@property (nonatomic, strong) MidDrawerView *midDrawerView;

@end

@implementation MidDrawerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setPage];
}

- (void)setPage {
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.navigationBar];
    
    [self.view addSubview:self.midDrawerView];
    
    [self.view addSubview:self.mongolianView];
}

//设置气泡视图
- (void)addBubbleView {
    MidDrawerBubbleView *bubbleView = [[MidDrawerBubbleView alloc] initWithTitles:@[@"听歌识曲", @"扫一扫", @"视频海报"] images:@[@"听歌识曲", @"扫一扫", @"视频海报"]];
    [bubbleView show];
    UIView *sourceView = [UIView createViewWithBackgroundColor:[UIColor whiteColor]];
    sourceView.frame = CGRectMake(SCREEN_WIDTH - fontSizeScale(48), STATUS_BAR_HEIGHT, fontSizeScale(48), fontSizeScale(48));
    bubbleView.sourceView = sourceView;
}

//点击事件
- (void)tapMongolianView {
    if (self.clickMongolianView) { self.clickMongolianView(); }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Lazy
- (BaseNavigationBar *)navigationBar {
    if (!_navigationBar) {
        _navigationBar = [[BaseNavigationBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, STATUS_BAR_HEIGHT + NAVIGATION_BAR_HEIGHT)];
        WeakSelf;
        _navigationBar.rightButtonClickBlock = ^{ [weakSelf addBubbleView]; };
    }
    return _navigationBar;
}

- (UIView *)mongolianView {
    if (!_mongolianView) {
        _mongolianView = [UIView createViewWithBackgroundColor:MONGOLIANLAYER_COLOR];
        _mongolianView.hidden = YES;
        _mongolianView.frame = SCREEN_RECT;
        [_mongolianView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMongolianView)]];
    }
    return _mongolianView;
}

- (MidDrawerView *)midDrawerView {
    if (!_midDrawerView) {
        _midDrawerView = [[MidDrawerView alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT + NAVIGATION_BAR_HEIGHT, self.view.bounds.size.width, CONTENT_HEIGHT)];
    }
    return _midDrawerView;
}

@end
