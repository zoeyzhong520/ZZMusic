//
//  MidDrawerMineTableSectionHeaderView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/31.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerMineTableSectionHeaderView.h"

@interface MidDrawerMineTableSectionHeaderView ()

///0个歌单
@property (nonatomic, strong) UILabel *songListLabel;
///添加
@property (nonatomic, strong) UIButton *addButton;
///管理
@property (nonatomic, strong) UIButton *manageButton;

@end

@implementation MidDrawerMineTableSectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    [self addSubview:self.songListLabel];
    
    [self addSubview:self.addButton];
    
    [self addSubview:self.manageButton];
    
    [self addConstraints];
}

- (void)addConstraints {
    [self.songListLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(fontSizeScale(10));
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(self.bounds.size.width/2);
    }];
    
    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-fontSizeScale(64));
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(24), fontSizeScale(24)));
    }];
    
    [self.manageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-fontSizeScale(10));
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(24), fontSizeScale(24)));
    }];
}

//点击事件
- (void)buttonClick:(UIButton *)button {
    if (self.clickBlock) {
        self.clickBlock(button.tag == 0 ? MidDrawerMineTableSectionHeaderViewAdd : MidDrawerMineTableSectionHeaderViewManage);
    }
}

#pragma mark Lazy
- (UILabel *)songListLabel {
    if (!_songListLabel) {
        _songListLabel = [UILabel createLabelWithText:@"0个歌单" font:SMALL_FONT textColor:BLACK_TEXTCOLOR];
    }
    return _songListLabel;
}

- (UIButton *)addButton {
    if (!_addButton) {
        _addButton = [UIButton createButtonWithTarget:self action:@selector(buttonClick:) title:nil textColor:nil imgStr:@"添加歌单"];
        _addButton.tag = 0;
    }
    return _addButton;
}

- (UIButton *)manageButton {
    if (!_manageButton) {
        _manageButton = [UIButton createButtonWithTarget:self action:@selector(buttonClick:) title:nil textColor:nil imgStr:@"管理歌单"];
        _manageButton.tag = 1;
    }
    return _manageButton;
}

@end
