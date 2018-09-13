//
//  MidDrawerMineTableHeaderLoginOptionView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/31.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerMineTableHeaderLoginOptionView.h"

@interface MidDrawerMineTableHeaderLoginOptionView ()

///立即登录按钮
@property (nonatomic, strong) UIButton *loginButton;
///活动中心
@property (nonatomic, strong) UIView *activityView;
@property (nonatomic, strong) UIImageView *activityImgView;
@property (nonatomic, strong) UILabel *activityTitle;
@property (nonatomic, strong) UILabel *activitySubTitle;
///会员中心
@property (nonatomic, strong) UIView *vipView;
@property (nonatomic, strong) UIImageView *vipImgView;
@property (nonatomic, strong) UILabel *vipTitle;
@property (nonatomic, strong) UILabel *vipSubTitle;

///竖线
@property (nonatomic, strong) UIView *line;

@end

@implementation MidDrawerMineTableHeaderLoginOptionView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.loginButton];
    
    [self addSubview:self.activityView];
    [self.activityView addSubview:self.activityImgView];
    [self.activityView addSubview:self.activityTitle];
    [self.activityView addSubview:self.activitySubTitle];
    
    [self addSubview:self.vipView];
    [self.vipView addSubview:self.vipImgView];
    [self.vipView addSubview:self.vipTitle];
    [self.vipView addSubview:self.vipSubTitle];
    
    [self addSubview:self.line];
    
    [self addConstraints];
}

- (void)addConstraints {
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(fontSizeScale(45));
    }];
    
    [self.activityView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.loginButton.mas_bottom);
        make.left.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(self.bounds.size.width/2, fontSizeScale(60)));
    }];
    
    [self.activityImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(fontSizeScale(50));
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(18), fontSizeScale(18)));
        make.top.mas_equalTo(fontSizeScale(15));
    }];
    
    [self.activityTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.activityImgView.mas_right).offset(fontSizeScale(5));
        make.centerY.mas_equalTo(self.activityImgView);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(fontSizeScale(14));
    }];
    
    [self.activitySubTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.activityTitle.mas_bottom).offset(fontSizeScale(5));
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(fontSizeScale(14));
    }];
    
    [self.vipView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.loginButton.mas_bottom);
        make.right.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(self.bounds.size.width/2, fontSizeScale(60)));
    }];
    
    [self.vipImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(fontSizeScale(50));
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(18), fontSizeScale(18)));
        make.top.mas_equalTo(fontSizeScale(15));
    }];
    
    [self.vipTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.vipImgView.mas_right).offset(fontSizeScale(5));
        make.centerY.mas_equalTo(self.vipImgView);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(fontSizeScale(14));
    }];
    
    [self.vipSubTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.activityTitle.mas_bottom).offset(fontSizeScale(5));
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(fontSizeScale(14));
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(self.loginButton.mas_bottom).offset(fontSizeScale(25));
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(1), fontSizeScale(15)));
    }];
}

//点击事件
- (void)buttonClick {
    if (self.clickBlock) {
        self.clickBlock(LoginOptionViewLogin);
    }
}

- (void)tapClick:(UITapGestureRecognizer *)gesture {
    if (self.clickBlock) {
        self.clickBlock(gesture.view.tag == 0 ? LoginOptionViewActivity : LoginOptionViewVIP);
    }
}

#pragma mark Lazy
- (UIButton *)loginButton {
    if (!_loginButton) {
        _loginButton = [UIButton createButtonWithTarget:self action:@selector(buttonClick) title:@"立即登录畅享高品质" textColor:BLACK_TEXTCOLOR imgStr:@"MidDrawerDefaultAvatar"];
        _loginButton.titleLabel.font = BIG_FONT;
    }
    return _loginButton;
}

- (UIView *)activityView {
    if (!_activityView) {
        _activityView = [UIView createViewWithBackgroundColor:[UIColor whiteColor]];
        [_activityView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)]];
        _activityView.tag = 0;
    }
    return _activityView;
}

- (UIImageView *)activityImgView {
    if (!_activityImgView) {
        _activityImgView = [UIImageView createImageViewWithImg:@"活动中心"];
    }
    return _activityImgView;
}

- (UILabel *)activityTitle {
    if (!_activityTitle) {
        _activityTitle = [UILabel createLabelWithText:@"活动中心" font:NORMAL_FONT textColor:BLACK_TEXTCOLOR];
    }
    return _activityTitle;
}

- (UILabel *)activitySubTitle {
    if (!_activitySubTitle) {
        _activitySubTitle = [UILabel createLabelWithText:@"完成听歌任务领奖励" font:SMALL_FONT textColor:GRAY_TEXTCOLOR];
        _activitySubTitle.textAlignment = NSTextAlignmentCenter;
    }
    return _activitySubTitle;
}

- (UIView *)vipView {
    if (!_vipView) {
        _vipView = [UIView createViewWithBackgroundColor:[UIColor whiteColor]];
        [_vipView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)]];
        _vipView.tag = 1;
    }
    return _vipView;
}

- (UIImageView *)vipImgView {
    if (!_vipImgView) {
        _vipImgView = [UIImageView createImageViewWithImg:@"vip"];
    }
    return _vipImgView;
}

- (UILabel *)vipTitle {
    if (!_vipTitle) {
        _vipTitle = [UILabel createLabelWithText:@"会员中心" font:NORMAL_FONT textColor:BLACK_TEXTCOLOR];
    }
    return _vipTitle;
}

- (UILabel *)vipSubTitle {
    if (!_vipSubTitle) {
        _vipSubTitle = [UILabel createLabelWithText:@"大王卡送6个月VIP" font:SMALL_FONT textColor:GRAY_TEXTCOLOR];
        _vipSubTitle.textAlignment = NSTextAlignmentCenter;
    }
    return _vipSubTitle;
}

- (UIView *)line {
    if (!_line) {
        _line = [UIView createViewWithBackgroundColor:BLACK_TEXTCOLOR];
    }
    return _line;
}

@end
