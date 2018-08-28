//
//  MidDrawerBubbleView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/27.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerBubbleView.h"
#import "MidDrawerBubbleTableViewCell.h"

@interface MidDrawerBubbleView ()<UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) NSArray *images;

@property (nonatomic, strong) UITableView *tableView;

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
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
    tapGes.delegate = self;
    [self addGestureRecognizer:tapGes];
    
    if (self.contentView == nil) {
        self.contentView = [UIView createViewWithBackgroundColor:[UIColor whiteColor]];
        self.contentView.frame = CGRectMake((SCREEN_WIDTH - BUBBLE_WIDTH) / 2, (SCREEN_HEIGHT - self.titles.count * BUBBLE_SINGLEROW_HEIGHT) / 2, BUBBLE_WIDTH, self.titles.count * BUBBLE_SINGLEROW_HEIGHT);
        [self addSubview:self.contentView];
        
        [self configContentView];
    }
}

//ConfigContentView
- (void)configContentView {
    BubbleLayer *bubbleLayer = [[BubbleLayer alloc] initWithSize:self.contentView.frame.size];
    [self.contentView.layer setMask:[bubbleLayer layer]];
    
    UIButton *button = [UIButton createButtonWithTarget:nil action:nil title:nil textColor:nil imgStr:nil];
    button.frame = self.contentView.bounds;
    [self.contentView addSubview:button];
    
    [self.contentView addSubview:self.tableView];
    [self.tableView reloadData];
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

#pragma mark UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MidDrawerBubbleTableViewCell *cell = [MidDrawerBubbleTableViewCell createCellWithTableView:tableView indexPath:indexPath];
    cell.titleText = self.titles[indexPath.row];
    cell.imgStr = self.images[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return ![NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"];
}

#pragma mark Lazy
- (NSArray *)titles {
    if (!_titles) {
        _titles = [NSArray array];
    }
    return _titles;
}

- (UITableView *)tableView {
    if (!_tableView) {
        //气泡视图箭头高度为10
        CGFloat rowHeight = (self.contentView.bounds.size.height - 10) / self.titles.count;
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 10, self.contentView.bounds.size.width, self.contentView.bounds.size.height) style:UITableViewStylePlain];
        _tableView.rowHeight = rowHeight;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[MidDrawerBubbleTableViewCell class] forCellReuseIdentifier:@"MidDrawerBubbleTableViewCellID"];
        _tableView.scrollEnabled = NO;
    }
    return _tableView;
}

@end
