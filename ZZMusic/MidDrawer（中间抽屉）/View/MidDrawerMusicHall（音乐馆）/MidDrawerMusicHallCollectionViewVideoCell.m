//
//  MidDrawerMusicHallCollectionViewVideoCell.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/4.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerMusicHallCollectionViewVideoCell.h"

@interface MidDrawerMusicHallCollectionViewVideoCell ()

///imgView
@property (nonatomic, strong) UIImageView *imgView;
///播放按钮
@property (nonatomic, strong) UIButton *playButton;
///title
@property (nonatomic, strong) UILabel *titleLabel;
///subTitle
@property (nonatomic, strong) UILabel *subTitleLabel;

@end

@implementation MidDrawerMusicHallCollectionViewVideoCell

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
        make.left.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(100), fontSizeScale(24)));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imgView.mas_bottom).offset(fontSizeScale(5));
        make.left.mas_equalTo(fontSizeScale(5));
        make.right.mas_equalTo(-fontSizeScale(5));
        make.height.mas_equalTo(fontSizeScale(12));
    }];
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(fontSizeScale(5));
        make.left.mas_equalTo(fontSizeScale(5));
        make.right.mas_equalTo(-fontSizeScale(5));
        make.height.mas_equalTo(fontSizeScale(12));
    }];
}

//点击事件
- (void)buttonClick {
    
}

+ (MidDrawerMusicHallCollectionViewVideoCell *)createCellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    
    MidDrawerMusicHallCollectionViewVideoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MidDrawerMusicHallCollectionViewVideoCellID" forIndexPath:indexPath];
    if (!cell) {
        NSLog(@"创建cell失败！");
    }
    return cell;
}

#pragma mark Setter
- (void)setIsSubTitleVisible:(BOOL)isSubTitleVisible {
    self.subTitleLabel.hidden = !isSubTitleVisible;
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
        _playButton = [UIButton createButtonWithTarget:self action:@selector(buttonClick) title:@"" textColor:[UIColor whiteColor] imgStr:@""];
        _playButton.titleLabel.font = SMALL_FONT;
    }
    return _playButton;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel createLabelWithText:@"Survivors" font:SMALL_FONT textColor:BLACK_TEXTCOLOR];
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [UILabel createLabelWithText:@"跟着游吟诗人在城市中漫步" font:SMALL_FONT textColor:GRAY_TEXTCOLOR];
        _subTitleLabel.hidden = YES;
    }
    return _subTitleLabel;
}

@end
