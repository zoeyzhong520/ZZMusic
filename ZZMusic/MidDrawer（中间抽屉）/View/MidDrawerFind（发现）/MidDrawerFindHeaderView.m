//
//  MidDrawerFindHeaderView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/5.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerFindHeaderView.h"
#import "MidDrawerFindAdCarouselView.h"

@interface MidDrawerFindHeaderView ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

///广告-轮播
@property (nonatomic, strong) MidDrawerFindAdCarouselView *adCarouselView;
///数据源
@property (nonatomic, strong) NSArray *dataArray;

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
}

#pragma mark UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 15;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    cell.backgroundColor = SECTION_BACKGROUNDCOLOR;
    
    UIImageView *imgView = [UIImageView createImageViewWithImg:@""];
    imgView.layer.borderWidth = fontSizeScale(1);
    imgView.layer.borderColor = MAIN_COLOR.CGColor;
    imgView.layer.masksToBounds = YES;
    imgView.layer.cornerRadius = fontSizeScale(25);
    [cell addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(fontSizeScale(20));
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(50), fontSizeScale(50)));
    }];
    
    UILabel *titleLabel = [UILabel createLabelWithText:@"XXX" font:SMALL_FONT textColor:BLACK_TEXTCOLOR];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [cell addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(imgView.mas_bottom).offset(fontSizeScale(5));
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(fontSizeScale(12));
    }];
    
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
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(fontSizeScale(60), fontSizeScale(100));
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, fontSizeScale(2), 0, fontSizeScale(2));
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.adCarouselView.frame), self.bounds.size.width, fontSizeScale(100)) collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];
    }
    return _collectionView;
}

- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSArray array];
    }
    return _dataArray;
}

@end
