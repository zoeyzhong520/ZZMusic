//
//  ZZMusicCollectShapeAlertScrollView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/11.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "ZZMusicCollectShapeAlertScrollView.h"

@interface ZZMusicCollectShapeAlertScrollView ()

///scrollView
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ZZMusicCollectShapeAlertScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.rowCount = 2;
        self.columnCount = 6;
        [self createView];
    }
    return self;
}

- (void)createView {
    
}

#pragma mark Lazy
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.contentSize = CGSizeMake(<#CGFloat width#>, <#CGFloat height#>)
    }
}

@end
