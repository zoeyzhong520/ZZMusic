//
//  MidDrawerFindView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/29.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerFindView.h"
#import "MidDrawerFindHeaderView.h"

@interface MidDrawerFindView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
///数据源
@property (nonatomic, strong) NSArray *dataArray;
///tableHeaderView
@property (nonatomic, strong) MidDrawerFindHeaderView *tableHeaderView;

@end

@implementation MidDrawerFindView

- (instancetype)initWithFrame:(CGRect)frame {
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

#pragma mark UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UITableViewCell new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark Lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = fontSizeScale(40);
    }
    return _tableView;
}

- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSArray array];
    }
    return _dataArray;
}

- (MidDrawerFindHeaderView *)tableHeaderView {
    if (!_tableHeaderView) {
        _tableHeaderView = [[MidDrawerFindHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, FIND_BANNER_HEIGHT+fontSizeScale(100))];
    }
    return _tableHeaderView;
}

@end
