//
//  MidDrawerSingerDetailViewController.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/14.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerSingerDetailViewController.h"
#import "MidDrawerSingerDetailView.h"
#import "MidDrawerSingerDetailTableHeaderView.h"

@interface MidDrawerSingerDetailViewController ()<MidDrawerSingerDetailViewDelegate>

///singerDetailView
@property (nonatomic, strong) MidDrawerSingerDetailView *singerDetailView;

///strecthHeaderView
@property (nonatomic, strong) MidDrawerSingerDetailTableHeaderView *headerView;
@property (nonatomic, strong) ZZMusicStretchHeaderView *stretchHeaderView;

///menuBar
@property (nonatomic, strong) ZZMusicMenuBar *menuBar;

@end

@implementation MidDrawerSingerDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setPage];
}

- (void)setPage {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"三个圈白色"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItem)];
    
    [self.view addSubview:self.headerView];
    
    [self.view addSubview:self.singerDetailView];
    [self.singerDetailView addSubview:self.menuBar];
}

//点击事件
- (void)rightBarItemClick {
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self setNavigationBarTransparent:YES];
    [self setNavigationBarTintColorWithColor:[UIColor whiteColor]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self setNavigationBarTransparent:NO];
    [self setNavigationBarTintColorWithColor:BLACK_TEXTCOLOR];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark MidDrawerSingerDetailViewDelegate
- (void)scrollViewDidEndDeceleratingWithIndex:(NSInteger)index {
    self.menuBar.selectedIndex = index;
}

- (void)didScrollWithScrollView:(UIScrollView *)scrollView {
    [self.stretchHeaderView scrollViewDidScrollWithScrollView:scrollView];
    
    if (scrollView.contentOffset.y >= SINGERDETAIL_HEADERVIEW_HEIGHT-STATUS_BAR_HEIGHT-NAVIGATION_BAR_HEIGHT) {
        [self setNavigationBarTintColorWithColor:BLACK_TEXTCOLOR];
        
        self.menuBar.frame = CGRectMake(0, STATUS_BAR_HEIGHT+NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, BUBBLE_SINGLEROW_HEIGHT);
        [self.view addSubview:self.menuBar];
        
        self.singerDetailView.frame = CGRectMake(0, CGRectGetMaxY(self.menuBar.frame), SCREEN_WIDTH, CONTENT_HEIGHT);
    } else {
        [self setNavigationBarTintColorWithColor:[UIColor whiteColor]];
        
        self.singerDetailView.frame = CGRectMake(0, CGRectGetMaxY(self.headerView.frame), SCREEN_WIDTH, CONTENT_HEIGHT);
        
        self.menuBar.frame = CGRectMake(0, 0, SCREEN_WIDTH, BUBBLE_SINGLEROW_HEIGHT);
        [self.singerDetailView addSubview:self.menuBar];
    }
}

#pragma mark Lazy
- (MidDrawerSingerDetailView *)singerDetailView {
    if (!_singerDetailView) {
        _singerDetailView = [[MidDrawerSingerDetailView alloc] initWithFrame:CGRectMake(0, SINGERDETAIL_HEADERVIEW_HEIGHT, self.view.bounds.size.width, CONTENT_HEIGHT)];
        _singerDetailView.delegate = self;
    }
    return _singerDetailView;
}

- (MidDrawerSingerDetailTableHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[MidDrawerSingerDetailTableHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, SINGERDETAIL_HEADERVIEW_HEIGHT)];
        _stretchHeaderView = [[ZZMusicStretchHeaderView alloc] initWithStretchView:_headerView];
    }
    return _headerView;
}

- (ZZMusicMenuBar *)menuBar {
    if (!_menuBar) {
        _menuBar = [[ZZMusicMenuBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, BUBBLE_SINGLEROW_HEIGHT) titles:@[@"单曲",@"专辑",@"MV",@"详情"]];
        WeakSelf;
        _menuBar.clickBlock = ^(NSInteger index) {
            weakSelf.singerDetailView.currentIndex = index;
        };
    }
    return _menuBar;
}

@end
