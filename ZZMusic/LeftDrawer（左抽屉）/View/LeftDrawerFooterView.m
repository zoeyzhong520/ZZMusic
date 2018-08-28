//
//  LeftDrawerFooterView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/28.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "LeftDrawerFooterView.h"

@interface LeftDrawerFooterView ()

///设置按钮
@property (nonatomic, strong) UIButton *settingButton;
///立即登录按钮
@property (nonatomic, strong) UIButton *loginButton;
///横线
@property (nonatomic, strong) UIView *topLine;

@end

@implementation LeftDrawerFooterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.topLine];
    
    [self addSubview:self.settingButton];
    
    [self addSubview:self.loginButton];
    
    [self addConstraints];
}

- (void)addConstraints {
    [self.topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(fontSizeScale(15));
        make.right.mas_equalTo(-fontSizeScale(15));
        make.height.mas_equalTo(fontSizeScale(1));
    }];
    
    [self.settingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.mas_equalTo(0);
        make.width.mas_equalTo(fontSizeScale(100));
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.mas_equalTo(0);
        make.width.mas_equalTo(fontSizeScale(100));
    }];
}

//点击事件
- (void)buttonClick:(UIButton *)button {
    if (self.buttonClickBlock) {
        self.buttonClickBlock(button.tag == 0 ? Setting : Login);
    }
}

#pragma mark - Lazy
- (UIButton *)settingButton {
    if (!_settingButton) {
        _settingButton = [UIButton createButtonWithTarget:self action:@selector(buttonClick:) title:@"设置" textColor:BLACK_TEXTCOLOR imgStr:@"设置"];
        _settingButton.titleLabel.font = NORMAL_FONT;
        _settingButton.tag = 0;
        [_settingButton setEdgeInsetsWithTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0) imageEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 0)];
    }
    return _settingButton;
}

- (UIButton *)loginButton {
    if (!_loginButton) {
        _loginButton = [UIButton createButtonWithTarget:self action:@selector(buttonClick:) title:@"立即登录" textColor:BLACK_TEXTCOLOR imgStr:@"立即登录"];
        _loginButton.titleLabel.font = NORMAL_FONT;
        _loginButton.tag = 1;
        [_loginButton setEdgeInsetsWithTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0) imageEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 0)];
    }
    return _loginButton;
}

- (UIView *)topLine {
    if (!_topLine) {
        _topLine = [UIView createViewWithBackgroundColor:LINE_COLOR];
    }
    return _topLine;
}

@end
