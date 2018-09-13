//
//  MidDrawerMusicHallTitleView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/13.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "ZZMusicSegmentedControlTitleView.h"

@interface ZZMusicSegmentedControlTitleView ()

///segmentedControl
@property (nonatomic, strong) UISegmentedControl *segmentedControl;
///items
@property (nonatomic, strong) NSArray *items;

@end

@implementation ZZMusicSegmentedControlTitleView

- (instancetype)initWithFrame:(CGRect)frame items:(NSArray *)items
{
    self = [super initWithFrame:frame];
    if (self) {
        self.items = items;
        [self createView];
    }
    return self;
}

- (void)createView {
    [self addSubview:self.segmentedControl];
}

//点击事件
- (void)valueChanged:(UISegmentedControl *)segmentedControl {
    if (self.clickBlock) {
        self.clickBlock(segmentedControl.selectedSegmentIndex);
    }
}

#pragma mark Lazy
- (UISegmentedControl *)segmentedControl {
    if (!_segmentedControl) {
        _segmentedControl = [[UISegmentedControl alloc] initWithItems:self.items];
        _segmentedControl.selectedSegmentIndex = 0;
        _segmentedControl.frame = self.bounds;
        [_segmentedControl addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _segmentedControl;
}

- (NSArray *)items {
    if (!_items) {
        _items = [NSArray array];
    }
    return _items;
}

@end
