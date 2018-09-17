//
//  BaseNavigationTitleView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/29.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "BaseNavigationTitleView.h"

@interface BaseNavigationTitleView ()

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) UIButton *selectedButton;

@property (nonatomic, strong) NSMutableArray *buttons;

@end

@implementation BaseNavigationTitleView

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles {
    self = [super initWithFrame:frame];
    if (self) {
        self.titles = titles;
        [self createView];
    }
    return self;
}

- (void)createView {
    NSAssert(self.titles.count > 0, @"titles为空！");
    
    CGFloat W = self.bounds.size.width / _titles.count;
    CGFloat H = self.bounds.size.height;
    
    for (int i = 0; i < self.titles.count; i ++) {
        UIButton *button = [UIButton createButtonWithTarget:self action:@selector(buttonClick:) title:self.titles[i] textColor:MIDDRAWER_UNSELECTED_COLOR imgStr:nil];
        button.tag = i;
        [self addSubview:button];
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(W*i);
            make.size.mas_equalTo(CGSizeMake(W, H));
            make.centerY.mas_equalTo(0);
        }];
        
        //默认选中第一个
        if (i == 1) { _selectedButton = button; [_selectedButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal]; }
        
        [self.buttons addObject:button];
    }
}

//点击事件
- (void)buttonClick:(UIButton *)button {
    if (_selectedButton != button) {
        //button即为本次点击的按钮
        //234 249 241
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_selectedButton setTitleColor:MIDDRAWER_UNSELECTED_COLOR forState:UIControlStateNormal];
    }
    _selectedButton = button;
    
    if (self.buttonClickBlock) { self.buttonClickBlock(button.tag); }
}

#pragma mark Setter
- (void)setSelectedIndex:(NSInteger)selectedIndex {
    for (UIButton *btn in self.buttons) {
        if (btn.tag == selectedIndex) { _selectedButton = btn; }
        [btn setTitleColor:btn.tag == selectedIndex ? [UIColor whiteColor] : MIDDRAWER_UNSELECTED_COLOR forState:UIControlStateNormal];
    }
}

#pragma mark Lazy
- (NSArray *)titles {
    if (!_titles) {
        _titles = [NSArray array];
    }
    return _titles;
}

- (NSMutableArray *)buttons {
    if (!_buttons) {
        _buttons = [NSMutableArray arrayWithCapacity:0];
    }
    return _buttons;
}

@end
