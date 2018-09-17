//
//  MidDrawerSingerDetailMVView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/17.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerSingerDetailMVView.h"

@implementation MidDrawerSingerDetailMVView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    UILabel *label = [UILabel createLabelWithText:@"3" font:BIG_FONT textColor:BLACK_TEXTCOLOR];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake([label singleLineWidth], fontSizeScale(20)));
    }];
}

@end
