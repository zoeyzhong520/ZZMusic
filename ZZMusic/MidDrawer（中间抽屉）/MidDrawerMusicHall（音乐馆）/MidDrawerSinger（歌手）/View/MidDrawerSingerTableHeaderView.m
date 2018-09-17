//
//  MidDrawerSingerTableHeaderView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/13.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerSingerTableHeaderView.h"

@interface MidDrawerSingerTableHeaderView ()

///areaScrollView
@property (nonatomic, strong) UIScrollView *areaScrollView;
///genderScrollView
@property (nonatomic, strong) UIScrollView *genderScrollView;
///musicTypeScrollView
@property (nonatomic, strong) UIScrollView *musicTypeScrollView;
///areas
@property (nonatomic, strong) NSArray *areas;
///genders
@property (nonatomic, strong) NSArray *genders;
///musicTypes
@property (nonatomic, strong) NSArray *musicTypes;
///itemWidth
@property (nonatomic, assign) CGFloat itemWidth;
///itemHeight
@property (nonatomic, assign) CGFloat itemHeight;
///areaBottomLine
@property (nonatomic, strong) UIView *areaBottomLine;
///genderBottomLine
@property (nonatomic, strong) UIView *genderBottomLine;

@end

@implementation MidDrawerSingerTableHeaderView

- (instancetype)initWithFrame:(CGRect)frame areas:(NSArray *)areas genders:(NSArray *)genders musicTypes:(NSArray *)musicTypes
{
    self = [super initWithFrame:frame];
    if (self) {
        self.areas = areas;
        self.genders = genders;
        self.musicTypes = musicTypes;
        self.itemWidth = self.bounds.size.width/13*2;
        self.itemHeight = self.bounds.size.height/3;
        [self createView];
    }
    return self;
}

- (void)createView {
    [self addSubview:self.areaScrollView];
    [self configScrollViewWithView:self.areaScrollView];
    
    [self addSubview:self.genderScrollView];
    [self configScrollViewWithView:self.genderScrollView];
    
    [self addSubview:self.musicTypeScrollView];
    [self configScrollViewWithView:self.musicTypeScrollView];
    
    [self addSubview:self.areaBottomLine];
    
    [self addSubview:self.genderBottomLine];
    
    [self addConstraints];
}

//设置scrollView
- (void)configScrollViewWithView:(UIScrollView *)scrollView {
    NSArray *titles = [NSArray array];
    if (scrollView == self.areaScrollView) {
        titles = self.areas;
    } else if (scrollView == self.genderScrollView) {
        titles = self.genders;
    } else if (scrollView == self.musicTypeScrollView) {
        titles = self.musicTypes;
    }
    
    for (int i = 0; i < titles.count; i ++) {
        UIButton *button = [UIButton createButtonWithTarget:self action:@selector(buttonClick:) title:titles[i] textColor:BLACK_TEXTCOLOR imgStr:nil];
        button.titleLabel.font = SMALL_FONT;
        button.frame = CGRectMake(_itemWidth*i, 0, _itemWidth, _itemHeight);
        button.backgroundColor = SECTION_BACKGROUNDCOLOR;
        [scrollView addSubview:button];
        
        if (i == 0) {
            [button setTitleColor:MAIN_COLOR forState:UIControlStateNormal];
        }
    }
}

//添加约束
- (void)addConstraints {
    [self.areaBottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.areaScrollView.mas_bottom);
        make.height.mas_equalTo(fontSizeScale(0.5));
    }];
    
    [self.genderBottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.genderScrollView.mas_bottom);
        make.height.mas_equalTo(fontSizeScale(0.5));
    }];
}

//点击事件
- (void)buttonClick:(UIButton *)button {
    
}

#pragma mark Lazy
- (UIScrollView *)areaScrollView {
    if (!_areaScrollView) {
        _areaScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height/3)];
        _areaScrollView.showsHorizontalScrollIndicator = NO;
        _areaScrollView.showsVerticalScrollIndicator = NO;
        _areaScrollView.contentOffset = CGPointMake(0, 0);
        _areaScrollView.contentSize = CGSizeMake(_itemWidth*_areas.count, 0);
        _areaScrollView.backgroundColor = SECTION_BACKGROUNDCOLOR;
    }
    return _areaScrollView;
}

- (UIScrollView *)genderScrollView {
    if (!_genderScrollView) {
        _genderScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.areaScrollView.frame), self.bounds.size.width, self.bounds.size.height/3)];
        _genderScrollView.showsHorizontalScrollIndicator = NO;
        _genderScrollView.showsVerticalScrollIndicator = NO;
        _genderScrollView.contentOffset = CGPointMake(0, 0);
        _genderScrollView.contentSize = CGSizeMake(_itemWidth*_genders.count, 0);
        _genderScrollView.backgroundColor = SECTION_BACKGROUNDCOLOR;
    }
    return _genderScrollView;
}

- (UIScrollView *)musicTypeScrollView {
    if (!_musicTypeScrollView) {
        _musicTypeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.genderScrollView.frame), self.bounds.size.width, self.bounds.size.height/3)];
        _musicTypeScrollView.showsHorizontalScrollIndicator = NO;
        _musicTypeScrollView.showsVerticalScrollIndicator = NO;
        _musicTypeScrollView.contentOffset = CGPointMake(0, 0);
        _musicTypeScrollView.contentSize = CGSizeMake(_itemWidth*_musicTypes.count, 0);
        _musicTypeScrollView.backgroundColor = SECTION_BACKGROUNDCOLOR;
    }
    return _musicTypeScrollView;
}

- (NSArray *)areas {
    if (!_areas) {
        _areas = [NSArray array];
    }
    return _areas;
}

- (NSArray *)genders {
    if (!_genders) {
        _genders = [NSArray array];
    }
    return _genders;
}

- (NSArray *)musicTypes {
    if (!_musicTypes) {
        _musicTypes = [NSArray array];
    }
    return _musicTypes;
}

- (UIView *)areaBottomLine {
    if (!_areaBottomLine) {
        _areaBottomLine = [UIView createViewWithBackgroundColor:LINE_COLOR];
    }
    return _areaBottomLine;
}

- (UIView *)genderBottomLine {
    if (!_genderBottomLine) {
        _genderBottomLine = [UIView createViewWithBackgroundColor:LINE_COLOR];
    }
    return _genderBottomLine;
}

@end
