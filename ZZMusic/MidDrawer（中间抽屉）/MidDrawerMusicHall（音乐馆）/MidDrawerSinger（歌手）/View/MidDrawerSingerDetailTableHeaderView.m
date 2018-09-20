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
///buttonsViewWidth
@property (nonatomic, assign) CGFloat buttonsViewWidth;
///buttonsViewHeight
@property (nonatomic, assign) CGFloat buttonsViewHeight;
///titleLabel 标题
@property (nonatomic, strong) UILabel *titleLabel;
///subTitleLabel 副标题
@property (nonatomic, strong) UILabel *subTitleLabel;
///avatarImgView
@property (nonatomic, strong) UIImageView *avatarImgView;

@end

@implementation MidDrawerSingerDetailTableHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.buttonsViewWidth = fontSizeScale(130);
        self.buttonsViewHeight = fontSizeScale(20);
        [self createView];
    }
    return self;
}

- (void)createView {
    [self addSubview:self.avatarImgView];
    
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
    [self.avatarImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.left.right.mas_equalTo(0);
        make.top.mas_equalTo(fontSizeScale(120));
    }];
    
    [self.fanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(fontSizeScale(5));
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(fontSizeScale(12));
    }];
    
    [self.buttonsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.fanLabel.mas_bottom).offset(fontSizeScale(5));
        make.centerX.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(self.buttonsViewWidth, self.buttonsViewHeight));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(self.buttonsView.mas_bottom).offset(fontSizeScale(20));
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-fontSizeScale(20), fontSizeScale(14)));
    }];
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(fontSizeScale(5));
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-fontSizeScale(20), fontSizeScale(12)));
    }];
}

- (void)configButtonsView {
    CGFloat margin = fontSizeScale(5);
    CGFloat itemWidth = (_buttonsViewWidth-margin) / 2;
    CGFloat itemHeight = _buttonsViewHeight;
    
    NSArray *names = @[@"关注",@"勋章"];
    for (int i = 0; i < names.count; i ++) {
        UIButton *button = [UIButton createButtonWithTarget:self action:@selector(buttonClick:) title:names[i] textColor:[UIColor whiteColor] imgStr:nil];
        button.tag = i;
        button.titleLabel.font = NORMAL_FONT;
        button.layer.cornerRadius = fontSizeScale(itemHeight/2);
        button.layer.masksToBounds = YES;
        button.layer.borderColor = [UIColor whiteColor].CGColor;
        button.layer.borderWidth = fontSizeScale(1);
        button.frame = CGRectMake((itemWidth+margin)*i, 0, itemWidth, itemHeight);
        [self.buttonsView addSubview:button];
    }
}

//点击事件
- (void)buttonClick:(UIButton *)button {
    
}

#pragma mark Lazy
- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel createLabelWithText:@"周杰伦" font:BIG_FONT textColor:[UIColor whiteColor]];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLabel;
}

- (UILabel *)fanLabel {
    if (!_fanLabel) {
        _fanLabel = [UILabel createLabelWithText:@"粉丝：8888.8万" font:SMALL_FONT textColor:[UIColor whiteColor]];
        _fanLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _fanLabel;
}

- (UIView *)buttonsView {
    if (!_buttonsView) {
        _buttonsView = [UIView createViewWithBackgroundColor:nil];
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

- (UIImageView *)avatarImgView {
    if (!_avatarImgView) {
        _avatarImgView = [UIImageView createImageViewWithImg:@""];
        [_avatarImgView sd_setImageWithURL:[NSURL URLWithString:SINGER_AVATAR_PATH] placeholderImage:PLACEHOLDER_IMAGE];
    }
    return _avatarImgView;
}

@end
