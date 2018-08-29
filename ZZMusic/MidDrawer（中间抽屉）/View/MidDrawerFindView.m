//
//  MidDrawerFindView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/29.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerFindView.h"

@implementation MidDrawerFindView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    self.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [UILabel createLabelWithText:@"3" font:NORMAL_FONT textColor:BLACK_TEXTCOLOR];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(100), fontSizeScale(100)));
    }];
}

@end
