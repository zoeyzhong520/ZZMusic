//
//  MidDrawerViewController.m
//  ZZMusic
//
//  Created by 仲召俊 on 2018/8/26.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerViewController.h"
#import "MidDrawerView.h"
#import "MidDrawerSearchHistoryView.h"
#import "MidDrawerViewControllerViewModel.h"

@interface MidDrawerViewController ()<UISearchBarDelegate>

@property (nonatomic, strong) MidDrawerView *midDrawerView;

///搜索框
@property (nonatomic, strong) ZZMusicSearchBar *searchBar;
///搜索历史View
@property (nonatomic, strong) MidDrawerSearchHistoryView *searchHistoryView;

@end

@implementation MidDrawerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setPage];
}

- (void)setPage {
    [self.view addSubview:self.navigationBar];
    
    [self.view addSubview:self.midDrawerView];
    
    [self.view addSubview:self.searchBar];
    
    [self.view addSubview:self.searchHistoryView];
    
    [self.view addSubview:self.mongolianView];
}

//设置气泡视图
- (void)addBubbleView {
    MidDrawerBubbleView *bubbleView = [[MidDrawerBubbleView alloc] initWithTitles:@[@"听歌识曲", @"扫一扫", @"视频海报"] images:@[@"听歌识曲", @"扫一扫", @"视频海报"]];
    [bubbleView show];
    UIView *sourceView = [UIView createViewWithBackgroundColor:[UIColor whiteColor]];
    sourceView.frame = CGRectMake(SCREEN_WIDTH - fontSizeScale(48), STATUS_BAR_HEIGHT, fontSizeScale(48), fontSizeScale(48));
    bubbleView.sourceView = sourceView;
}

//点击事件
- (void)tapMongolianView {
    if (self.clickMongolianView) { self.clickMongolianView(); }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UISearchBarDelegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    self.navigationBar.transform = CGAffineTransformIdentity;
    self.searchBar.transform = CGAffineTransformIdentity;
    self.searchHistoryView.frame = CGRectMake(0, CGRectGetMaxY(self.searchBar.frame), self.view.bounds.size.width, CONTENT_HEIGHT);
    [UIView animateWithDuration:0.4 animations:^{
        self.navigationBar.isLeftMenuButtonVisible = NO;
        self.navigationBar.isRightBubbleButtonVisible = NO;
        self.navigationBar.transform = CGAffineTransformMakeTranslation(0, -SEARCHBAR_HEIGHT);
        self.searchBar.transform = CGAffineTransformMakeTranslation(0, -SEARCHBAR_HEIGHT);
        self.searchHistoryView.frame = CGRectMake(0, CGRectGetMaxY(self.searchBar.frame), self.view.bounds.size.width, CONTENT_HEIGHT+SEARCHBAR_HEIGHT);
    }];
    
    self.searchHistoryView.hidden = NO;
    searchBar.showsCancelButton = YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    self.navigationBar.transform = CGAffineTransformMakeTranslation(0, -SEARCHBAR_HEIGHT);
    self.searchBar.transform = CGAffineTransformMakeTranslation(0, -SEARCHBAR_HEIGHT);
    self.searchHistoryView.frame = CGRectMake(0, CGRectGetMaxY(self.searchBar.frame), self.view.bounds.size.width, CONTENT_HEIGHT+SEARCHBAR_HEIGHT);
    [UIView animateWithDuration:0.4 animations:^{
        self.navigationBar.isLeftMenuButtonVisible = YES;
        self.navigationBar.isRightBubbleButtonVisible = YES;
        self.navigationBar.transform = CGAffineTransformMakeTranslation(0, 0);
        self.searchBar.transform = CGAffineTransformIdentity;
        self.searchHistoryView.frame = CGRectMake(0, CGRectGetMaxY(self.searchBar.frame), self.view.bounds.size.width, CONTENT_HEIGHT);
    } completion:^(BOOL finished) {
        self.searchHistoryView.hidden = YES;
    }];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    searchBar.showsCancelButton = NO;
}

#pragma mark Lazy
- (BaseNavigationBar *)navigationBar {
    if (!_navigationBar) {
        _navigationBar = [[BaseNavigationBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, STATUS_BAR_HEIGHT + NAVIGATION_BAR_HEIGHT)];
        WeakSelf;
        _navigationBar.rightButtonClickBlock = ^{ [weakSelf addBubbleView]; };
        _navigationBar.titleView.buttonClickBlock = ^(NSInteger index) { [weakSelf.midDrawerView configScrollViewContentOffset:index]; };
    }
    return _navigationBar;
}

- (UIView *)mongolianView {
    if (!_mongolianView) {
        _mongolianView = [UIView createViewWithBackgroundColor:MONGOLIANLAYER_COLOR];
        _mongolianView.hidden = YES;
        _mongolianView.frame = SCREEN_RECT;
        [_mongolianView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMongolianView)]];
    }
    return _mongolianView;
}

- (MidDrawerView *)midDrawerView {
    if (!_midDrawerView) {
        _midDrawerView = [[MidDrawerView alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT+NAVIGATION_BAR_HEIGHT+SEARCHBAR_HEIGHT, self.view.bounds.size.width, CONTENT_HEIGHT-SEARCHBAR_HEIGHT)];
        WeakSelf;
        _midDrawerView.scrollViewDidEndDeceleratingBlock = ^(NSInteger currentIndex) { weakSelf.navigationBar.titleView.selectedIndex = currentIndex; };
        _midDrawerView.mineView.clickBlock = ^(MidDrawerMineViewClickType type) {
            [MidDrawerViewControllerViewModel handleMidDrawerMineViewClickBlockWithType:type vc:weakSelf];
        };
    }
    return _midDrawerView;
}

- (ZZMusicSearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[ZZMusicSearchBar alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.navigationBar.frame), self.view.bounds.size.width, SEARCHBAR_HEIGHT)];
        [_searchBar setImage:[UIImage imageNamed:@"search"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
        _searchBar.delegate = self;
    }
    return _searchBar;
}

- (MidDrawerSearchHistoryView *)searchHistoryView {
    if (!_searchHistoryView) {
        _searchHistoryView = [[MidDrawerSearchHistoryView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.searchBar.frame), self.view.bounds.size.width, CONTENT_HEIGHT)];
        _searchHistoryView.hidden = YES;
    }
    return _searchHistoryView;
}

@end
