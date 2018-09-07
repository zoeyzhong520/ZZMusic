//
//  MidDrawerFindNewsletterTableViewCell.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/6.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerFindNewsletterTableViewCell.h"
#import "MidDrawerFindNewsletterCollectionViewCell.h"
#import "MidDrawerFindCollectionViewFlowLayout.h"

@interface MidDrawerFindNewsletterTableViewCell ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

///collectionView
@property (nonatomic, strong) UICollectionView *collectionView;
///sectionTitleLabel
@property (nonatomic, strong) UILabel *sectionTitleLabel;

@end

@implementation MidDrawerFindNewsletterTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    [self.contentView addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView);
    }];
    [self.collectionView reloadData];
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
    
    MidDrawerFindNewsletterCollectionViewCell *cell = [MidDrawerFindNewsletterCollectionViewCell createCellWithCollectionView:collectionView indexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(fontSizeScale(130), self.bounds.size.height-fontSizeScale(40));
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:indexPath];
        
        //sectionTitleLabel
        [headerView addSubview:self.sectionTitleLabel];
        [self.sectionTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(fontSizeScale(5));
            make.size.mas_equalTo(CGSizeMake([self.sectionTitleLabel singleLineWidth], fontSizeScale(14)));
        }];
        
        return headerView;
    }
    return nil;
}

+ (MidDrawerFindNewsletterTableViewCell *)createCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    
    MidDrawerFindNewsletterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MidDrawerFindNewsletterTableViewCellID" forIndexPath:indexPath];
    if (!cell) {
        NSLog(@"创建cell失败！");
    }
    return cell;
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
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
        [_collectionView registerClass:[MidDrawerFindNewsletterCollectionViewCell class] forCellWithReuseIdentifier:@"MidDrawerFindNewsletterCollectionViewCellID"];
    }
    return _collectionView;
}

- (UILabel *)sectionTitleLabel {
    if (!_sectionTitleLabel) {
        _sectionTitleLabel = [UILabel createLabelWithText:@"24小时快讯" font:NORMAL_FONT textColor:[UIColor whiteColor]];
        _sectionTitleLabel.backgroundColor = [UIColor blackColor];
    }
    return _sectionTitleLabel;
}

@end
