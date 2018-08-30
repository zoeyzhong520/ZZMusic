//
//  MidDrawerSearchHistoryView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/30.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerSearchHistoryView.h"

@implementation MidDrawerSearchHistoryView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    self.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [UILabel createLabelWithText:@"这是搜索历史记录" font:NORMAL_FONT textColor:BLACK_TEXTCOLOR];
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 100));
    }];
}

@end
