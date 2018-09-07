//
//  AboutTableHeaderView.m
//  ZZMusic
//
//  Created by 仲召俊 on 2018/9/7.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "AboutTableHeaderView.h"

@interface AboutTableHeaderView ()

///imgView
@property (nonatomic, strong) UIImageView *imgView;
///Title
@property (nonatomic, strong) UILabel *titleLabel;
///subTitle
@property (nonatomic, strong) UILabel *subTitleLabel;

@end

@implementation AboutTableHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    [self addSubview:self.imgView];
    
    [self addSubview:self.titleLabel];
    
    [self addSubview:self.subTitleLabel];
    
    [self addConstraints];
}

//添加约束
- (void)addConstraints {
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(fontSizeScale(40));
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(60), fontSizeScale(60)));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imgView.mas_bottom).offset(fontSizeScale(5));
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(fontSizeScale(16));
    }];
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(fontSizeScale(15));
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(fontSizeScale(12));
    }];
}

#pragma mark Lazy
- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView createImageViewWithImg:@""];
        _imgView.layer.cornerRadius = fontSizeScale(30);
        _imgView.layer.masksToBounds = YES;
        _imgView.backgroundColor = SECTION_BACKGROUNDCOLOR;
    }
    return _imgView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel createLabelWithText:@"ZZ音乐" font:BIG_BOLDFONT textColor:BLACK_TEXTCOLOR];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [UILabel createLabelWithText:[NSString stringWithFormat:@"版本号：%@", VERSION_NUMBER] font:SMALL_FONT textColor:GRAY_TEXTCOLOR];
        _subTitleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _subTitleLabel;
}

@end
