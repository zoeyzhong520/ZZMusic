//
//  MidDrawerMineTableHeaderView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/31.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerMineTableHeaderView.h"
#import "MidDrawerMineTableHeaderLoginOptionView.h"

@interface MidDrawerMineTableHeaderView ()

///登录操作View
@property (nonatomic, strong) MidDrawerMineTableHeaderLoginOptionView *loginOptionView;
///功能键View
@property (nonatomic, strong) UIView *featuresView;
///自建歌单 收藏歌单View
@property (nonatomic, strong) UIView *songListView;
@property (nonatomic, strong) UIButton *selectedButton;
///竖线
@property (nonatomic, strong) UIView *line;

@end

@implementation MidDrawerMineTableHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    [self addSubview:self.loginOptionView];
    
    [self addSubview:self.featuresView];
    [self configFeaturesView];
    
    [self addSubview:self.songListView];
    [self configSongListView];
}

- (void)configFeaturesView {
    NSArray *images = @[@"全部音乐",@"下载音乐",@"最近播放",@"我喜欢",@"已购音乐",@"跑步电台"];
    NSArray *names = @[@"全部音乐",@"下载音乐",@"最近播放",@"我喜欢",@"已购音乐",@"跑步电台"];
    
    CGFloat W = self.bounds.size.width/3;
    CGFloat H = self.featuresView.bounds.size.height/2;
    
    for (int i = 0; i < images.count; i ++) {
        UIButton *button = [UIButton createButtonWithTarget:self action:@selector(featuresButtonClick:) title:names[i] textColor:BLACK_TEXTCOLOR imgStr:images[i]];
        button.titleLabel.font = NORMAL_FONT;
        button.frame = CGRectMake(W*(i%3), H*(i/3), W, H);
        button.tag = i;
        [button setTopImageBottomTitle];
        [self.featuresView addSubview:button];
    }
}

- (void)configSongListView {
    NSArray *names = @[@"自建歌单  ",@"  收藏歌单"];
    
    CGFloat W = self.bounds.size.width/4;
    CGFloat H = self.songListView.bounds.size.height;
    
    for (int i = 0; i < names.count; i ++) {
        UIButton *button = [UIButton createButtonWithTarget:self action:@selector(songListButtonClick:) title:names[i] textColor:GRAY_TEXTCOLOR imgStr:nil];
        button.titleLabel.font = NORMAL_FONT;
        button.frame = CGRectMake(self.bounds.size.width/4+W*i, 0, W, H);
        button.tag = i;
        [self.songListView addSubview:button];
        
        if (i == 0) {
            self.selectedButton = button;
            [button setTitleColor:BLACK_TEXTCOLOR forState:UIControlStateNormal];
        }
    }
    
    [self.songListView addSubview:self.line];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(1), fontSizeScale(15)));
    }];
}

///点击事件
- (void)featuresButtonClick:(UIButton *)button {
    switch (button.tag) {
        case 0:
            [self createBlock:MidDrawerMineTableHeaderViewAllMusic];
            break;
        case 1:
            [self createBlock:MidDrawerMineTableHeaderViewDownload];
            break;
        case 2:
            [self createBlock:MidDrawerMineTableHeaderViewRecentlyPlayed];
            break;
        case 3:
            [self createBlock:MidDrawerMineTableHeaderViewLike];
            break;
        case 4:
            [self createBlock:MidDrawerMineTableHeaderViewPurchasedMusic];
            break;
        case 5:
            [self createBlock:MidDrawerMineTableHeaderViewRunningStation];
            break;
        default:
            break;
    }
}

- (void)songListButtonClick:(UIButton *)button {
    if (_selectedButton != button) {
        //本次点击的按钮
        [_selectedButton setTitleColor:GRAY_TEXTCOLOR forState:UIControlStateNormal];
        [button setTitleColor:BLACK_TEXTCOLOR forState:UIControlStateNormal];
    }
    _selectedButton = button;
    
    [self createBlock:button.tag == 0 ? MidDrawerMineTableHeaderViewSelfBuildSongList : MidDrawerMineTableHeaderViewCollectionSongList];
}

//设置闭包
- (void)createBlock:(MidDrawerMineTableHeaderViewClickType)type {
    if (self.clickBlock) {
        self.clickBlock(type);
    }
}

#pragma mark Lazy
- (MidDrawerMineTableHeaderLoginOptionView *)loginOptionView {
    if (!_loginOptionView) {
        _loginOptionView = [[MidDrawerMineTableHeaderLoginOptionView alloc] initWithFrame:CGRectMake(fontSizeScale(5), 0, self.bounds.size.width-fontSizeScale(10), fontSizeScale(100))];
        _loginOptionView.layer.shadowColor = SHADOW_COLOR.CGColor;
        _loginOptionView.layer.shadowOpacity = 0.8f;
        _loginOptionView.layer.shadowOffset = CGSizeMake(0, 0);
        
        WeakSelf;
        _loginOptionView.clickBlock = ^(LoginOptionViewClickType type) {
            [weakSelf createBlock:type == LoginOptionViewActivity ? MidDrawerMineTableHeaderViewActivity : MidDrawerMineTableHeaderViewVIP];
        };
    }
    return _loginOptionView;
}

- (UIView *)featuresView {
    if (!_featuresView) {
        _featuresView = [UIView createViewWithBackgroundColor:[UIColor whiteColor]];
        _featuresView.frame = CGRectMake(0, CGRectGetMaxY(self.loginOptionView.frame)+fontSizeScale(5), self.bounds.size.width, fontSizeScale(160));
    }
    return _featuresView;
}

- (UIView *)songListView {
    if (!_songListView) {
        _songListView = [UIView createViewWithBackgroundColor:[UIColor whiteColor]];
        _songListView.frame = CGRectMake(0, CGRectGetMaxY(self.featuresView.frame), self.bounds.size.width, fontSizeScale(60));
    }
    return _songListView;
}

- (UIView *)line {
    if (!_line) {
        _line = [UIView createViewWithBackgroundColor:BLACK_TEXTCOLOR];
    }
    return _line;
}

@end
