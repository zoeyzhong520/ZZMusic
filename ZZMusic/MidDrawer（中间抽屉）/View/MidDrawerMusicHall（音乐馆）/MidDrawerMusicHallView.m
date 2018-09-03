//
//  MidDrawerMusicHallView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/29.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerMusicHallView.h"
#import "MidDrawerMusicHallHeaderView.h"
#import "MidDrawerMusicHallCollectionViewCell.h"

@interface MidDrawerMusicHallView ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
///音乐馆-HeaderView
@property (nonatomic, strong) MidDrawerMusicHallHeaderView *headerView;

@end

@implementation MidDrawerMusicHallView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    [self.collectionView addSubview:self.headerView];
    [self addSubview:self.collectionView];
    [self.collectionView reloadData];
}

#pragma mark UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 15;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MidDrawerMusicHallCollectionViewCell *cell = [MidDrawerMusicHallCollectionViewCell createCellWithCollectionView:collectionView indexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(fontSizeScale(98), fontSizeScale(120));
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(fontSizeScale(10), fontSizeScale(10), fontSizeScale(10), fontSizeScale(10));
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return fontSizeScale(10);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return fontSizeScale(10);
}

#pragma mark Lazy
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
        _collectionView.contentInset = UIEdgeInsetsMake(BANNER_HEIGHT*2+fontSizeScale(70), 0, 0, 0);
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[MidDrawerMusicHallCollectionViewCell class] forCellWithReuseIdentifier:@"MidDrawerMusicHallCollectionViewCellID"];
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}

- (MidDrawerMusicHallHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[MidDrawerMusicHallHeaderView alloc] initWithFrame:CGRectMake(0, -(BANNER_HEIGHT*2+fontSizeScale(70)), self.bounds.size.width, BANNER_HEIGHT*2+fontSizeScale(70))];
    }
    return _headerView;
}

@end
