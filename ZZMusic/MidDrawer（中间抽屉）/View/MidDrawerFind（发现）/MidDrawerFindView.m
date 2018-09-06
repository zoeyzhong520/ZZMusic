//
//  MidDrawerFindView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/29.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerFindView.h"
#import "MidDrawerFindHeaderView.h"
#import "MidDrawerFindVideoTableViewCell.h"
#import "MidDrawerFindArticleTableViewCell.h"
#import "MidDrawerFindNewsletterTableViewCell.h"
#import "MidDrawerFindNewsDiscoverTableViewCell.h"

@interface MidDrawerFindView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
///数据源
@property (nonatomic, strong) NSArray *dataArray;
///tableHeaderView
@property (nonatomic, strong) MidDrawerFindHeaderView *tableHeaderView;

@end

@implementation MidDrawerFindView

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

#pragma mark UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MidDrawerBaseModel *model = self.dataArray[indexPath.row];
    
    if ([model.cellType isEqualToString:@"Video"]) {//分享视频
        MidDrawerFindVideoTableViewCell *cell = [MidDrawerFindVideoTableViewCell createCellWithTableView:tableView indexPath:indexPath];
        return cell;
    } else if ([model.cellType isEqualToString:@"Article"]) {//发布文章
        MidDrawerFindArticleTableViewCell *cell = [MidDrawerFindArticleTableViewCell createCellWithTableView:tableView indexPath:indexPath];
        return cell;
    } else if ([model.cellType isEqualToString:@"Newsletter"]) {//快讯
        MidDrawerFindNewsletterTableViewCell *cell = [MidDrawerFindNewsletterTableViewCell createCellWithTableView:tableView indexPath:indexPath];
        return cell;
    } else {//发现
        MidDrawerFindNewsDiscoverTableViewCell *cell = [MidDrawerFindNewsDiscoverTableViewCell createCellWithTableView:tableView indexPath:indexPath];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    MidDrawerBaseModel *model = self.dataArray[indexPath.row];
    
    if ([model.cellType isEqualToString:@"Video"]) {//分享视频
        return FIND_BANNER_HEIGHT+fontSizeScale(105);
    } else if ([model.cellType isEqualToString:@"Article"]) {//发布文章
        return FIND_BANNER_HEIGHT+fontSizeScale(115);
    } else if ([model.cellType isEqualToString:@"Newsletter"]) {//快讯
        return fontSizeScale(160);
    } else {//发现
        return fontSizeScale(120);
    }
}

#pragma mark Lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[MidDrawerFindVideoTableViewCell class] forCellReuseIdentifier:@"MidDrawerFindVideoTableViewCellID"];
        [_tableView registerClass:[MidDrawerFindArticleTableViewCell class] forCellReuseIdentifier:@"MidDrawerFindArticleTableViewCellID"];
        [_tableView registerClass:[MidDrawerFindNewsletterTableViewCell class] forCellReuseIdentifier:@"MidDrawerFindNewsletterTableViewCellID"];
        [_tableView registerClass:[MidDrawerFindNewsDiscoverTableViewCell class] forCellReuseIdentifier:@"MidDrawerFindNewsDiscoverTableViewCellID"];
    }
    return _tableView;
}

- (NSArray *)dataArray {
    if (!_dataArray) {
        NSMutableArray *resultArray = [NSMutableArray arrayWithCapacity:0];
        
        NSArray *tmpArray = @[@{@"cellType":@"Video"}, @{@"cellType":@"Article"}, @{@"cellType":@"Newsletter"}, @{@"cellType":@"Discover"}];
        for (NSDictionary *dict in tmpArray) {
            MidDrawerBaseModel *model = [[MidDrawerBaseModel alloc] init];
            [model setValuesForKeysWithDictionary:dict];
            [resultArray addObject:model];
        }
        
        _dataArray = [NSArray arrayWithArray:resultArray];
    }
    return _dataArray;
}

- (MidDrawerFindHeaderView *)tableHeaderView {
    if (!_tableHeaderView) {
        _tableHeaderView = [[MidDrawerFindHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, FIND_BANNER_HEIGHT+fontSizeScale(100))];
    }
    return _tableHeaderView;
}

@end
