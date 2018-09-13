//
//  MidDrawerFindHeaderCollectionViewCell.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/6.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerFindHeaderCollectionViewCell.h"

@interface MidDrawerFindHeaderCollectionViewCell ()

///imgView
@property (nonatomic, strong) UIImageView *imgView;
///title
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation MidDrawerFindHeaderCollectionViewCell

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

//添加约束
- (void)addConstraints {
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(fontSizeScale(10));
        make.centerX.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(50), fontSizeScale(50)));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imgView.mas_bottom).offset(fontSizeScale(5));
        make.left.right.mas_equalTo(0);
    }];
}

+ (MidDrawerFindHeaderCollectionViewCell *)createCellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    
    MidDrawerFindHeaderCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MidDrawerFindHeaderCollectionViewCellID" forIndexPath:indexPath];
    if (!cell) {
        NSLog(@"创建cell失败！");
    }
    return cell;
}

#pragma mark Lazy
- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView createImageViewWithImg:nil];
        [_imgView sd_setImageWithURL:[NSURL URLWithString:AVATAR_PATH] placeholderImage:PLACEHOLDER_IMAGE];
        _imgView.backgroundColor = SECTION_BACKGROUNDCOLOR;
        _imgView.contentMode = UIViewContentModeScaleAspectFit;
        _imgView.layer.masksToBounds = YES;
        _imgView.layer.cornerRadius = fontSizeScale(25);
        _imgView.layer.borderColor = RGB(249, 92, 102).CGColor;
        _imgView.layer.borderWidth = fontSizeScale(1);
    }
    return _imgView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel createLabelWithText:@"本地演出" font:SMALL_FONT textColor:BLACK_TEXTCOLOR];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

@end
