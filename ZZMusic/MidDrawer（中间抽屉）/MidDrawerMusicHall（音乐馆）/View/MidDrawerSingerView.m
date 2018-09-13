//
//  MidDrawerSingerView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/13.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerSingerView.h"
#import "MidDrawerSingerTableHeaderView.h"

@interface MidDrawerSingerView ()<UITableViewDelegate, UITableViewDataSource>

///tableHeaderView
@property (nonatomic, strong) MidDrawerSingerTableHeaderView *tableHeaderView;
///tableView
@property (nonatomic, strong) UITableView *tableView;
///数据源
@property (nonatomic, strong) NSArray *dataArray;
///

@end

@implementation MidDrawerSingerView

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
    return 20;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UITableViewCell new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark Lazy
- (MidDrawerSingerTableHeaderView *)tableHeaderView {
    if (!_tableHeaderView) {
        _tableHeaderView = [[MidDrawerSingerTableHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, fontSizeScale(90)) areas:@[@"全部",@"内地",@"港台",@"欧美",@"日本",@"韩国",@"其他"] genders:@[@"全部",@"男",@"女",@"组合"] musicTypes:@[@"全部",@"流行",@"嘻哈",@"摇滚",@"电子",@"民谣",@"R&B",@"民歌",@"轻音乐",@"爵士",@"古典",@"乡村",@"蓝调"]];
    }
    return _tableHeaderView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.rowHeight = fontSizeScale(50);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    }
    return _tableView;
}

@end
