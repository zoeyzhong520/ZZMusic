//
//  MidDrawerSingerDetailView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/14.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerSingerDetailView.h"
#import "MidDrawerSingerDetailTableHeaderView.h"

@interface MidDrawerSingerDetailView ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

///tableView
@property (nonatomic, strong) UITableView *tableView;
///tableHeaderView
@property (nonatomic, strong) MidDrawerSingerDetailTableHeaderView *tableHeaderView;

@end

@implementation MidDrawerSingerDetailView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    [self addSubview:self.tableView];
    self.tableView.tableHeaderView = self.tableHeaderView;
    [self.tableView reloadData];
}

//设置Delegate
- (void)createDelegate:(UIScrollView *)scrollView {
    if (self.delegate && [self.delegate respondsToSelector:@selector(MidDrawerSingerDetailViewScrollViewDidScroll:)]) {
        [self.delegate MidDrawerSingerDetailViewScrollViewDidScroll:scrollView];
    }
}

#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self createDelegate:scrollView];
}

#pragma mark UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 25;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UITableViewCell new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark Lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.rowHeight = fontSizeScale(60);
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    }
    return _tableView;
}

- (MidDrawerSingerDetailTableHeaderView *)tableHeaderView {
    if (!_tableHeaderView) {
        _tableHeaderView = [[MidDrawerSingerDetailTableHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, SINGERDETAIL_HEADERVIEW_HEIGHT)];
    }
    return _tableHeaderView;
}

@end
