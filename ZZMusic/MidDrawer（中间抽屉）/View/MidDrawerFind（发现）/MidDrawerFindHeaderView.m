//
//  MidDrawerFindHeaderView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/5.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerFindHeaderView.h"
#import "MidDrawerFindAdCarouselView.h"
#import "MidDrawerFindHeaderCollectionViewCell.h"

@interface MidDrawerFindHeaderView ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

///广告-轮播
@property (nonatomic, strong) MidDrawerFindAdCarouselView *adCarouselView;
///数据源
@property (nonatomic, strong) NSArray *dataArray;
///底部分割线
@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation MidDrawerFindHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    [self addSubview:self.adCarouselView];
    
    [self addSubview:self.collectionView];
    [self.collectionView reloadData];
    
    [self addSubview:self.lineView];
    
    [self addConstraints];
}

//添加约束
- (void)addConstraints {
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(fontSizeScale(5));
    }];
}

#pragma mark UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 15;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MidDrawerFindHeaderCollectionViewCell *cell = [MidDrawerFindHeaderCollectionViewCell createCellWithCollectionView:collectionView indexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark Lazy
- (MidDrawerFindAdCarouselView *)adCarouselView {
    if (!_adCarouselView) {
        _adCarouselView = [[MidDrawerFindAdCarouselView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, FIND_BANNER_HEIGHT) images:@[BANNER_IMAGEPATH_FIRST,BANNER_IMAGEPATH_SECOND,BANNER_IMAGEPATH_THIRD,BANNER_IMAGEPATH_FOURTH,BANNER_IMAGEPATH_FIFTH,BANNER_IMAGEPATH_SIXTH]];
    }
    return _adCarouselView;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        CGFloat itemHeight = fontSizeScale(90);
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(fontSizeScale(60), itemHeight);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing = 0;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.adCarouselView.frame), self.bounds.size.width, itemHeight) collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[MidDrawerFindHeaderCollectionViewCell class] forCellWithReuseIdentifier:@"MidDrawerFindHeaderCollectionViewCellID"];
    }
    return _collectionView;
}

- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSArray array];
    }
    return _dataArray;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView createViewWithBackgroundColor:LINE_COLOR];
    }
    return _lineView;
}

@end
