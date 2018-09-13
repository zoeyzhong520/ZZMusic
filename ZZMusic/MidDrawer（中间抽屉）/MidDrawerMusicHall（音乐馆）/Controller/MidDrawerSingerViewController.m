//
//  MidDrawerSingerViewController.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/13.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerSingerViewController.h"
#import "MidDrawerSingerView.h"

@interface MidDrawerSingerViewController ()

@property (nonatomic, strong) ZZMusicSegmentedControlTitleView *titleView;

@property (nonatomic, strong) MidDrawerSingerView *singerView;

@end

@implementation MidDrawerSingerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setPage];
}

- (void)setPage {
    [self addBarButtonItemWithPosition:Right imgStr:@"search" action:@selector(searchAction)];
    
    self.navigationItem.titleView = self.titleView;
    
    [self.view addSubview:self.singerView];
}

//点击事件
- (void)searchAction {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Lazy
- (ZZMusicSegmentedControlTitleView *)titleView {
    if (!_titleView) {
        _titleView = [[ZZMusicSegmentedControlTitleView alloc] initWithFrame:CGRectMake((self.view.bounds.size.width-fontSizeScale(140))/2, 0, fontSizeScale(140), fontSizeScale(25)) items:@[@"歌手",@"我的"]];
        WeakSelf;
        _titleView.clickBlock = ^(NSInteger index) {
            
        };
    }
    return _titleView;
}

- (MidDrawerSingerView *)singerView {
    if (!_singerView) {
        _singerView = [[MidDrawerSingerView alloc] initWithFrame:self.view.bounds];
    }
    return _singerView;
}

@end
