//
//  MidDrawerFindNewsDiscoverTableViewCell.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/6.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerFindNewsDiscoverTableViewCell.h"
#import "MidDrawerFindNewsDiscoverCollectionViewCell.h"
#import "MidDrawerFindCollectionViewFlowLayout.h"
#import "MidDrawerFindNewsletterSectionTitleView.h"

@interface MidDrawerFindNewsDiscoverTableViewCell ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

///collectionView
@property (nonatomic, strong) UICollectionView *collectionView;
///SectionTitleView
@property (nonatomic, strong) MidDrawerFindNewsletterSectionTitleView *sectionTitleView;

@end

@implementation MidDrawerFindNewsDiscoverTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    [self.contentView addSubview:self.sectionTitleView];
    
    [self.contentView addSubview:self.collectionView];
    
    [self addConstraints];
}

///添加约束
- (void)addConstraints {
    [self.sectionTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(fontSizeScale(30));
    }];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(fontSizeScale(30), fontSizeScale(10), fontSizeScale(10), 0));
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

#pragma mark UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MidDrawerFindNewsDiscoverCollectionViewCell *cell = [MidDrawerFindNewsDiscoverCollectionViewCell createCellWithCollectionView:collectionView indexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(fontSizeScale(130), self.bounds.size.height-fontSizeScale(40));
}

+ (MidDrawerFindNewsDiscoverTableViewCell *)createCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    
    MidDrawerFindNewsDiscoverTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MidDrawerFindNewsDiscoverTableViewCellID" forIndexPath:indexPath];
    if (!cell) {
        NSLog(@"创建cell失败！");
    }
    return cell;
}

#pragma mark Setter
- (void)setModel:(MidDrawerBaseModel *)model {
    self.sectionTitleView.titleText = @"我的发现";
}

#pragma mark Lazy
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        MidDrawerFindCollectionViewFlowLayout *flowLayout = [[MidDrawerFindCollectionViewFlowLayout alloc] init];
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[MidDrawerFindNewsDiscoverCollectionViewCell class] forCellWithReuseIdentifier:@"MidDrawerFindNewsDiscoverCollectionViewCellID"];
    }
    return _collectionView;
}

- (MidDrawerFindNewsletterSectionTitleView *)sectionTitleView {
    if (!_sectionTitleView) {
        _sectionTitleView = [[MidDrawerFindNewsletterSectionTitleView alloc] initWithFrame:CGRectZero];
    }
    return _sectionTitleView;
}

@end
