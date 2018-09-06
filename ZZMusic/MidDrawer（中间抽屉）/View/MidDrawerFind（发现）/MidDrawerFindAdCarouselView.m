//
//  MidDrawerFindAdCarouselView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/5.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerFindAdCarouselView.h"

CGFloat const HorizontalMargin = 15.0;
CGFloat const ItemMargin = 7.0;

@interface MidDrawerFindAdCarouselView ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
///pageControl
@property (nonatomic, strong) UIPageControl *pageControl;
///图片数组
@property (nonatomic, strong) NSArray *images;
///透明底色的scrollView
@property (nonatomic, strong) UIScrollView *panScrollView;

@end

@implementation MidDrawerFindAdCarouselView

- (instancetype)initWithFrame:(CGRect)frame images:(NSArray *)images {
    self = [super initWithFrame:frame];
    if (self) {
        self.images = images;
        [self createView];
    }
    return self;
}

- (void)createView {
    [self addSubview:self.collectionView];
    [self.collectionView reloadData];
    
    [self addSubview:self.pageControl];
    
    [self addConstraints];
    
    [self addSubview:self.panScrollView];
}

//添加约束
- (void)addConstraints {
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(fontSizeScale(30));
    }];
}

#pragma mark UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    
    UIImageView *imgView = [UIImageView createImageViewWithImg:nil];
    imgView.layer.masksToBounds = YES;
    imgView.layer.cornerRadius = 5.0f;
    [imgView sd_setImageWithURL:[NSURL URLWithString:self.images[indexPath.row]] placeholderImage:PLACEHOLDER_IMAGE];
    [cell.contentView addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(cell.contentView);
    }];
    
    return cell;
}

#pragma mark UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.panScrollView) {
        NSInteger currentIndex = scrollView.contentOffset.x/scrollView.bounds.size.width;
        self.pageControl.currentPage = currentIndex;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.panScrollView) {
        self.collectionView.contentOffset = self.panScrollView.contentOffset;
    }
}

#pragma mark Lazy
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(self.bounds.size.width-HorizontalMargin*2, self.bounds.size.height-ItemMargin*2);
        flowLayout.sectionInset = UIEdgeInsetsMake(0, HorizontalMargin, 0, HorizontalMargin);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing = ItemMargin;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.clipsToBounds = NO;
        _collectionView.alwaysBounceHorizontal = YES;
        [_collectionView addGestureRecognizer:self.panScrollView.panGestureRecognizer];
        _collectionView.panGestureRecognizer.enabled = NO;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];
    }
    return _collectionView;
}

- (UIScrollView *)panScrollView {
    if (!_panScrollView) {
        CGFloat scrollViewW = self.bounds.size.width-HorizontalMargin*2+ItemMargin;
        _panScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake((self.bounds.size.width-scrollViewW)/2, 0, scrollViewW, self.bounds.size.height)];
        _panScrollView.showsHorizontalScrollIndicator = NO;
        _panScrollView.pagingEnabled = YES;
        _panScrollView.alwaysBounceHorizontal = YES;
        _panScrollView.delegate = self;
        _panScrollView.hidden = YES;
        _panScrollView.contentSize = CGSizeMake(scrollViewW*self.images.count, 0);
    }
    return _panScrollView;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.numberOfPages = self.images.count;
        _pageControl.currentPage = 0;
    }
    return _pageControl;
}

- (NSArray *)images {
    if (!_images) {
        _images = [NSArray array];
    }
    return _images;
}

@end
