//
//  BaseNavigationBar.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/27.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "BaseNavigationBar.h"

@interface BaseNavigationBar ()

//左侧呼出菜单按钮
@property (nonatomic, strong) UIButton *leftMenuButton;

//右侧呼出气泡视图按钮
@property (nonatomic, strong) UIButton *rightBubbleButton;

@end

@implementation BaseNavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    self.backgroundColor = MAIN_COLOR;
    
    [self addSubview:self.leftMenuButton];
    
    [self addSubview:self.rightBubbleButton];
    
    [self addConstraints];
}

//设置约束
- (void)addConstraints {
    [self.leftMenuButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(STATUS_BAR_HEIGHT);
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(48), fontSizeScale(48)));
    }];
    
    [self.rightBubbleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.centerY.mas_equalTo(self.leftMenuButton);
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(48), fontSizeScale(48)));
    }];
}

//点击事件
- (void)buttonClickAction:(UIButton *)button {
    if (self.clickBlock != nil) {
        self.clickBlock(button.tag == 0 ? LeftMenuButton : RightBubbleButton);
    }
}

#pragma mark - Lazy
- (UIButton *)leftMenuButton {
    if (!_leftMenuButton) {
        _leftMenuButton = [UIButton createButtonWithTarget:self action:@selector(buttonClickAction:) title:nil textColor:nil imgStr:@"midLeftMenu"];
        _leftMenuButton.tag = 0;
    }
    return _leftMenuButton;
}

- (UIButton *)rightBubbleButton {
    if (!_rightBubbleButton) {
        _rightBubbleButton = [UIButton createButtonWithTarget:self action:@selector(buttonClickAction:) title:nil textColor:nil imgStr:@"midRightBubble"];
        _rightBubbleButton.tag = 1;
    }
    return _rightBubbleButton;
}

@end
