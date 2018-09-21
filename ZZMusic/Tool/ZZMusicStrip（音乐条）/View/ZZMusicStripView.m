//
//  ZZMusicStripView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/21.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "ZZMusicStripView.h"

@implementation ZZMusicStripView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    CGFloat originY = SCREEN_HEIGHT-BUBBLE_SINGLEROW_HEIGHT-(iPhoneX || iPhoneXSMax ? 34 : 0);
    CGFloat height = BUBBLE_SINGLEROW_HEIGHT+(iPhoneX || iPhoneXSMax ? 34 : 0);
    
    self.frame = CGRectMake(0, originY, SCREEN_WIDTH, height);
}

//显示
- (void)show {
    [ZZKEYWINDOW addSubview:self];
}

@end
