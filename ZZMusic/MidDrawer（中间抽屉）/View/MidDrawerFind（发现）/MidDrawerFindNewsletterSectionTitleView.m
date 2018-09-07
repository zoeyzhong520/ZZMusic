//
//  MidDrawerFindNewsletterSectionTitleView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/7.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerFindNewsletterSectionTitleView.h"

@interface MidDrawerFindNewsletterSectionTitleView ()

///titleLabel
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation MidDrawerFindNewsletterSectionTitleView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self createView];
    }
    return self;
}

- (void)createView {
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(fontSizeScale(12.5));
        make.top.mas_equalTo(fontSizeScale(10));
        make.size.mas_equalTo(CGSizeMake([self.titleLabel singleLineWidth], fontSizeScale(14)));
    }];
}

#pragma mark Setter
- (void)setTitleText:(NSString *)titleText {
    self.titleLabel.text = titleText;
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake([self.titleLabel singleLineWidth], fontSizeScale(14)));
    }];
}

#pragma mark Lazy
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel createLabelWithText:@"" font:NORMAL_FONT textColor:[UIColor whiteColor]];
        _titleLabel.backgroundColor = [UIColor blackColor];
    }
    return _titleLabel;
}

@end
