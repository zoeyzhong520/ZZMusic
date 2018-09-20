//
//  MidDrawerSingerDetailMVCollectionViewCell.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/20.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerSingerDetailMVCollectionViewCell.h"

@interface MidDrawerSingerDetailMVCollectionViewCell ()

///imgView
@property (nonatomic, strong) UIImageView *imgView;
///titleLabel
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation MidDrawerSingerDetailMVCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    [self.contentView addSubview:self.imgView];
    
    [self.contentView addSubview:self.titleLabel];
    
    [self addConstraints];
}

//添加约束
- (void)addConstraints {
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, fontSizeScale(40), 0));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imgView.mas_bottom).offset(fontSizeScale(5));
        make.left.mas_equalTo(fontSizeScale(10));
        make.right.mas_equalTo(-fontSizeScale(10));
    }];
}

+ (MidDrawerSingerDetailMVCollectionViewCell *)createCellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    MidDrawerSingerDetailMVCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MidDrawerSingerDetailMVCollectionViewCellID" forIndexPath:indexPath];
    if (!cell) {
        cell = [[MidDrawerSingerDetailMVCollectionViewCell alloc] init];
    }
    return cell;
}

#pragma mark Lazy
- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView createImageViewWithImg:@""];
        _imgView.backgroundColor = SECTION_BACKGROUNDCOLOR;
    }
    return _imgView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel createLabelWithText:@"G.E.M.邓紫棋《倒数》单曲预热视频" font:NORMAL_FONT textColor:BLACK_TEXTCOLOR];
        _titleLabel.numberOfLines = 2;
    }
    return _titleLabel;
}

@end
