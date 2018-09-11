//
//  MidDrawerAllMusicBatchOperationBottomMenu.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/11.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerAllMusicBatchOperationBottomMenu.h"

@interface MidDrawerAllMusicBatchOperationBottomMenu ()

///line
@property (nonatomic, strong) UIView *line;
///buttons
@property (nonatomic, strong) NSMutableArray *buttons;

@end

@implementation MidDrawerAllMusicBatchOperationBottomMenu

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    NSArray *images = @[@"删除",@"下载",@"添加到",@"设背景音乐"];
    NSArray *names = @[@"删除",@"下载",@"添加到",@"设背景音乐"];
    CGFloat btnW = self.bounds.size.width / images.count;
    CGFloat btnH = self.bounds.size.height;
    
    for (int i = 0; i < images.count; i ++) {
        UIButton *button = [UIButton createButtonWithTarget:self action:@selector(buttonClick:) title:names[i] textColor:GRAY_TEXTCOLOR imgStr:images[i]];
        button.titleLabel.font = SMALL_FONT;
        button.tag = i;
        button.frame = CGRectMake(btnW*i, 0, btnW, btnH);
        [button setTopImageBottomTitleWithMargin:10];
        button.userInteractionEnabled = NO;
        [self addSubview:button];
        
        [self.buttons addObject:button];
    }
    
    [self addSubview:self.line];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(fontSizeScale(0.5));
    }];
    
    self.backgroundColor = SECTION_BACKGROUNDCOLOR;
}

//点击事件
- (void)buttonClick:(UIButton *)button {
    
}

#pragma mark Setter
- (void)setIsEnable:(BOOL)isEnable {
    NSArray *images = @[@"删除",@"下载",@"添加到",@"设背景音乐"];
    NSArray *blackImages = @[@"删除黑色",@"下载黑色",@"添加到黑色",@"设背景音乐黑色"];
    
    for (int i = 0; i < self.buttons.count; i ++) {
        UIButton *button = (UIButton *)_buttons[i];
        [button setTitleColor:isEnable ? BLACK_TEXTCOLOR : GRAY_TEXTCOLOR forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:isEnable ? blackImages[i] : images[i]] forState:UIControlStateNormal];
        button.userInteractionEnabled = isEnable;
    }
}

#pragma mark Lazy
- (UIView *)line {
    if (!_line) {
        _line = [UIView createViewWithBackgroundColor:LINE_COLOR];
    }
    return _line;
}

- (NSMutableArray *)buttons {
    if (!_buttons) {
        _buttons = [NSMutableArray arrayWithCapacity:0];
    }
    return _buttons;
}

@end
