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
///images 图片
@property (nonatomic, strong) NSArray *images;
///titles 标题
@property (nonatomic, strong) NSArray *titles;
///itemWidth
@property (nonatomic, assign) CGFloat itemWidth;
///itemHeight
@property (nonatomic, assign) CGFloat itemHeight;

@end

@implementation ZZMusicCollectShapeAlertScrollView

- (instancetype)initWithFrame:(CGRect)frame images:(NSArray *)images titles:(NSArray *)titles
{
    self = [super initWithFrame:frame];
    if (self) {
        self.columnCount = 6;
        self.itemWidth = self.bounds.size.width/9*2;
        self.itemHeight = self.bounds.size.height/2;
        self.images = images;
        self.titles = titles;
        [self createView];
    }
    return self;
}

- (void)createView {
    [self addSubview:self.scrollView];
    
    for (int i = 0; i < self.images.count; i ++) {
        UIButton *button = [UIButton createButtonWithTarget:self action:@selector(buttonClick:) title:self.titles[i] textColor:BLACK_TEXTCOLOR imgStr:self.images[i]];
        button.titleLabel.font = SMALL_FONT;
        button.tag = i;
        button.frame = CGRectMake(_itemWidth*(i%_columnCount), _itemHeight*(i/_columnCount), _itemWidth, _itemHeight);
        [button setTopImageBottomTitleWithMargin:15];
        [self.scrollView addSubview:button];
    }
}

//点击事件
- (void)buttonClick:(UIButton *)button {
    
}

#pragma mark Lazy
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.contentSize = CGSizeMake(self.itemWidth*self.columnCount, 0);
        _scrollView.contentOffset = CGPointMake(0, 0);
    }
    return _scrollView;
}

- (NSArray *)images {
    if (!_images) {
        _images = [NSArray array];
    }
    return _images;
}

- (NSArray *)titles {
    if (!_titles) {
        _titles = [NSArray array];
    }
    return _titles;
}

@end
