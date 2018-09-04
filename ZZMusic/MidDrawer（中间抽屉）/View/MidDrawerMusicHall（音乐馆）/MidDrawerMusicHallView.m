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
#import "MidDrawerMusicHallCollectionViewVideoCell.h"
#import "MidDrawerMusicHallCollectionViewRoundCell.h"
#import "MidDrawerMusicHallCollectionViewColumnCell.h"
#import "MidDrawerMusicHallCollectionViewLiveBroadCastCell.h"
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
    MidDrawerBaseModel *model = self.dataArray[section];
    
    if ([model.sectionType isEqualToString:@"SongList"] || [model.sectionType isEqualToString:@"Album"] || [model.sectionType isEqualToString:@"Radio"]) {//为你推荐歌单、最新专辑、精选电台
        return 6;
    } else if ([model.sectionType isEqualToString:@"Content"] || [model.sectionType isEqualToString:@"MV"] || [model.sectionType isEqualToString:@"Column"]) {//独家内容、最新MV、专栏
        return 4;
    } else {//乐人
        return 3;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MidDrawerBaseModel *model = self.dataArray[indexPath.section];
    
    if ([model.sectionType isEqualToString:@"SongList"]) {//为你推荐歌单
        MidDrawerMusicHallCollectionViewMusicCell *cell = [MidDrawerMusicHallCollectionViewMusicCell createCellWithCollectionView:collectionView indexPath:indexPath];
        return cell;
    } else if ([model.sectionType isEqualToString:@"Album"]) {//最新专辑
        MidDrawerMusicHallCollectionViewMusicCell *cell = [MidDrawerMusicHallCollectionViewMusicCell createCellWithCollectionView:collectionView indexPath:indexPath];
        cell.isSubTitleVisible = YES;
        return cell;
    } else if ([model.sectionType isEqualToString:@"Content"]) {//独家内容
        MidDrawerMusicHallCollectionViewVideoCell *cell = [MidDrawerMusicHallCollectionViewVideoCell createCellWithCollectionView:collectionView indexPath:indexPath];
        return cell;
    } else if ([model.sectionType isEqualToString:@"Radio"]) {//精选电台
        if (indexPath.row < 3) {
            MidDrawerMusicHallCollectionViewRoundCell *cell = [MidDrawerMusicHallCollectionViewRoundCell createCellWithCollectionView:collectionView indexPath:indexPath];
            return cell;
        } else {
            MidDrawerMusicHallCollectionViewLiveBroadCastCell *cell = [MidDrawerMusicHallCollectionViewLiveBroadCastCell createCellWithCollectionView:collectionView indexPath:indexPath];
            return cell;
        }
    } else if ([model.sectionType isEqualToString:@"MV"]) {//最新MV
        MidDrawerMusicHallCollectionViewVideoCell *cell = [MidDrawerMusicHallCollectionViewVideoCell createCellWithCollectionView:collectionView indexPath:indexPath];
        cell.isSubTitleVisible = YES;
        return cell;
    } else if ([model.sectionType isEqualToString:@"Column"]) {//专栏
        MidDrawerMusicHallCollectionViewColumnCell *cell = [MidDrawerMusicHallCollectionViewColumnCell createCellWithCollectionView:collectionView indexPath:indexPath];
        return cell;
    } else {//乐人
        MidDrawerMusicHallCollectionViewMusicCell *cell = [MidDrawerMusicHallCollectionViewMusicCell createCellWithCollectionView:collectionView indexPath:indexPath];
        cell.isSubTitleVisible = YES;
        return cell;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    MidDrawerBaseModel *model = self.dataArray[indexPath.section];
    
    if ([model.sectionType isEqualToString:@"SongList"] || [model.sectionType isEqualToString:@"Album"] || [model.sectionType isEqualToString:@"Musician"]) {//为你推荐歌单、最新专辑、乐人
        return CGSizeMake(fontSizeScale(124), BANNER_HEIGHT+fontSizeScale(30));
    } else if ([model.sectionType isEqualToString:@"Content"]) {//独家内容
        return CGSizeMake(fontSizeScale(186), BANNER_HEIGHT);
    } else if ([model.sectionType isEqualToString:@"Radio"]) {//精选电台
        return CGSizeMake(fontSizeScale(124), BANNER_HEIGHT+fontSizeScale(40));
    } else if ([model.sectionType isEqualToString:@"MV"]) {//最新MV
        return CGSizeMake(fontSizeScale(186), BANNER_HEIGHT);
    } else {//专栏
        return CGSizeMake(fontSizeScale(186), BANNER_HEIGHT-fontSizeScale(20));
    }
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
        MidDrawerBaseModel *model = self.dataArray[indexPath.section];
        sectionHeaderView.titleText = model.sectionTitle;
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
        [_collectionView registerClass:[MidDrawerMusicHallCollectionViewVideoCell class] forCellWithReuseIdentifier:@"MidDrawerMusicHallCollectionViewVideoCellID"];
        [_collectionView registerClass:[MidDrawerMusicHallCollectionViewRoundCell class] forCellWithReuseIdentifier:@"MidDrawerMusicHallCollectionViewRoundCellID"];
        [_collectionView registerClass:[MidDrawerMusicHallCollectionViewColumnCell class] forCellWithReuseIdentifier:@"MidDrawerMusicHallCollectionViewColumnCellID"];
        [_collectionView registerClass:[MidDrawerMusicHallCollectionViewLiveBroadCastCell class] forCellWithReuseIdentifier:@"MidDrawerMusicHallCollectionViewLiveBroadCastCellID"];
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
        NSMutableArray *resultArr = [NSMutableArray arrayWithCapacity:0];
        
        NSArray *tmpArray = @[@{@"sectionTitle":@"为你推荐歌单",@"sectionType":@"SongList"}, @{@"sectionTitle":@"最新专辑",@"sectionType":@"Album"}, @{@"sectionTitle":@"独家内容",@"sectionType":@"Content"}, @{@"sectionTitle":@"精选电台",@"sectionType":@"Radio"}, @{@"sectionTitle":@"最新MV",@"sectionType":@"MV"}, @{@"sectionTitle":@"专栏",@"sectionType":@"Column"}, @{@"sectionTitle":@"乐人",@"sectionType":@"Musician"}];
        
        for (NSDictionary *dict in tmpArray) {
            MidDrawerBaseModel *model = [[MidDrawerBaseModel alloc] init];
            [model setValuesForKeysWithDictionary:dict];
            [resultArr addObject:model];
        }
        
        _dataArray = [NSArray arrayWithArray:resultArr];
    }
    return _dataArray;
}

@end
