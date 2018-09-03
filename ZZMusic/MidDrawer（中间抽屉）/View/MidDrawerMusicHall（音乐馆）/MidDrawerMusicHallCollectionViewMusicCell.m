//
//  MidDrawerMusicHallCollectionViewMusicCell.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/3.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerMusicHallCollectionViewMusicCell.h"

@interface MidDrawerMusicHallCollectionViewMusicCell ()

///图片
@property (nonatomic, strong) UIImageView *imgView;
///播放按钮
@property (nonatomic, strong) UIButton *playButton;
///title
@property (nonatomic, strong) UILabel *titleLabel;
///subTitle
@property (nonatomic, strong) UILabel *subTitleLabel;

@end

@implementation MidDrawerMusicHallCollectionViewMusicCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    [self.contentView addSubview:self.imgView];
    
    [self.imgView addSubview:self.playButton];
    
    [self.contentView addSubview:self.titleLabel];
    
    [self.contentView addSubview:self.subTitleLabel];
    
    [self addConstraints];
}

//添加约束
- (void)addConstraints {
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, fontSizeScale(40), 0));
    }];
    
    [self.playButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(30), fontSizeScale(30)));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(5);
        make.right.mas_equalTo(-fontSizeScale(5));
        make.height.mas_equalTo(fontSizeScale(12));
        make.top.mas_equalTo(self.imgView.mas_bottom).offset(fontSizeScale(5));
    }];
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(5);
        make.right.mas_equalTo(-fontSizeScale(5));
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(fontSizeScale(5));
        make.height.mas_equalTo(fontSizeScale(12));
    }];
}

//点击事件
- (void)buttonClick {
    
}

+ (MidDrawerMusicHallCollectionViewMusicCell *)createCellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    MidDrawerMusicHallCollectionViewMusicCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MidDrawerMusicHallCollectionViewMusicCellID" forIndexPath:indexPath];
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

- (UIButton *)playButton {
    if (!_playButton) {
        _playButton = [UIButton createButtonWithTarget:self action:@selector(buttonClick) title:nil textColor:nil imgStr:@"个性电台播放"];
    }
    return _playButton;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel createLabelWithText:@"8 Letters" font:SMALL_FONT textColor:BLACK_TEXTCOLOR];
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [UILabel createLabelWithText:@"Why Dont`t We" font:SMALL_FONT textColor:GRAY_TEXTCOLOR];
    }
    return _subTitleLabel;
}

@end
