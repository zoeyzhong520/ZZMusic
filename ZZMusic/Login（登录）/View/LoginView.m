//
//  LoginView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/29.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "LoginView.h"

@interface LoginView ()

///微信登录按钮
@property (nonatomic, strong) UIButton *weixinLoginButton;
///QQ登录按钮
@property (nonatomic, strong) UIButton *qqLoginButton;

@end

@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    [self addSubview:self.weixinLoginButton];
    
    [self addSubview:self.qqLoginButton];
    
    [self addConstraints];
}

- (void)addConstraints {
    [self.qqLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(fontSizeScale(20));
        make.right.mas_equalTo(-fontSizeScale(20));
        make.height.mas_equalTo(fontSizeScale(35));
        make.bottom.mas_equalTo(-fontSizeScale(50));
    }];
    
    [self.weixinLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(fontSizeScale(20));
        make.right.mas_equalTo(-fontSizeScale(20));
        make.height.mas_equalTo(fontSizeScale(35));
        make.bottom.mas_equalTo(self.qqLoginButton.mas_top).offset(-fontSizeScale(10));
    }];
}

//点击事件
- (void)buttonClick:(UIButton *)button {
    
}

#pragma mark Lazy
- (UIButton *)weixinLoginButton {
    if (!_weixinLoginButton) {
        _weixinLoginButton = [UIButton createButtonWithTarget:self action:@selector(buttonClick:) title:@"微信登录" textColor:[UIColor whiteColor] imgStr:@"WeiXinLog"];
        [_weixinLoginButton setEdgeInsetsWithTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0) imageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
        _weixinLoginButton.tag = 0;
        _weixinLoginButton.backgroundColor = MAIN_COLOR;
    }
    return _weixinLoginButton;
}

- (UIButton *)qqLoginButton {
    if (!_qqLoginButton) {
        _qqLoginButton = [UIButton createButtonWithTarget:self action:@selector(buttonClick:) title:@"QQ登录" textColor:[UIColor whiteColor] imgStr:@"QQLog"];
        [_qqLoginButton setEdgeInsetsWithTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0) imageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
        _qqLoginButton.tag = 1;
        _qqLoginButton.backgroundColor = RGB(0, 169, 227);
    }
    return _qqLoginButton;
}

@end
