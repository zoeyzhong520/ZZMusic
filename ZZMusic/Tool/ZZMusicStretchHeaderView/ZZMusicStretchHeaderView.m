//
//  ZZMusicStretchHeaderView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/14.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "ZZMusicStretchHeaderView.h"

@interface ZZMusicStretchHeaderView ()

///stretchView
@property (nonatomic, strong) UIView *stretchView;
///imageRatio 比例
@property (nonatomic, assign) CGFloat imageRatio;
///originFrame 原始尺寸
@property (nonatomic, assign) CGRect originFrame;

@end

@implementation ZZMusicStretchHeaderView

- (instancetype)initWithStretchView:(UIView *)stretchView
{
    self = [super init];
    if (self) {
        self.stretchView = stretchView;
        self.originFrame = stretchView.frame;
        self.imageRatio = stretchView.bounds.size.height / stretchView.bounds.size.width;
    }
    return self;
}

- (void)scrollViewDidScrollWithScrollView:(UIScrollView *)scrollView {
    CGFloat yOffset = scrollView.contentOffset.y;
    if (yOffset > 0) {//往上移动
        CGRect frame = _originFrame;
        frame.origin.y = _originFrame.origin.y - yOffset;
        _stretchView.frame = frame;
    } else {//往下移动
        CGRect frame = _originFrame;
        frame.size.height = _originFrame.size.height - yOffset;
        frame.size.width = frame.size.height / _imageRatio;
        frame.origin.x = _originFrame.origin.x - (frame.size.width - _originFrame.size.width)*0.5;
        _stretchView.frame = frame;
    }
}

#pragma mark Lazy
- (UIView *)stretchView {
    if (!_stretchView) {
        _stretchView = [UIView createViewWithBackgroundColor:[UIColor whiteColor]];
    }
    return _stretchView;
}

@end
