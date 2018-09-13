//
//  MidDrawerMusicHallSectionHeaderView.m
//  ZZMusic
//
//  Created by 仲召俊 on 2018/9/3.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerMusicHallSectionHeaderView.h"

@interface MidDrawerMusicHallSectionHeaderView ()

///Title
@property (nonatomic, strong) UILabel *titleLabel;
///右边按钮
@property (nonatomic, strong) UIButton *rightButton;
///按钮图片
@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation MidDrawerMusicHallSectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    [self addSubview:self.titleLabel];
    
    [self addSubview:self.rightButton];
    
    [self.rightButton addSubview:self.imgView];
    
    [self addConstraints];
}

//添加约束
- (void)addConstraints {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(fontSizeScale(10), 0, 0, 0));
    }];
    
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.centerY.mas_equalTo(self.titleLabel);
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(30), fontSizeScale(30)));
    }];
    
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(12), fontSizeScale(12)));
    }];
}

//点击事件
- (void)buttonClick {
    
}

#pragma mark Setter
- (void)setTitleText:(NSString *)titleText {
    self.titleLabel.text = titleText;
}

#pragma mark Lazy
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel createLabelWithText:@"" font:BIG_FONT textColor:BLACK_TEXTCOLOR];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [UIButton createButtonWithTarget:self action:@selector(buttonClick) title:nil textColor:nil imgStr:nil];
    }
    return _rightButton;
}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView createImageViewWithImg:@"rightArrow"];
    }
    return _imgView;
}

@end
