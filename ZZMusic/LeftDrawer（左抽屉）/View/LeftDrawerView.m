//
//  LeftDrawerView.m
//  ZZMusic
//
//  Created by 仲召俊 on 2018/8/26.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "LeftDrawerView.h"
#import "LeftDrawerTableViewCell.h"

@interface LeftDrawerView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

///数据源
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation LeftDrawerView

- (instancetype)initWithFrame:(CGRect)frame {
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

//设置block
- (void)createBlock:(LeftDrawerViewClickType)type {
    if (self.clickBlock) {
        self.clickBlock(type);
    }
}

- (void)configCellWithIndexPath:(NSIndexPath *)indexPath cell:(LeftDrawerTableViewCell *)cell {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) { cell.subTitleText = @"默认皮肤"; }
        if (indexPath.row == 2) { cell.subTitleText = @"王卡听歌免流量"; }
    }
    
    if (indexPath.section == 1) {
        if (indexPath.row == 0) { cell.isOn = NO; cell.selectionStyle = UITableViewCellSelectionStyleNone; }
        if (indexPath.row == 1) { cell.isOn = YES; cell.selectionStyle = UITableViewCellSelectionStyleNone; }
        if (indexPath.row == 2) { cell.isOn = YES; cell.selectionStyle = UITableViewCellSelectionStyleNone; }
    }
}

#pragma mark UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *tmpArray = self.dataArray[section];
    return tmpArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LeftDrawerTableViewCell *cell = [LeftDrawerTableViewCell createCellWithTableView:tableView indexPath:indexPath];
    cell.titleText = self.dataArray[indexPath.section][indexPath.row];
    [self configCellWithIndexPath:indexPath cell:cell];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *title = self.dataArray[indexPath.section][indexPath.row];
    if ([title isEqualToString:@"个性装扮"]) {
        [self createBlock:LeftDrawerViewPersonalityDress];
    } else if ([title isEqualToString:@"消息中心"]) {
        [self createBlock:LeftDrawerViewMessageCenter];
    } else if ([title isEqualToString:@"免流量服务"]) {
        [self createBlock:LeftDrawerViewFreeTrafficService];
    } else if ([title isEqualToString:@"听歌偏好"]) {
        [self createBlock:LeftDrawerViewSongPreference];
    } else if ([title isEqualToString:@"微云音乐网盘"]) {
        [self createBlock:LeftDrawerViewNetDisc];
    } else if ([title isEqualToString:@"清理占用空间"]) {
        [self createBlock:LeftDrawerViewCleanSpace];
    } else if ([title isEqualToString:@"帮助与反馈"]) {
        [self createBlock:LeftDrawerViewHelp];
    } else if ([title isEqualToString:@"关于ZZ音乐"]) {
        [self createBlock:LeftDrawerViewAbout];
    }
}

#pragma mark Lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
        _tableView.rowHeight = fontSizeScale(35);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[LeftDrawerTableViewCell class] forCellReuseIdentifier:@"LeftDrawerTableViewCellID"];
    }
    return _tableView;
}

- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[@[@"个性装扮", @"消息中心", @"免流量服务"], @[@"定时关闭", @"仅Wi-Fi联网", @"流量提醒", @"听歌偏好"], @[@"微云音乐网盘", @"清理占用空间", @"帮助与反馈", @"关于ZZ音乐"]];
    }
    return _dataArray;
}

@end
