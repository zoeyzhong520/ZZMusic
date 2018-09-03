//
//  MidDrawerMusicHallView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/29.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerMusicHallView.h"
#import "MidDrawerMusicHallHeaderView.h"
#import "MidDrawerMusicHallCollectionViewMusicCell.h"
#import "MidDrawerMusicHallSectionHeaderView.h"

@interface MidDrawerMusicHallView ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
///数据源
@property (nonatomic, strong) NSArray *dataArray;
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
    return self.dataArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MidDrawerMusicHallCollectionViewMusicCell *cell = [MidDrawerMusicHallCollectionViewMusicCell createCellWithCollectionView:collectionView indexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(fontSizeScale(124), BANNER_HEIGHT+fontSizeScale(30));
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(fontSizeScale(5), fontSizeScale(0), fontSizeScale(5), fontSizeScale(0));
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return fontSizeScale(10);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return fontSizeScale(0);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        MidDrawerMusicHallSectionHeaderView *sectionHeaderView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:indexPath];
        sectionHeaderView.titleText = self.dataArray[indexPath.section];
        return sectionHeaderView;
    }
    return nil;
}

#pragma mark Lazy
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.headerReferenceSize = CGSizeMake(self.bounds.size.width, fontSizeScale(60));
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
        _collectionView.contentInset = UIEdgeInsetsMake(BANNER_HEIGHT*2+fontSizeScale(110), 0, 0, 0);
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[MidDrawerMusicHallCollectionViewMusicCell class] forCellWithReuseIdentifier:@"MidDrawerMusicHallCollectionViewMusicCellID"];
        [_collectionView registerClass:[MidDrawerMusicHallSectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}

- (MidDrawerMusicHallHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[MidDrawerMusicHallHeaderView alloc] initWithFrame:CGRectMake(0, -(BANNER_HEIGHT*2+fontSizeScale(110)), self.bounds.size.width, BANNER_HEIGHT*2+fontSizeScale(110))];
    }
    return _headerView;
}

- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[@"为你推荐歌单",@"最新专辑",@"独家内容",@"精选电台",@"最新MV",@"专栏",@"乐人"];
    }
    return _dataArray;
}

@end
