//
//  MidDrawerSingerDetailView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/14.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerSingerDetailView.h"
#import "MidDrawerSingerDetailSingleSongView.h"
#import "MidDrawerSingerDetailAlbumView.h"
#import "MidDrawerSingerDetailMVView.h"
#import "MidDrawerSingerDetailIntroductionView.h"

@interface MidDrawerSingerDetailView ()<UIScrollViewDelegate>

///scrollView
@property (nonatomic, strong) UIScrollView *scrollView;
///singleSongView
@property (nonatomic, strong) MidDrawerSingerDetailSingleSongView *singleSongView;
///albumView
@property (nonatomic, strong) MidDrawerSingerDetailAlbumView *albumView;
///mvView
@property (nonatomic, strong) MidDrawerSingerDetailMVView *mvView;
///introductionView
@property (nonatomic, strong) MidDrawerSingerDetailIntroductionView *introductionView;

@end

@implementation MidDrawerSingerDetailView

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
    [self.scrollView addSubview:self.albumView];
    [self.scrollView addSubview:self.mvView];
    [self.scrollView addSubview:self.introductionView];
}

//设置Delegate
- (void)createDelegateWithIndex:(NSInteger)index {
    if (self.delegate && [self.delegate respondsToSelector:@selector(scrollViewDidEndDeceleratingWithIndex:)]) {
        [self.delegate scrollViewDidEndDeceleratingWithIndex:index];
    }
}

- (void)createDelegateWithScrollView:(UIScrollView *)scrollView {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didScrollWithScrollView:)]) {
        [self.delegate didScrollWithScrollView:scrollView];
    }
}

#pragma mark UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger currentIndex = scrollView.contentOffset.x/self.bounds.size.width;
    [self createDelegateWithIndex:currentIndex];
}

#pragma mark Setter
- (void)setCurrentIndex:(NSInteger)currentIndex {
    [self.scrollView setContentOffset:CGPointMake(self.bounds.size.width*currentIndex, 0) animated:NO];
}

#pragma mark Lazy
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.pagingEnabled = YES;
        _scrollView.contentSize = CGSizeMake(self.bounds.size.width*4, 0);
        _scrollView.contentOffset = CGPointMake(0, 0);
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.bounces = NO;
        _scrollView.delegate = self;
    }
    return _scrollView;
}

- (MidDrawerSingerDetailSingleSongView *)singleSongView {
    if (!_singleSongView) {
        _singleSongView = [[MidDrawerSingerDetailSingleSongView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        WeakSelf;
        _singleSongView.scrollBlock = ^(UIScrollView *scrollView) {
            [weakSelf createDelegateWithScrollView:scrollView];
        };
    }
    return _singleSongView;
}

- (MidDrawerSingerDetailAlbumView *)albumView {
    if (!_albumView) {
        _albumView = [[MidDrawerSingerDetailAlbumView alloc] initWithFrame:CGRectMake(self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height)];
    }
    return _albumView;
}

- (MidDrawerSingerDetailMVView *)mvView {
    if (!_mvView) {
        _mvView = [[MidDrawerSingerDetailMVView alloc] initWithFrame:CGRectMake(self.bounds.size.width*2, 0, self.bounds.size.width, self.bounds.size.height)];
    }
    return _mvView;
}

- (MidDrawerSingerDetailIntroductionView *)introductionView {
    if (!_introductionView) {
        _introductionView = [[MidDrawerSingerDetailIntroductionView alloc] initWithFrame:CGRectMake(self.bounds.size.width*3, 0, self.bounds.size.width, self.bounds.size.height)];
    }
    return _introductionView;
}

@end
