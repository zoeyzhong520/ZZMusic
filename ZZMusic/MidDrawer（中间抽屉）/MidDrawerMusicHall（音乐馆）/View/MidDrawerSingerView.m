//
//  MidDrawerSingerView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/13.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerSingerView.h"
#import "MidDrawerSingerTableHeaderView.h"
#import "MidDrawerSingerTableViewCell.h"

@interface MidDrawerSingerView ()<UITableViewDelegate, UITableViewDataSource>

///tableHeaderView
@property (nonatomic, strong) MidDrawerSingerTableHeaderView *tableHeaderView;
///tableView
@property (nonatomic, strong) UITableView *tableView;
///数据源
@property (nonatomic, strong) NSMutableArray *dataArray;
///字母表
@property (nonatomic, strong) NSMutableArray *alphabetArray;

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
    [self configAlphabetArray];
    
    [self addSubview:self.tableView];
    self.tableView.tableHeaderView = self.tableHeaderView;
    [self.tableView reloadData];
}

//获取字母表数组
- (void)configAlphabetArray {
    self.alphabetArray = [NSArray getSortedAlphabetArrayWithOriginArray:[[NSArray alloc] initWithArray:self.dataArray] Ascending:YES];
}

//设置Block
- (void)createBlock:(MidDrawerSingerViewClickType)type {
    if (self.clickBlock) {
        self.clickBlock(type);
    }
}

#pragma mark UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.alphabetArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MidDrawerSingerTableViewCell *cell = [MidDrawerSingerTableViewCell createCellWithTableView:tableView indexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self createBlock:MidDrawerSingerViewSinger];
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return self.alphabetArray;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return index;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.alphabetArray[section];
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
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[MidDrawerSingerTableViewCell class] forCellReuseIdentifier:@"MidDrawerSingerTableViewCellID"];
    }
    return _tableView;
}

- (NSMutableArray *)alphabetArray {
    if (!_alphabetArray) {
        _alphabetArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _alphabetArray;
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        NSArray *tmpArray = @[@"产品",@"车贷",@"测试", @"地方",@"动画",@"但是",@"大牌",@"放入",@"方法",@"分割",@"发布", @"沟通",@"个月",@"过户",@"广场", @"里面",@"轮播",@"联盟",@"离开",@"染发",@"人品",@"密码",@"美好",@"$%^",@"目前",@"蘑菇", @"啊啊",@"爱情",@"阿荣",@"爱国",@"安排", @"吃饭",@"藕片",@"偶遇",@"欧文",@"欧巴", @"破片",@"品味",@"盘城",@"排序", @"如果",@"如何", @"通过",@"添加",@"突然",@"天天",@"显示",@"许",@"修改",@"希望"];
        _dataArray = [NSMutableArray arrayWithCapacity:0];
        [_dataArray addObjectsFromArray:tmpArray];
    }
    return _dataArray;
}

@end
