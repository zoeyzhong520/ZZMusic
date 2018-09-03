//
//  MidDrawerMusicHallHeaderView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/3.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerMusicHallHeaderView.h"
#import "MidDrawerMusicHallAdCarouselView.h"

@interface MidDrawerMusicHallHeaderView ()

///广告-轮播
@property (nonatomic, strong) MidDrawerMusicHallAdCarouselView *adCarouselView;
///功能选择View（歌手、排行、分类歌单、电台、视频）
@property (nonatomic, strong) UIView *operationView;

///个性电台View
@property (nonatomic, strong) UIView *personalityRadioView;
///个性电台imgView
@property (nonatomic, strong) UIImageView *personalityRadioImgView;
///个性电台title
@property (nonatomic, strong) UILabel *personalityRadioTitleLabel;
///个性电台播放按钮
@property (nonatomic, strong) UIButton *personalityRadioPlayButton;

///新歌新碟View
@property (nonatomic, strong) UIView *songAlbumView;
///新歌新碟Title
@property (nonatomic, strong) UILabel *songAlbumTitleLabel;
///新歌新碟SubTitle
@property (nonatomic, strong) UILabel *songAlbumSubTitleLabel;
///新歌新碟imgView
@property (nonatomic, strong) UIImageView *songAlbumImgView;
///新歌新碟line
@property (nonatomic, strong) UIView *songAlbumLine;

///数字专辑·票务View
@property (nonatomic, strong) UIView *digitalAlbumView;
///数字专辑·票务Title
@property (nonatomic, strong) UILabel *digitalAlbumTitleLabel;
///数字专辑·票务SubTitle
@property (nonatomic, strong) UILabel *digitalAlbumSubTitleLabel;
///数字专辑·票务imgView
@property (nonatomic, strong) UIImageView *digitalAlbumImgView;
///数字专辑·票务line
@property (nonatomic, strong) UIView *digitalAlbumLine;

@end

@implementation MidDrawerMusicHallHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    [self addSubview:self.adCarouselView];
    
    [self addSubview:self.operationView];
    [self configOperationView];
    
    [self addSubview:self.personalityRadioView];
    [self configPersonalityRadioView];
    
    [self addSubview:self.songAlbumView];
    [self configSongAlbumView];
    
    [self addSubview:self.digitalAlbumView];
    [self configDigitalAlbumView];
    
    [self addConstraints];
}

- (void)addConstraints {
    [self.personalityRadioView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(fontSizeScale(10));
        make.top.mas_equalTo(self.operationView.mas_bottom).offset(fontSizeScale(20));
        make.size.mas_equalTo(CGSizeMake(BANNER_HEIGHT, BANNER_HEIGHT));
    }];
    
    [self.songAlbumView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.personalityRadioView.mas_right).offset(fontSizeScale(10));
        make.topMargin.mas_equalTo(self.personalityRadioView);
        make.right.mas_equalTo(-fontSizeScale(10));
        make.height.mas_equalTo((BANNER_HEIGHT-fontSizeScale(10))/2);
    }];
    
    [self.digitalAlbumView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.personalityRadioView.mas_right).offset(fontSizeScale(10));
        make.bottomMargin.mas_equalTo(self.personalityRadioView);
        make.right.mas_equalTo(-fontSizeScale(10));
        make.height.mas_equalTo((BANNER_HEIGHT-fontSizeScale(10))/2);
    }];
}

//设置operationView
- (void)configOperationView {
    NSArray *images = @[@"歌手",@"排行",@"分类歌单",@"电台",@"视频"];
    NSArray *names = @[@"歌手",@"排行",@"分类",@"电台",@"视频"];
    CGFloat W = self.operationView.bounds.size.width/5;
    CGFloat H = self.operationView.bounds.size.height;
    
    for (int i = 0; i < images.count; i ++) {
        UIButton *button = [UIButton createButtonWithTarget:self action:@selector(buttonClick:) title:names[i] textColor:BLACK_TEXTCOLOR imgStr:images[i]];
        button.titleLabel.font = NORMAL_FONT;
        button.frame = CGRectMake(W*i, 0, W, H);
        [button setTopImageBottomTitleWithMargin:15];
        [self.operationView addSubview:button];
    }
}

//设置personalityRadioView
- (void)configPersonalityRadioView {
    [self.personalityRadioView addSubview:self.personalityRadioImgView];
    
    [self.personalityRadioView addSubview:self.personalityRadioTitleLabel];
    
    [self.personalityRadioView addSubview:self.personalityRadioPlayButton];
    
    //约束
    [self.personalityRadioImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.personalityRadioView);
    }];
    
    [self.personalityRadioPlayButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.personalityRadioView);
    }];
    
    [self.personalityRadioTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(fontSizeScale(36));
    }];
}

//设置songAlbumView
- (void)configSongAlbumView {
    [self.songAlbumView addSubview:self.songAlbumTitleLabel];
    
    [self.songAlbumView addSubview:self.songAlbumSubTitleLabel];
    
    [self.songAlbumView addSubview:self.songAlbumImgView];
    
    [self.songAlbumView addSubview:self.songAlbumLine];
    
    [self.songAlbumImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.mas_equalTo(0);
        make.width.mas_equalTo((BANNER_HEIGHT-fontSizeScale(10))/2);
    }];
    
    [self.songAlbumTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(fontSizeScale(15));
        make.right.mas_equalTo(self.songAlbumImgView.mas_left);
        make.height.mas_equalTo(fontSizeScale(14));
    }];
    
    [self.songAlbumSubTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(fontSizeScale(15));
        make.top.mas_equalTo(self.songAlbumTitleLabel.mas_bottom).offset(fontSizeScale(10));
        make.right.mas_equalTo(self.songAlbumImgView.mas_left);
        make.height.mas_equalTo(fontSizeScale(12));
    }];
    
    [self.songAlbumLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.right.mas_equalTo(self.songAlbumImgView.mas_left);
        make.width.mas_equalTo(fontSizeScale(0.5));
    }];
}

//设置digitalAlbumView
- (void)configDigitalAlbumView {
    [self.digitalAlbumView addSubview:self.digitalAlbumTitleLabel];
    
    [self.digitalAlbumView addSubview:self.digitalAlbumSubTitleLabel];
    
    [self.digitalAlbumView addSubview:self.digitalAlbumImgView];
    
    [self.digitalAlbumView addSubview:self.digitalAlbumLine];
    
    [self.digitalAlbumImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.mas_equalTo(0);
        make.width.mas_equalTo((BANNER_HEIGHT-fontSizeScale(10))/2);
    }];
    
    [self.digitalAlbumTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(fontSizeScale(15));
        make.right.mas_equalTo(self.digitalAlbumImgView.mas_left);
        make.height.mas_equalTo(fontSizeScale(14));
    }];
    
    [self.digitalAlbumSubTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(fontSizeScale(15));
        make.top.mas_equalTo(self.digitalAlbumTitleLabel.mas_bottom).offset(fontSizeScale(10));
        make.right.mas_equalTo(self.digitalAlbumImgView.mas_left);
        make.height.mas_equalTo(fontSizeScale(12));
    }];
    
    [self.digitalAlbumLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.right.mas_equalTo(self.digitalAlbumImgView.mas_left);
        make.width.mas_equalTo(fontSizeScale(0.5));
    }];
}

//点击事件
- (void)buttonClick:(UIButton *)button {
    
}

#pragma mark Lazy
- (MidDrawerMusicHallAdCarouselView *)adCarouselView {
    if (!_adCarouselView) {
        _adCarouselView = [[MidDrawerMusicHallAdCarouselView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, BANNER_HEIGHT) images:@[BANNER_IMAGEPATH_FIFTH,BANNER_IMAGEPATH_SECOND,BANNER_IMAGEPATH_THIRD,BANNER_IMAGEPATH_FOURTH,BANNER_IMAGEPATH_FIFTH,BANNER_IMAGEPATH_SIXTH]];
    }
    return _adCarouselView;
}

- (UIView *)operationView {
    if (!_operationView) {
        _operationView = [UIView createViewWithBackgroundColor:[UIColor whiteColor]];
        _operationView.frame = CGRectMake(fontSizeScale(10), CGRectGetMaxY(self.adCarouselView.frame), self.bounds.size.width-fontSizeScale(20), fontSizeScale(80));
        _operationView.layer.shadowColor = LINE_COLOR.CGColor;
        _operationView.layer.shadowOffset = CGSizeMake(0, 0);
        _operationView.layer.shadowOpacity = 0.8f;
    }
    return _operationView;
}

- (UIView *)personalityRadioView {
    if (!_personalityRadioView) {
        _personalityRadioView = [UIView createViewWithBackgroundColor:LINE_COLOR];
    }
    return _personalityRadioView;
}

- (UILabel *)personalityRadioTitleLabel {
    if (!_personalityRadioTitleLabel) {
        _personalityRadioTitleLabel = [UILabel createLabelWithText:@"个性电台" font:BIG_FONT textColor:[UIColor whiteColor]];
        _personalityRadioTitleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _personalityRadioTitleLabel;
}

- (UIImageView *)personalityRadioImgView {
    if (!_personalityRadioImgView) {
        _personalityRadioImgView = [UIImageView createImageViewWithImg:@"CD"];
    }
    return _personalityRadioImgView;
}

- (UIButton *)personalityRadioPlayButton {
    if (!_personalityRadioPlayButton) {
        _personalityRadioPlayButton = [UIButton createButtonWithTarget:self action:@selector(buttonClick:) title:nil textColor:nil imgStr:@"个性电台播放"];
        _personalityRadioPlayButton.tag = 888;
    }
    return _personalityRadioPlayButton;
}

- (UIView *)songAlbumView {
    if (!_songAlbumView) {
        _songAlbumView = [UIView createViewWithBackgroundColor:SECTION_BACKGROUNDCOLOR];
    }
    return _songAlbumView;
}

- (UILabel *)songAlbumTitleLabel {
    if (!_songAlbumTitleLabel) {
        _songAlbumTitleLabel = [UILabel createLabelWithText:@"新歌新碟" font:NORMAL_FONT textColor:BLACK_TEXTCOLOR];
    }
    return _songAlbumTitleLabel;
}

- (UILabel *)songAlbumSubTitleLabel {
    if (!_songAlbumSubTitleLabel) {
        _songAlbumSubTitleLabel = [UILabel createLabelWithText:@"XXXXXXXXXX" font:SMALL_FONT textColor:GRAY_TEXTCOLOR];
    }
    return _songAlbumSubTitleLabel;
}

- (UIImageView *)songAlbumImgView {
    if (!_songAlbumImgView) {
        _songAlbumImgView = [UIImageView createImageViewWithImg:@"CD"];
    }
    return _songAlbumImgView;
}

- (UIView *)songAlbumLine {
    if (!_songAlbumLine) {
        _songAlbumLine = [UIView createViewWithBackgroundColor:LINE_COLOR];
    }
    return _songAlbumLine;
}

- (UIView *)digitalAlbumView {
    if (!_digitalAlbumView) {
        _digitalAlbumView = [UIView createViewWithBackgroundColor:SECTION_BACKGROUNDCOLOR];
    }
    return _digitalAlbumView;
}

- (UILabel *)digitalAlbumTitleLabel {
    if (!_digitalAlbumTitleLabel) {
        _digitalAlbumTitleLabel = [UILabel createLabelWithText:@"数字专辑·票务" font:NORMAL_FONT textColor:BLACK_TEXTCOLOR];
    }
    return _digitalAlbumTitleLabel;
}

- (UILabel *)digitalAlbumSubTitleLabel {
    if (!_digitalAlbumSubTitleLabel) {
        _digitalAlbumSubTitleLabel = [UILabel createLabelWithText:@"XXXXXXXX" font:SMALL_FONT textColor:GRAY_TEXTCOLOR];
    }
    return _digitalAlbumSubTitleLabel;
}

- (UIImageView *)digitalAlbumImgView {
    if (!_digitalAlbumImgView) {
        _digitalAlbumImgView = [UIImageView createImageViewWithImg:@"CD"];
    }
    return _digitalAlbumImgView;
}

- (UIView *)digitalAlbumLine {
    if (!_digitalAlbumLine) {
        _digitalAlbumLine = [UIView createViewWithBackgroundColor:LINE_COLOR];
    }
    return _digitalAlbumLine;
}

@end
