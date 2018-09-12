//
//  MidDrawerAllMusicSinger.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/10.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerAllMusicSingerView.h"
#import "MidDrawerAllMusicSingerTableViewCell.h"

@interface MidDrawerAllMusicSingerView ()<UITableViewDelegate, UITableViewDataSource>

///tableView
@property (nonatomic, strong) UITableView *tableView;
///数据源
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation MidDrawerAllMusicSingerView

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
    MidDrawerAllMusicSingerTableViewCell *cell = [MidDrawerAllMusicSingerTableViewCell createCellWithTableView:tableView indexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark Lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.rowHeight = fontSizeScale(50);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[MidDrawerAllMusicSingerTableViewCell class] forCellReuseIdentifier:@"MidDrawerAllMusicSingerTableViewCellID"];
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
