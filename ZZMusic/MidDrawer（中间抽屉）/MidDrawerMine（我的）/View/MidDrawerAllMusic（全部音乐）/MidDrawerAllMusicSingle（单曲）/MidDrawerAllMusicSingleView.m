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
#import "MidDrawerAllMusicSingleSearchBar.h"

@interface MidDrawerAllMusicSingleView ()<UITableViewDelegate, UITableViewDataSource>

///searchBar
@property (nonatomic, strong) MidDrawerAllMusicSingleSearchBar *searchBar;
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
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        MidDrawerAllMusicSinglePlayAllTableViewCell *cell = [MidDrawerAllMusicSinglePlayAllTableViewCell createCellWithTableView:tableView indexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        WeakSelf;
        cell.clickBlock = ^{
            [weakSelf setBatchOperationView];
        };
        return cell;
    } else {
        MidDrawerAllMusicSingleTableViewCell *cell = [MidDrawerAllMusicSingleTableViewCell createCellWithTableView:tableView indexPath:indexPath];
        WeakSelf;
        cell.clickBlock = ^{
            [weakSelf setAlertView];
        };
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        return;
    }
}

//设置批量操作View
- (void)setBatchOperationView {
    MidDrawerAllMusicBatchOperationView *batchOperationView = [[MidDrawerAllMusicBatchOperationView alloc] initWithFrame:CGRectZero];
    [batchOperationView show];
}

//设置弹框
- (void)setAlertView {
    ZZMusicCollectShapeAlertView *alert = [[ZZMusicCollectShapeAlertView alloc] initWithFrame:CGRectZero];
    [alert show];
}

#pragma mark Lazy
- (MidDrawerAllMusicSingleSearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[MidDrawerAllMusicSingleSearchBar alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, SEARCHBAR_HEIGHT)];
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
