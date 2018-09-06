//
//  MidDrawerFindNewsletterCollectionViewCell.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/6.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerFindNewsletterCollectionViewCell.h"

@interface MidDrawerFindNewsletterCollectionViewCell ()

///imgView
@property (nonatomic, strong) UIImageView *imgView;
///titleView
@property (nonatomic, strong) UIView *titleView;
///titleLabel
@property (nonatomic, strong) UILabel *titleLabel;
///subTitleLabel
@property (nonatomic, strong) UILabel *subTitleLabel;

@end

@implementation MidDrawerFindNewsletterCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    [self.contentView addSubview:self.imgView];
    
    [self.contentView addSubview:self.titleView];
    [self.titleView addSubview:self.titleLabel];
    [self.titleView addSubview:self.subTitleLabel];
    
    [self addConstraints];
}

//添加约束
- (void)addConstraints {
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, fontSizeScale(40), 0));
    }];
    
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imgView.mas_bottom);
        make.left.right.bottom.mas_equalTo(0);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(fontSizeScale(5));
        make.right.mas_equalTo(-fontSizeScale(5));
        make.height.mas_equalTo(fontSizeScale(14));
    }];
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(fontSizeScale(5));
        make.left.mas_equalTo(fontSizeScale(5));
        make.right.mas_equalTo(-fontSizeScale(5));
        make.height.mas_equalTo(fontSizeScale(12));
    }];
}

+ (MidDrawerFindNewsletterCollectionViewCell *)createCellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    
    MidDrawerFindNewsletterCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MidDrawerFindNewsletterCollectionViewCellID" forIndexPath:indexPath];
    if (!cell) {
        NSLog(@"创建cell失败！");
    }
    return cell;
}

#pragma mark Lazy
- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView createImageViewWithImg:nil];
        _imgView.backgroundColor = [UIColor lightGrayColor];
    }
    return _imgView;
}

- (UIView *)titleView {
    if (!_titleView) {
        _titleView = [UIView createViewWithBackgroundColor:SECTION_BACKGROUNDCOLOR];
    }
    return _titleView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel createLabelWithText:@"谦谦“小雪糕”降生" font:NORMAL_FONT textColor:BLACK_TEXTCOLOR];
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [UILabel createLabelWithText:@"恭喜薛之谦升级当爸爸" font:SMALL_FONT textColor:GRAY_TEXTCOLOR];
    }
    return _subTitleLabel;
}

@end
