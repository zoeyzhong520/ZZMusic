//
//  MidDrawerAllMusicView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/10.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerAllMusicView.h"
#import "MidDrawerAllMusicSingleView.h"
#import "MidDrawerAllMusicSingerView.h"
#import "MidDrawerAllMusicAlbumView.h"

@interface MidDrawerAllMusicView ()

///scrollView
@property (nonatomic, strong) UIScrollView *scrollView;
///单曲View
@property (nonatomic, strong) MidDrawerAllMusicSingleView *singleSongView;
///歌手View
@property (nonatomic, strong) MidDrawerAllMusicSingerView *singerView;
///专辑View
@property (nonatomic, strong) MidDrawerAllMusicAlbumView *albumView;

@end

@implementation MidDrawerAllMusicView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    [self addSubview:self.scrollView];
    
    [self.scrollView addSubview:self.singleSongView];
    [self.scrollView addSubview:self.singerView];
    [self.scrollView addSubview:self.albumView];
}

//设置Block
- (void)createBlock:(MidDrawerAllMusicViewClickType)type {
    if (self.clickBlock) {
        self.clickBlock(type);
    }
}

#pragma mark Setter
- (void)setCurrentIndex:(NSInteger)currentIndex {
    [self.scrollView setContentOffset:CGPointMake(currentIndex*SCREEN_WIDTH, 0) animated:NO];
}

#pragma mark Lazy
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*3, self.bounds.size.height);
        _scrollView.contentOffset = CGPointMake(0, 0);
        _scrollView.bounces = NO;
        _scrollView.scrollEnabled = NO;
    }
    return _scrollView;
}

- (MidDrawerAllMusicSingleView *)singleSongView {
    if (!_singleSongView) {
        _singleSongView = [[MidDrawerAllMusicSingleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.bounds.size.height)];
    }
    return _singleSongView;
}

- (MidDrawerAllMusicSingerView *)singerView {
    if (!_singerView) {
        _singerView = [[MidDrawerAllMusicSingerView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, self.bounds.size.height)];
        WeakSelf;
        _singerView.clickBlock = ^{
            [weakSelf createBlock:MidDrawerAllMusicViewSinger];
        };
    }
    return _singerView;
}

- (MidDrawerAllMusicAlbumView *)albumView {
    if (!_albumView) {
        _albumView = [[MidDrawerAllMusicAlbumView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*2, 0, SCREEN_WIDTH, self.bounds.size.height)];
        WeakSelf;
        _albumView.clickBlock = ^{
            [weakSelf createBlock:MidDrawerAllMusicViewAlbum];
        };
    }
    return _albumView;
}

@end
