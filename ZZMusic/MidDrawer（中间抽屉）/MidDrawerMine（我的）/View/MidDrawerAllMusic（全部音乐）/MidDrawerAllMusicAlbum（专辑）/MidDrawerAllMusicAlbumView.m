//
//  MidDrawerAllMusicAlbum.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/10.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerAllMusicAlbumView.h"
#import "MidDrawerAllMusicAlbumTableViewCell.h"

@interface MidDrawerAllMusicAlbumView ()<UITableViewDelegate, UITableViewDataSource>

///tableView
@property (nonatomic, strong) UITableView *tableView;
///数据源
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation MidDrawerAllMusicAlbumView

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

//设置Block
- (void)createBlock {
    if (self.clickBlock) {
        self.clickBlock();
    }
}

#pragma mark UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MidDrawerAllMusicAlbumTableViewCell *cell = [MidDrawerAllMusicAlbumTableViewCell createCellWithTableView:tableView indexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self createBlock];
}

#pragma mark Lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.rowHeight = fontSizeScale(50);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[MidDrawerAllMusicAlbumTableViewCell class] forCellReuseIdentifier:@"MidDrawerAllMusicAlbumTableViewCellID"];
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
