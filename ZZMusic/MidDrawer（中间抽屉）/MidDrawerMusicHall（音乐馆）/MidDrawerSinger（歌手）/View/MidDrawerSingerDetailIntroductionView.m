//
//  MidDrawerSingerDetailIntroductionView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/17.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerSingerDetailIntroductionView.h"
#import "MidDrawerSingerDetailIntroductionTableHeaderView.h"
#import "MidDrawerSingerDetailIntroductionRecentDevelopmentTableViewCell.h"

@interface MidDrawerSingerDetailIntroductionView ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

///tableView
@property (nonatomic, strong) UITableView *tableView;
///sectionTitles
@property (nonatomic, strong) NSArray *sectionTitles;
///tableHeaderView
@property (nonatomic, strong) MidDrawerSingerDetailIntroductionTableHeaderView *tableHeaderView;

@end

@implementation MidDrawerSingerDetailIntroductionView

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

//设置Block
- (void)createBlock:(UIScrollView *)scrollView {
    if (self.scrollBlock) {
        self.scrollBlock(scrollView);
    }
}

#pragma mark Setter
- (void)setShouldScrollToTop:(BOOL)shouldScrollToTop {
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
}

#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self createBlock:scrollView];
    
    CGFloat sectionHeaderHeight = fontSizeScale(50);
    if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= 0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y >= sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}

#pragma mark UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionTitles.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self.sectionTitles[section] isEqualToString:@"近期动态"]) {
        return 25;
    }
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.sectionTitles[indexPath.section] isEqualToString:@"近期动态"]) {
        MidDrawerSingerDetailIntroductionRecentDevelopmentTableViewCell *cell = [MidDrawerSingerDetailIntroductionRecentDevelopmentTableViewCell createCellWithTableView:tableView indexPath:indexPath];
        return cell;
    }
    return [UITableViewCell new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *header = [UIView createViewWithBackgroundColor:[UIColor whiteColor]];
    UILabel *label = [UILabel createLabelWithText:self.sectionTitles[section] font:BIG_FONT textColor:BLACK_TEXTCOLOR];
    label.textAlignment = NSTextAlignmentCenter;
    [header addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(header);
    }];
    return header;
}

#pragma mark Lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.sectionHeaderHeight = fontSizeScale(60);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[MidDrawerSingerDetailIntroductionRecentDevelopmentTableViewCell class] forCellReuseIdentifier:@"MidDrawerSingerDetailIntroductionRecentDevelopmentTableViewCellID"];
    }
    return _tableView;
}

- (NSArray *)sectionTitles {
    if (!_sectionTitles) {
        _sectionTitles = @[@"近期动态",@"相关视频",@"周杰伦的相册",@"相似歌手"];
    }
    return _sectionTitles;
}

- (MidDrawerSingerDetailIntroductionTableHeaderView *)tableHeaderView {
    if (!_tableHeaderView) {
        _tableHeaderView = [[MidDrawerSingerDetailIntroductionTableHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, MUSICHALL_BANNER_HEIGHT-fontSizeScale(20))];
    }
    return _tableHeaderView;
}

@end
