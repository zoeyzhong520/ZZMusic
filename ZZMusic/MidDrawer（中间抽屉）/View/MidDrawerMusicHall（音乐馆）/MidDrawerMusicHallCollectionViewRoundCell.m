//
//  MidDrawerMusicHallCollectionViewRoundCell.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/4.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerMusicHallCollectionViewRoundCell.h"

@interface MidDrawerMusicHallCollectionViewRoundCell ()

///imgView
@property (nonatomic, strong) UIImageView *imgView;
///播放按钮
@property (nonatomic, strong) UIButton *playButton;
///title
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation MidDrawerMusicHallCollectionViewRoundCell

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
    
    [self addConstraints];
}

//添加约束
- (void)addConstraints {
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    
    [self.playButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(24), fontSizeScale(24)));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imgView.mas_bottom);
        make.left.right.bottom.mas_equalTo(0);
    }];
}

//点击事件
- (void)buttonClick {
    
}

+ (MidDrawerMusicHallCollectionViewRoundCell *)createCellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    
    MidDrawerMusicHallCollectionViewRoundCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MidDrawerMusicHallCollectionViewRoundCellID" forIndexPath:indexPath];
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
        _imgView.layer.masksToBounds = YES;
        _imgView.layer.cornerRadius = (self.bounds.size.height-fontSizeScale(60))/2;
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
        _titleLabel = [UILabel createLabelWithText:@"XX" font:NORMAL_FONT textColor:BLACK_TEXTCOLOR];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

@end
