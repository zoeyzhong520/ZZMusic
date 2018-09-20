//
//  MidDrawerSingerDetailMVView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/17.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerSingerDetailMVView.h"
#import "MidDrawerSingerDetailMVCollectionViewCell.h"

@interface MidDrawerSingerDetailMVView ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate>

///collectionView
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation MidDrawerSingerDetailMVView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    [self addSubview:self.collectionView];
    [self.collectionView reloadData];
}

//设置Block
- (void)createBlock:(UIScrollView *)scrollView {
    if (self.scrollBlock) {
        self.scrollBlock(scrollView);
    }
}

#pragma mark Setter
- (void)setShouldScrollToTop:(BOOL)shouldScrollToTop {
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionTop animated:NO];
}

#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self createBlock:scrollView];
}

#pragma mark UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 25;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MidDrawerSingerDetailMVCollectionViewCell *cell = [MidDrawerSingerDetailMVCollectionViewCell createCellWithCollectionView:collectionView indexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:indexPath];
        header.backgroundColor = LINE_COLOR;
        return header;
    }
    return nil;
}

#pragma mark Lazy
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(fontSizeScale(186), MUSICHALL_BANNER_HEIGHT);
        layout.headerReferenceSize = CGSizeMake(self.bounds.size.width, fontSizeScale(50));
        layout.sectionInset = UIEdgeInsetsMake(0, 0, fontSizeScale(10), 0);
        layout.minimumInteritemSpacing = fontSizeScale(3);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
        [_collectionView registerClass:[MidDrawerSingerDetailMVCollectionViewCell class] forCellWithReuseIdentifier:@"MidDrawerSingerDetailMVCollectionViewCellID"];
    }
    return _collectionView;
}

@end
