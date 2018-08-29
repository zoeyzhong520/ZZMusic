//
//  MidDrawerView.m
//  ZZMusic
//
//  Created by 仲召俊 on 2018/8/26.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerView.h"
#import "MidDrawerMineView.h"
#import "MidDrawerMusicHallView.h"
#import "MidDrawerFindView.h"

@interface MidDrawerView ()

///滚动视图
@property (nonatomic, strong) ZZMusicScrollView *scrollView;
///我的
@property (nonatomic, strong) MidDrawerMineView *mineView;
///音乐馆
@property (nonatomic, strong) MidDrawerMusicHallView *musicHallView;
///发现
@property (nonatomic, strong) MidDrawerFindView *findView;

@end

@implementation MidDrawerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    [self addSubview:self.scrollView];
    
    [self.scrollView addSubview:self.mineView];
    [self.scrollView addSubview:self.musicHallView];
    [self.scrollView addSubview:self.findView];
}

#pragma mark Lazy
- (ZZMusicScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[ZZMusicScrollView alloc] initWithFrame:self.bounds];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*3, self.bounds.size.height);
        _scrollView.bounces = NO;
    }
    return _scrollView;
}

- (MidDrawerMineView *)mineView {
    if (!_mineView) {
        _mineView = [[MidDrawerMineView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.bounds.size.height)];
    }
    return _mineView;
}

- (MidDrawerMusicHallView *)musicHallView {
    if (!_musicHallView) {
        _musicHallView = [[MidDrawerMusicHallView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, self.bounds.size.height)];
    }
    return _musicHallView;
}

- (MidDrawerFindView *)findView {
    if (!_findView) {
        _findView = [[MidDrawerFindView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*2, 0, SCREEN_WIDTH, self.bounds.size.height)];
    }
    return _findView;
}

@end
