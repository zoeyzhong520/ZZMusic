//
//  ZZMusicCollectShapeAlertView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/11.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "ZZMusicCollectShapeAlertView.h"

@interface ZZMusicCollectShapeAlertView ()

///contentView
@property (nonatomic, strong) UIView *contentView;
///CONTENTVIEW_HEIGHT
@property (nonatomic, assign) CGFloat CONTENTVIEW_HEIGHT;

///titleView
@property (nonatomic, strong) UIView *titleView;
///titleLabel
@property (nonatomic, strong) UILabel *titleLabel;
///subTitleLabel
@property (nonatomic, strong) UILabel *subTitleLabel;

///scrollView
@property (nonatomic, strong) UIScrollView *scrollView;

///volumeView
@property (nonatomic, strong) UIView *volumeView;
///volumeButton
@property (nonatomic, strong) UIButton *volumeButton;
///volumeBar
@property (nonatomic, strong) UISlider *volumeBar;
///horizontalScreenButton 横屏
@property (nonatomic, strong) UIButton *horizontalScreenButton;

///closeButton
@property (nonatomic, strong) UIButton *closeButton;

@end

@implementation ZZMusicCollectShapeAlertView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.CONTENTVIEW_HEIGHT = FIND_BANNER_HEIGHT+fontSizeScale(160);
        [self createView];
    }
    return self;
}

- (void)createView {
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.backgroundColor = MONGOLIANLAYER_COLOR;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)]];
    
    if (_contentView == nil) {
        _contentView = [UIView createViewWithBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_contentView];
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(self.mas_bottom);
            make.height.mas_equalTo(self.CONTENTVIEW_HEIGHT);
        }];
        
        [self configContentView];
    }
}

- (void)configContentView {
    [_contentView addSubview:self.titleView];
    [self.titleView addSubview:self.titleLabel];
    [self.titleView addSubview:self.subTitleLabel];
    
    [_contentView addSubview:self.scrollView];
    
    [_contentView addSubview:self.volumeView];
    [self.volumeView addSubview:self.volumeButton];
    [self.volumeView addSubview:self.volumeBar];
    [self.volumeView addSubview:self.horizontalScreenButton];
    
    [_contentView addSubview:self.closeButton];
    
    [self addConstraints];
}

//添加约束
- (void)addConstraints {
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(fontSizeScale(60));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(fontSizeScale(10));
        make.size.mas_equalTo(CGSizeMake([self.titleLabel singleLineWidth], fontSizeScale(14)));
    }];
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.mas_equalTo(self.titleLabel);
        make.bottom.mas_equalTo(-fontSizeScale(10));
        make.size.mas_equalTo(CGSizeMake([self.subTitleLabel singleLineWidth], fontSizeScale(14)));
    }];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(FIND_BANNER_HEIGHT);
    }];
    
    [self.volumeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.scrollView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(fontSizeScale(50));
    }];
    
    [self.volumeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(66), fontSizeScale(44)));
    }];
    
    [self.volumeBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(self.bounds.size.width-fontSizeScale(66*2), fontSizeScale(20)));
    }];
    
    [self.horizontalScreenButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.centerY.mas_equalTo(0);
        make.size.mas_equalTo(self.volumeButton);
    }];
    
    [self.closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.volumeView.mas_bottom);
        make.left.right.bottom.mas_equalTo(0);
    }];
}

//点击事件
- (void)buttonClick:(UIButton *)button {
    if (button.tag == 0) {//音量
        
    } else if (button.tag == 1) {//横屏
        
    } else if (button.tag == 2) {//取消
        [self hide];
    }
}

//显示
- (void)show {
    self.alpha = 0.0;
    self.contentView.transform = CGAffineTransformIdentity;    
    [UIView animateWithDuration:ANIMATE_DURATION delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:10 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.alpha = 1.0;
        [ZZKEYWINDOW addSubview:self];
        self.contentView.transform = CGAffineTransformMakeTranslation(0, -self.CONTENTVIEW_HEIGHT);
    } completion:nil];
}

//隐藏
- (void)hide {
    self.alpha = 1.0;
    self.contentView.transform = CGAffineTransformMakeTranslation(0, -_CONTENTVIEW_HEIGHT);
    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.alpha = 0.0;
        self.contentView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark Lazy
- (UIView *)titleView {
    if (!_titleView) {
        _titleView = [UIView createViewWithBackgroundColor:[UIColor whiteColor]];
        
        UIView *line = [UIView createViewWithBackgroundColor:LINE_COLOR];
        [_titleView addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(0.5);
        }];
    }
    return _titleView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel createLabelWithText:@"A.I.N.Y." font:NORMAL_FONT textColor:BLACK_TEXTCOLOR];
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [UILabel createLabelWithText:@"邓紫棋·18（国语专辑）" font:NORMAL_FONT textColor:GRAY_TEXTCOLOR];
    }
    return _subTitleLabel;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        
        UIView *line = [UIView createViewWithBackgroundColor:LINE_COLOR];
        [_scrollView addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(0.5);
        }];
    }
    return _scrollView;
}

- (UIView *)volumeView {
    if (!_volumeView) {
        _volumeView = [UIView createViewWithBackgroundColor:[UIColor whiteColor]];
        
        UIView *line = [UIView createViewWithBackgroundColor:LINE_COLOR];
        [_volumeView addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(0.5);
        }];
    }
    return _volumeView;
}

- (UIButton *)volumeButton {
    if (!_volumeButton) {
        _volumeButton = [UIButton createButtonWithTarget:self action:@selector(buttonClick:) title:nil textColor:nil imgStr:nil];
        _volumeButton.tag = 0;
        
        UIImageView *imgView = [UIImageView createImageViewWithImg:@""];
        imgView.backgroundColor = SECTION_BACKGROUNDCOLOR;
        [_volumeButton addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(fontSizeScale(14), fontSizeScale(14)));
        }];
    }
    return _volumeButton;
}

- (UISlider *)volumeBar {
    if (!_volumeBar) {
        _volumeBar = [[UISlider alloc] init];
        _volumeBar.maximumValue = 1.0;
        _volumeBar.minimumValue = 0.0;
        _volumeBar.continuous = YES;
        _volumeBar.value = 0.5;
    }
    return _volumeBar;
}

- (UIButton *)horizontalScreenButton {
    if (!_horizontalScreenButton) {
        _horizontalScreenButton = [UIButton createButtonWithTarget:self action:@selector(buttonClick:) title:nil textColor:BLACK_TEXTCOLOR imgStr:nil];
        _horizontalScreenButton.tag = 1;
        
        UILabel *label = [UILabel createLabelWithText:@"横屏" font:SMALL_FONT textColor:BLACK_TEXTCOLOR];
        label.textAlignment = NSTextAlignmentCenter;
        label.layer.borderColor = BLACK_TEXTCOLOR.CGColor;
        label.layer.borderWidth = fontSizeScale(1);
        label.layer.masksToBounds = YES;
        label.layer.cornerRadius = 1.0f;
        [_horizontalScreenButton addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake([label singleLineWidth]+2, fontSizeScale(14)));
        }];
    }
    return _horizontalScreenButton;
}

- (UIButton *)closeButton {
    if (!_closeButton) {
        _closeButton = [UIButton createButtonWithTarget:self action:@selector(buttonClick:) title:@"取消" textColor:BLACK_TEXTCOLOR imgStr:nil];
        _closeButton.titleLabel.font = NORMAL_FONT;
        _closeButton.tag = 2;
    }
    return _closeButton;
}

@end
