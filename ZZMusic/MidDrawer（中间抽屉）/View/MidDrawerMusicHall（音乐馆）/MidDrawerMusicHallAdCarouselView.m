//
//  MidDrawerMusicHallAdCarouselView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/3.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerMusicHallAdCarouselView.h"

@interface MidDrawerMusicHallAdCarouselView ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
///图片数组
@property (nonatomic, strong) NSArray *images;
///图片总数
@property (nonatomic, assign) NSInteger imageCount;
///页数指示控件
@property (nonatomic, strong) UIPageControl *pageControl;
///当前图片索引
@property (nonatomic, assign) NSInteger currentImageIndex;
///左边imageView
@property (nonatomic, strong) UIImageView *leftImageView;
///中间imageView
@property (nonatomic, strong) UIImageView *centerImageView;
///右边imageView
@property (nonatomic, strong) UIImageView *rightImageView;

@end

@implementation MidDrawerMusicHallAdCarouselView

- (instancetype)initWithFrame:(CGRect)frame images:(NSArray *)images {
    self = [super initWithFrame:frame];
    if (self) {
        self.images = images;
        self.imageCount = images.count;
        self.currentImageIndex = 0;
        [self createView];
    }
    return self;
}

- (void)createView {
    [self addSubview:self.scrollView];
    
    [self.scrollView addSubview:self.leftImageView];
    [self.scrollView addSubview:self.centerImageView];
    [self.scrollView addSubview:self.rightImageView];
    
    [self addSubview:self.pageControl];
    [self addConstraints];
}

- (void)addConstraints {
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.height.mas_equalTo(fontSizeScale(30));
    }];
}

//重新加载图片
- (void)reloadImages {
    NSInteger leftImageIndex, rightImageIndex;
    CGPoint offSet = self.scrollView.contentOffset;
    
    if (offSet.x > SCREEN_WIDTH) {//向右滑动
        _currentImageIndex = (_currentImageIndex+1)%_imageCount;
    } else if (offSet.x < SCREEN_WIDTH) {//向左滑动
        _currentImageIndex = (_currentImageIndex+_imageCount-1)%_imageCount;
    }
    
    [self.centerImageView sd_setImageWithURL:[NSURL URLWithString:_images[_currentImageIndex]] placeholderImage:PLACEHOLDER_IMAGE];
    //重新设置左右图片
    leftImageIndex = (_currentImageIndex+_imageCount-1)%_imageCount;
    rightImageIndex = (_currentImageIndex+1)%_imageCount;
    [self.leftImageView sd_setImageWithURL:[NSURL URLWithString:_images[leftImageIndex]] placeholderImage:PLACEHOLDER_IMAGE];
    [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:_images[rightImageIndex]] placeholderImage:PLACEHOLDER_IMAGE];
}

#pragma mark UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //重新加载图片
    [self reloadImages];
    //移动到中间
    [scrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:NO];
    //设置分页
    self.pageControl.currentPage = _currentImageIndex;
    NSLog(@"_currentImageInde = %ld", _currentImageIndex);
}

#pragma mark Lazy
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
        _scrollView.pagingEnabled = YES;
        _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*self.images.count, self.bounds.size.height);
        _scrollView.delegate = self;
        _scrollView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollView;
}

- (NSArray *)images {
    if (!_images) {
        _images = [NSArray array];
    }
    return _images;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [UIPageControl new];
        _pageControl.numberOfPages = self.images.count;
        _pageControl.currentPage = self.currentImageIndex;
    }
    return _pageControl;
}

- (UIImageView *)leftImageView {
    if (!_leftImageView) {
        _leftImageView = [UIImageView createImageViewWithImg:@""];
        [_leftImageView sd_setImageWithURL:[NSURL URLWithString:_images.count > 1 ? _images[_imageCount-1] : @""] placeholderImage:PLACEHOLDER_IMAGE];
        _leftImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.bounds.size.height);
    }
    return _leftImageView;
}

- (UIImageView *)centerImageView {
    if (!_centerImageView) {
        _centerImageView = [UIImageView createImageViewWithImg:@""];
        [_centerImageView sd_setImageWithURL:[NSURL URLWithString:_images.count > 0 ? _images[0] : @""] placeholderImage:PLACEHOLDER_IMAGE];
        _centerImageView.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, self.bounds.size.height);
    }
    return _centerImageView;
}

- (UIImageView *)rightImageView {
    if (!_rightImageView) {
        _rightImageView = [UIImageView createImageViewWithImg:@""];
        [_rightImageView sd_setImageWithURL:[NSURL URLWithString:_images.count > 1 ? _images[1] : @""] placeholderImage:PLACEHOLDER_IMAGE];
        _rightImageView.frame = CGRectMake(SCREEN_WIDTH*2, 0, SCREEN_WIDTH, self.bounds.size.height);
    }
    return _rightImageView;
}

@end
