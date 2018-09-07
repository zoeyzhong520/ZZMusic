//
//  AboutView.m
//  ZZMusic
//
//  Created by 仲召俊 on 2018/9/7.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "AboutView.h"
#import "AboutTableHeaderView.h"
#import "AboutTableViewCell.h"

@interface AboutView ()<UITableViewDelegate, UITableViewDataSource>

///tableView
@property (nonatomic, strong) UITableView *tableView;
///dataArray
@property (nonatomic, strong) NSArray *dataArray;
///tableHeaderView
@property (nonatomic, strong) AboutTableHeaderView *tableHeaderView;

@end

@implementation AboutView

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

#pragma mark UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AboutTableViewCell *cell = [AboutTableViewCell createCellWithTableView:tableView indexPath:indexPath];
    cell.titleText = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark Lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.rowHeight = fontSizeScale(40);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[AboutTableViewCell class] forCellReuseIdentifier:@"AboutTableViewCellID"];
    }
    return _tableView;
}

- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[@"给我们评分",@"欢迎页",@"版本介绍"];
    }
    return _dataArray;
}

- (AboutTableHeaderView *)tableHeaderView {
    if (!_tableHeaderView) {
        _tableHeaderView = [[AboutTableHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, FIND_BANNER_HEIGHT)];
    }
    return _tableHeaderView;
}

@end
