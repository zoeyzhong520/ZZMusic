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
    
    CGFloat W = self.bounds.size.width / 3;
    CGFloat H = self.bounds.size.height;
    
    for (int i = 0; i < self.titles.count; i ++) {
        UIButton *button = [UIButton createButtonWithTarget:self action:@selector(buttonClick:) title:self.titles[i] textColor:[UIColor whiteColor] imgStr:nil];
        button.tag = i;
        [self addSubview:button];
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(W*i);
            make.size.mas_equalTo(CGSizeMake(W, H));
            make.centerY.mas_equalTo(0);
        }];
    }
}

//点击事件
- (void)buttonClick:(UIButton *)button {
    if (_selectedButton != button) {
        //本次点击的按钮
    }
    _selectedButton = button;
}

#pragma mark Lazy
- (NSArray *)titles {
    if (!_titles) {
        _titles = [NSArray array];
    }
    return _titles;
}

@end
