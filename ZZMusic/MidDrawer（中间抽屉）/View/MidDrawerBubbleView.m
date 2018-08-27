//
//  MidDrawerBubbleView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/27.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerBubbleView.h"

@interface MidDrawerBubbleView ()

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) NSArray *images;

@end

@implementation MidDrawerBubbleView

- (instancetype)initWithTitles:(NSArray *)titles images:(NSArray *)images {
    self = [super init];
    if (self) {
        self.titles = titles;
        self.images = images;
        [self createView];
    }
    return self;
}

- (void)createView {
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.backgroundColor = MONGOLIANLAYER_COLOR;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)]];
    
    if (self.contentView == nil) {
        self.contentView = [UIView createViewWithBackgroundColor:[UIColor whiteColor]];
        self.contentView.frame = CGRectMake((SCREEN_WIDTH - BUBBLE_WIDTH) / 2, (SCREEN_HEIGHT - self.titles.count * BUBBLE_SINGLEROW_HEIGHT) / 2, BUBBLE_WIDTH, self.titles.count * BUBBLE_SINGLEROW_HEIGHT);
        [self.contentView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)]];
        [self addSubview:self.contentView];
        
        [self configContentView];
    }
}

//ConfigContentView
- (void)configContentView {
    BubbleLayer *bubbleLayer = [[BubbleLayer alloc] initWithSize:self.contentView.frame.size];
    [self.contentView.layer setMask:[bubbleLayer layer]];
}

//点击事件
- (void)tapAction:(UITapGestureRecognizer *)gesture {
    //不执行操作
}

#pragma mark 显示
- (void)show {
    self.alpha = 0.0;
    [UIView animateWithDuration:ANIMATE_DURATION animations:^{
        self.alpha = 1.0;
        [ZZKEYWINDOW addSubview:self];
    } completion:nil];
}

#pragma mark 隐藏
- (void)hide {
    self.alpha = 1.0;
    [UIView animateWithDuration:ANIMATE_DURATION animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark Setter
- (void)setSourceView:(UIView *)sourceView {
    _sourceView = sourceView;
    //设置contentView的顶点位置
    self.contentView.frame = CGRectMake(SCREEN_WIDTH - BUBBLE_WIDTH - 10, CGRectGetMaxY(sourceView.frame), BUBBLE_WIDTH, self.titles.count * BUBBLE_SINGLEROW_HEIGHT);
    
    BubbleLayer *bubbleLayer = [[BubbleLayer alloc] initWithSize:self.contentView.frame.size];
    bubbleLayer.arrowPosition = 0.96;
    bubbleLayer.arrowDirection = ArrowDirectionTop;
    bubbleLayer.cornerRadius = 5;
    [self.contentView.layer setMask:[bubbleLayer layer]];
}

#pragma mark Lazy
- (NSArray *)titles {
    if (!_titles) {
        _titles = [NSArray array];
    }
    return _titles;
}

@end
