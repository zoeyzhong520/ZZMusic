//
//  MidDrawerAllMusicSingleSearchBar.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/11.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerAllMusicSingleSearchBar.h"

@interface MidDrawerAllMusicSingleSearchBar ()

///button
@property (nonatomic, strong) UIButton *button;

@end

@implementation MidDrawerAllMusicSingleSearchBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    [self addSubview:self.button];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(fontSizeScale(10), fontSizeScale(10), fontSizeScale(10), fontSizeScale(10)));
    }];
}

//点击事件
- (void)buttonClick {
    
}

#pragma mark Lazy
- (UIButton *)button {
    if (!_button) {
        _button = [UIButton createButtonWithTarget:self action:@selector(buttonClick) title:@"搜索我的全部歌曲" textColor:GRAY_TEXTCOLOR imgStr:@"search"];
        _button.backgroundColor = SECTION_BACKGROUNDCOLOR;
        _button.titleLabel.font = NORMAL_FONT;
        [_button setEdgeInsetsWithTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0) imageEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 0)];
        _button.layer.masksToBounds = YES;
        _button.layer.cornerRadius = 5.0f;
    }
    return _button;
}

@end
