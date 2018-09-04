//
//  MidDrawerMusicHallCollectionViewColumnCell.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/4.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerMusicHallCollectionViewColumnCell.h"

#pragma mark 音乐馆-专栏Cell

@interface MidDrawerMusicHallCollectionViewColumnCell ()

///imgView
@property (nonatomic, strong) UIImageView *imgView;
///title
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation MidDrawerMusicHallCollectionViewColumnCell

- (instancetype)initWithFrame:(CGRect)frame {
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

///添加约束
- (void)addConstraints {
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, fontSizeScale(40), 0));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imgView.mas_bottom).offset(fontSizeScale(5));
        make.left.mas_equalTo(fontSizeScale(5));
        make.right.mas_equalTo(-fontSizeScale(5));
        make.height.mas_equalTo(30);
    }];
}

+ (MidDrawerMusicHallCollectionViewColumnCell *)createCellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    
    MidDrawerMusicHallCollectionViewColumnCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MidDrawerMusicHallCollectionViewColumnCellID" forIndexPath:indexPath];
    if (!cell) {
        NSLog(@"创建cell失败！");
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
        _titleLabel = [UILabel createLabelWithText:@"" font:SMALL_FONT textColor:BLACK_TEXTCOLOR];
    }
    return _titleLabel;
}

@end
