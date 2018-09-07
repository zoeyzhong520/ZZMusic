//
//  SettingView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/28.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "SettingView.h"
#import "SettingTableViewCell.h"

@interface SettingView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataArray;
///分组标题
@property (nonatomic, strong) NSArray *sectionTitles;

@end

@implementation SettingView

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

- (void)configCell:(NSIndexPath *)indexPath cell:(SettingTableViewCell *)cell {
    cell.titleText = self.dataArray[indexPath.section][indexPath.row];
    if (indexPath.section == 0) { if (indexPath.row == 0) { cell.subTitleText = @"HQ高品质"; } if (indexPath.row == 1) { cell.subTitleText = @"标准品质"; } if (indexPath.row == 2) { cell.subTitleText = @"未开启"; } }
    if (indexPath.section == 1) { if (indexPath.row == 0) { cell.isOn = YES; } if (indexPath.row == 1) { cell.isOn = NO; } }
}

#pragma mark UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionTitles.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *tmpArray = self.dataArray[section];
    return tmpArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SettingTableViewCell *cell = [SettingTableViewCell createCellWithTableView:tableView indexPath:indexPath];
    [self configCell:indexPath cell:cell];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *header = [UIView createViewWithBackgroundColor:SECTION_BACKGROUNDCOLOR];
    UILabel *label = [UILabel createLabelWithText:self.sectionTitles[section] font:SMALL_FONT textColor:GRAY_TEXTCOLOR];
    [header addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, fontSizeScale(15), 0, 0));
    }];
    return header;
}

#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.tableView) {
        CGFloat sectionHeaderHeight = fontSizeScale(30);
        if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= 0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else if (scrollView.contentOffset.y >= sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    }
}

#pragma mark Lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.rowHeight = fontSizeScale(40);
        _tableView.sectionHeaderHeight = fontSizeScale(30);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[SettingTableViewCell class] forCellReuseIdentifier:@"SettingTableViewCellID"];
    }
    return _tableView;
}

- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[@[@"在线试听品质",@"歌曲下载品质",@"边听边存"],@[@"自动进入播放页",@"锁屏歌词",@"传歌到手机",@"ZPlay与车载音乐",@"添加\"听歌识曲\"到桌面"],@[@"接收新消息通知",@"隐私设置"]];
    }
    return _dataArray;
}

- (NSArray *)sectionTitles {
    if (!_sectionTitles) {
        _sectionTitles = @[@"试听与下载",@"功能与服务",@"通用设置"];
    }
    return _sectionTitles;
}

@end
