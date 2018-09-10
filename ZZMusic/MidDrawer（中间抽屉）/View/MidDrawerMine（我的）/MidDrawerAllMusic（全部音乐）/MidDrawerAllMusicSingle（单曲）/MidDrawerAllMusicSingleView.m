//
//  MidDrawerAllMusicSingleView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/10.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerAllMusicSingleView.h"
#import "MidDrawerAllMusicSingleTableViewCell.h"
#import "MidDrawerAllMusicSinglePlayAllTableViewCell.h"

@interface MidDrawerAllMusicSingleView ()<UITableViewDelegate, UITableViewDataSource>

///searchBar
@property (nonatomic, strong) UIView *searchBar;
///tableView
@property (nonatomic, strong) UITableView *tableView;
///数据源
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation MidDrawerAllMusicSingleView

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
    self.tableView.tableHeaderView = self.searchBar;
    [self.tableView reloadData];
}

#pragma mark UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        MidDrawerAllMusicSinglePlayAllTableViewCell *cell = [MidDrawerAllMusicSinglePlayAllTableViewCell createCellWithTableView:tableView indexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        MidDrawerAllMusicSingleTableViewCell *cell = [MidDrawerAllMusicSingleTableViewCell createCellWithTableView:tableView indexPath:indexPath];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        return;
    }
}

#pragma mark Lazy
- (UIView *)searchBar {
    if (!_searchBar) {
        _searchBar = [UIView createViewWithBackgroundColor:SECTION_BACKGROUNDCOLOR];
        _searchBar.frame = CGRectMake(0, 0, self.bounds.size.width, BUBBLE_SINGLEROW_HEIGHT);
    }
    return _searchBar;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.rowHeight = fontSizeScale(50);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[MidDrawerAllMusicSingleTableViewCell class] forCellReuseIdentifier:@"MidDrawerAllMusicSingleTableViewCellID"];
        [_tableView registerClass:[MidDrawerAllMusicSinglePlayAllTableViewCell class] forCellReuseIdentifier:@"MidDrawerAllMusicSinglePlayAllTableViewCellID"];
    }
    return _tableView;
}

- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSArray array];
    }
    return _dataArray;
}

@end
