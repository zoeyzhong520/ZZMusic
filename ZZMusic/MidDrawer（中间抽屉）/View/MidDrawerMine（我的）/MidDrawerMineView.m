//
//  MidDrawerMineView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/29.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerMineView.h"
#import "MidDrawerMineTableHeaderView.h"
#import "MidDrawerMineTableSectionHeaderView.h"
#import "MidDrawerMineTableViewCell.h"

@interface MidDrawerMineView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) MidDrawerMineTableHeaderView *tableHeaderView;

@property (nonatomic, strong) MidDrawerMineTableSectionHeaderView *sectionHeaderView;

@end

@implementation MidDrawerMineView

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

//设置Block
- (void)createBlock:(MidDrawerMineViewClickType)type {
    if (self.clickBlock) {
        self.clickBlock(type);
    }
}

#pragma mark UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MidDrawerMineTableViewCell *cell = [MidDrawerMineTableViewCell createCellWithTableView:tableView indexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self createBlock:MidDrawerMineViewCellClick];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.sectionHeaderView;
}

#pragma mark Lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.rowHeight = fontSizeScale(50);
        _tableView.sectionHeaderHeight = fontSizeScale(30);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[MidDrawerMineTableViewCell class] forCellReuseIdentifier:@"MidDrawerMineTableViewCellID"];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (MidDrawerMineTableHeaderView *)tableHeaderView {
    if (!_tableHeaderView) {
        _tableHeaderView = [[MidDrawerMineTableHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, fontSizeScale(320))];
        WeakSelf;
        _tableHeaderView.clickBlock = ^(MidDrawerMineTableHeaderViewClickType type) {
            switch (type) {
                case MidDrawerMineTableHeaderViewLogin:
                    [weakSelf createBlock:MidDrawerMineViewLogin];
                    break;
                case MidDrawerMineTableHeaderViewActivity:
                    [weakSelf createBlock:MidDrawerMineViewActivity];
                    break;
                case MidDrawerMineTableHeaderViewVIP:
                    [weakSelf createBlock:MidDrawerMineViewVIP];
                    break;
                case MidDrawerMineTableHeaderViewAllMusic:
                    [weakSelf createBlock:MidDrawerMineViewAllMusic];
                    break;
                case MidDrawerMineTableHeaderViewDownload:
                    [weakSelf createBlock:MidDrawerMineViewDownload];
                    break;
                case MidDrawerMineTableHeaderViewRecentlyPlayed:
                    [weakSelf createBlock:MidDrawerMineViewRecentlyPlayed];
                    break;
                case MidDrawerMineTableHeaderViewLike:
                    [weakSelf createBlock:MidDrawerMineViewLike];
                    break;
                case MidDrawerMineTableHeaderViewPurchasedMusic:
                    [weakSelf createBlock:MidDrawerMineViewPurchasedMusic];
                    break;
                case MidDrawerMineTableHeaderViewRunningStation:
                    [weakSelf createBlock:MidDrawerMineViewRunningStation];
                    break;
                case MidDrawerMineTableHeaderViewSelfBuildSongList:
                    [weakSelf createBlock:MidDrawerMineViewSelfBuildSongList];
                    break;
                case MidDrawerMineTableHeaderViewCollectionSongList:
                    [weakSelf createBlock:MidDrawerMineViewCollectionSongList];
                    break;
                default:
                    break;
            }
        };
    }
    return _tableHeaderView;
}

- (MidDrawerMineTableSectionHeaderView *)sectionHeaderView {
    if (!_sectionHeaderView) {
        _sectionHeaderView = [[MidDrawerMineTableSectionHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, fontSizeScale(30))];
        WeakSelf;
        _sectionHeaderView.clickBlock = ^(MidDrawerMineTableSectionHeaderViewClickType type) {
            [weakSelf createBlock:type == MidDrawerMineTableSectionHeaderViewAdd ? MidDrawerMineViewAdd : MidDrawerMineViewManage];
        };
    }
    return _sectionHeaderView;
}

@end
