//
//  ZZMusicMenuBar.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/10.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "ZZMusicMenuBar.h"

@interface ZZMusicMenuBar ()

///titles
@property (nonatomic, strong) NSArray *titles;
///selectedBtn
@property (nonatomic, strong) UIButton *selectedBtn;
///indicatorLine
@property (nonatomic, strong) UIView *indicatorLine;
///bottomLine
@property (nonatomic, strong) UIView *bottomLine;
///btnW
@property (nonatomic, assign) CGFloat btnW;
///buttons
@property (nonatomic, strong) NSMutableArray *buttons;

@end

@implementation ZZMusicMenuBar

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titles = titles;
        [self createView];
    }
    return self;
}

- (void)createView {
    _btnW = self.bounds.size.width / self.titles.count;
    CGFloat btnH = self.bounds.size.height;
    
    for (int i = 0; i < self.titles.count; i ++) {
        UIButton *button = [UIButton createButtonWithTarget:self action:@selector(buttonClick:) title:self.titles[i] textColor:BLACK_TEXTCOLOR imgStr:nil];
        button.titleLabel.font = NORMAL_FONT;
        button.tag = i;
        button.frame = CGRectMake(_btnW*i, 0, _btnW, btnH);
        [self addSubview:button];
        
        [self.buttons addObject:button];
        
        if (i == 0) {
            _selectedBtn = button;
            [_selectedBtn setTitleColor:MAIN_COLOR forState:UIControlStateNormal];
        }
    }
    
    [self addSubview:self.indicatorLine];
    [self.indicatorLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.selectedBtn);
        make.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(25), fontSizeScale(3)));
    }];
    
    [self addSubview:self.bottomLine];
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(fontSizeScale(1));
    }];
}

//点击事件
- (void)buttonClick:(UIButton *)button {
    if (_selectedBtn != button) {
        [button setTitleColor:MAIN_COLOR forState:UIControlStateNormal];//当前选中的按钮
        [_selectedBtn setTitleColor:BLACK_TEXTCOLOR forState:UIControlStateNormal];//上一次选中的按钮
    }
    _selectedBtn = button;
    
    [UIView animateWithDuration:ANIMATE_DURATION animations:^{
        CGFloat tx = self.btnW*button.tag;
        self.indicatorLine.transform = CGAffineTransformMakeTranslation(tx, 0);
    }];
    
    [self createBlock:button.tag];
}

//设置Block
- (void)createBlock:(NSInteger)index {
    if (self.clickBlock) {
        self.clickBlock(index);
    }
}

#pragma mark Setter
- (void)setSelectedIndex:(NSInteger)selectedIndex {
    for (int i = 0; i < _buttons.count; i ++) {
        UIButton *button = (UIButton *)_buttons[i];
        [button setTitleColor:button.tag == selectedIndex ? MAIN_COLOR : BLACK_TEXTCOLOR forState:UIControlStateNormal];
        if (button.tag == selectedIndex) {
            _selectedBtn = button;
        }
    };
    
    [UIView animateWithDuration:ANIMATE_DURATION animations:^{
        CGFloat tx = self.btnW*selectedIndex;
        self.indicatorLine.transform = CGAffineTransformMakeTranslation(tx, 0);
    }];
}

#pragma mark Lazy
- (UIView *)indicatorLine {
    if (!_indicatorLine) {
        _indicatorLine = [UIView createViewWithBackgroundColor:MAIN_COLOR];
    }
    return _indicatorLine;
}

- (UIView *)bottomLine {
    if (!_bottomLine) {
        _bottomLine = [UIView createViewWithBackgroundColor:LINE_COLOR];
    }
    return _bottomLine;
}

- (NSMutableArray *)buttons {
    if (!_buttons) {
        _buttons = [NSMutableArray arrayWithCapacity:0];
    }
    return _buttons;
}

@end
