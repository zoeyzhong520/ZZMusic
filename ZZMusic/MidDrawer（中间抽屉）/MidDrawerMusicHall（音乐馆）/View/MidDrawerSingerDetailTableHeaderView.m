//
//  MidDrawerSingerDetailTableHeaderView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/14.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerSingerDetailTableHeaderView.h"

@interface MidDrawerSingerDetailTableHeaderView ()

///nameLabel 名字
@property (nonatomic, strong) UILabel *nameLabel;
///fanLabel 粉丝
@property (nonatomic, strong) UILabel *fanLabel;
///buttonsView 关注、勋章
@property (nonatomic, strong) UIView *buttonsView;
///titleLabel 标题
@property (nonatomic, strong) UILabel *titleLabel;
///subTitleLabel 副标题
@property (nonatomic, strong) UILabel *subTitleLabel;

@end

@implementation MidDrawerSingerDetailTableHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    [self addSubview:self.nameLabel];
    
    [self addSubview:self.fanLabel];
    
    [self addSubview:self.buttonsView];
    [self configButtonsView];
    
    [self addSubview:self.titleLabel];
    
    [self addSubview:self.subTitleLabel];
    
    [self addConstraints];
}

//添加约束
- (void)addConstraints {
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.left.right.mas_equalTo(0);
        make.top.mas_equalTo(fontSizeScale(100));
    }];
    
    [self.fanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(fontSizeScale(5));
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(fontSizeScale(12));
    }];
    
    [self.buttonsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.fanLabel.mas_bottom).offset(fontSizeScale(5));
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(fontSizeScale(25));
    }];
    
    
}

- (void)configButtonsView {
    
}

//点击事件
- (void)buttonClick:(UIButton *)button {
    
}

#pragma mark Lazy
- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel createLabelWithText:@"周杰伦" font:BIG_FONT textColor:[UIColor whiteColor]];
    }
    return _nameLabel;
}

- (UILabel *)fanLabel {
    if (!_fanLabel) {
        _fanLabel = [UILabel createLabelWithText:@"粉丝：8888.8万" font:SMALL_FONT textColor:[UIColor whiteColor]];
    }
    return _fanLabel;
}

- (UIView *)buttonsView {
    if (!_buttonsView) {
        _buttonsView = [UIView createViewWithBackgroundColor:[UIColor whiteColor]];
    }
    return _buttonsView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel createLabelWithText:@"周杰伦【地表最强2】演唱会洛阳站加场" font:NORMAL_FONT textColor:[UIColor whiteColor]];
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [UILabel createLabelWithText:@"09.30 洛阳新区体育场" font:SMALL_FONT textColor:[UIColor whiteColor]];
    }
    return _subTitleLabel;
}

@end
