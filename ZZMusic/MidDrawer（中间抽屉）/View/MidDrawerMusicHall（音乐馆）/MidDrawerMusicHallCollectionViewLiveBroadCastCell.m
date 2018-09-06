//
//  MidDrawerMusicHallCollectionViewLiveBroadCastCell.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/4.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerMusicHallCollectionViewLiveBroadCastCell.h"

@interface MidDrawerMusicHallCollectionViewLiveBroadCastCell ()

///顶部标签
@property (nonatomic, strong) UIButton *broadCast;
///imgView
@property (nonatomic, strong) UIImageView *imgView;
///title
@property (nonatomic, strong) UILabel *titleLabel;
///subTitle
@property (nonatomic, strong) UIButton *subTitle;

@end

@implementation MidDrawerMusicHallCollectionViewLiveBroadCastCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    [self.contentView addSubview:self.imgView];
    
    [self.imgView addSubview:self.broadCast];
    
    [self.contentView addSubview:self.titleLabel];
    
    [self.contentView addSubview:self.subTitle];
    
    [self addConstraints];
}

//添加约束
- (void)addConstraints {
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, fontSizeScale(50), 0));
    }];
    
    [self.broadCast mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(45), fontSizeScale(15)));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imgView.mas_bottom).offset(fontSizeScale(5));
        make.left.mas_equalTo(fontSizeScale(5));
        make.right.mas_equalTo(-fontSizeScale(5));
    }];
    
    [self.subTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(fontSizeScale(5));
        make.height.mas_equalTo(fontSizeScale(24));
    }];
}

+ (MidDrawerMusicHallCollectionViewLiveBroadCastCell *)createCellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    
    MidDrawerMusicHallCollectionViewLiveBroadCastCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MidDrawerMusicHallCollectionViewLiveBroadCastCellID" forIndexPath:indexPath];
    if (!cell) {
        NSLog(@"创建cell失败！");
    }
    return cell;
}

#pragma mark Lazy
- (UIButton *)broadCast {
    if (!_broadCast) {
        _broadCast = [UIButton createButtonWithTarget:nil action:nil title:@"直播" textColor:[UIColor whiteColor] imgStr:@""];
        _broadCast.titleLabel.font = SMALL_FONT;
    }
    return _broadCast;
}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView createImageViewWithImg:nil];
        _imgView.backgroundColor = SECTION_BACKGROUNDCOLOR;
    }
    return _imgView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel createLabelWithText:@"开学新生训练：找回学习的快乐" font:SMALL_FONT textColor:BLACK_TEXTCOLOR];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

- (UIButton *)subTitle {
    if (!_subTitle) {
        _subTitle = [UIButton createButtonWithTarget:nil action:nil title:@"主播：猫王音悦台" textColor:GRAY_TEXTCOLOR imgStr:@""];
        _subTitle.titleLabel.font = SMALL_FONT;
    }
    return _subTitle;
}

@end
