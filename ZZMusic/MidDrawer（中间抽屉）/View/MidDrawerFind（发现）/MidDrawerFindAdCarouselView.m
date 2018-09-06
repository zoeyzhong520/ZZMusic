//
//  MidDrawerFindAdCarouselView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/5.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerFindAdCarouselView.h"

@interface MidDrawerFindAdCarouselView ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
///pageControl
@property (nonatomic, strong) UIPageControl *pageControl;
///图片数组
@property (nonatomic, strong) NSArray *images;

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
    
    UIImageView *imgView = [UIImageView createImageViewWithImg:@""];
    imgView.frame = cell.bounds;
    [imgView sd_setImageWithURL:[NSURL URLWithString:self.images[indexPath.row]] placeholderImage:PLACEHOLDER_IMAGE];
    [cell addSubview:imgView];
    
    return cell;
}

#pragma mark UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger currentIndex = scrollView.contentOffset.x/scrollView.bounds.size.width;
    self.pageControl.currentPage = currentIndex;
}

#pragma mark Lazy
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(self.bounds.size.width, FIND_BANNER_HEIGHT);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, FIND_BANNER_HEIGHT) collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
//        _collectionView.bounces = NO;
        _collectionView.contentSize = CGSizeMake(self.images.count*_collectionView.bounds.size.width, FIND_BANNER_HEIGHT);
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];
    }
    return _collectionView;
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
