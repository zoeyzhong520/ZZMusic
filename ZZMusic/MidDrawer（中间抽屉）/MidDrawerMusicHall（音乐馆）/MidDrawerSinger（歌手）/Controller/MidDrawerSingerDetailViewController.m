//
//  MidDrawerSingerDetailViewController.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/14.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerSingerDetailViewController.h"
#import "MidDrawerSingerDetailView.h"

@interface MidDrawerSingerDetailViewController ()<MidDrawerSingerDetailViewDelegate>

///singerDetailView
@property (nonatomic, strong) MidDrawerSingerDetailView *singerDetailView;
///stretchHeaderView
@property (nonatomic, strong) ZZMusicStretchHeaderView *strecthHeaderView;
///strecthImgView
@property (nonatomic, strong) UIImageView *stretchImgView;
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
    [self.view addSubview:self.stretchImgView];
    self.strecthHeaderView = [[ZZMusicStretchHeaderView alloc] initWithStretchView:self.stretchImgView];
    
    [self.view addSubview:self.singerDetailView];
    [self.singerDetailView addSubview:self.menuBar];
}

- (void)viewWillAppear:(BOOL)animated {
    [self setNavigationBarTransparent:YES];
    [self setnavigationBarTintColorWithColor:[UIColor whiteColor]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self setNavigationBarTransparent:NO];
    [self setnavigationBarTintColorWithColor:BLACK_TEXTCOLOR];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark MidDrawerSingerDetailViewDelegate
- (void)scrollViewDidEndDeceleratingWithIndex:(NSInteger)index {
    _menuBar.selectedIndex = index;
}

- (void)didScrollWithScrollView:(UIScrollView *)scrollView {
    [_strecthHeaderView scrollViewDidScrollWithScrollView:scrollView];
    
    if (scrollView.contentOffset.y > SINGERDETAIL_HEADERVIEW_HEIGHT-STATUS_BAR_HEIGHT-NAVIGATION_BAR_HEIGHT) {
        [self setnavigationBarTintColorWithColor:BLACK_TEXTCOLOR];
        
        self.menuBar.frame = CGRectMake(0, STATUS_BAR_HEIGHT+NAVIGATION_BAR_HEIGHT, self.view.bounds.size.width, BUBBLE_SINGLEROW_HEIGHT);
        [self.view addSubview:_menuBar];
        
        _singerDetailView.frame = CGRectMake(0, CGRectGetMaxY(_menuBar.frame), self.view.bounds.size.width, CONTENT_HEIGHT-BUBBLE_SINGLEROW_HEIGHT);
    } else {
        [self setnavigationBarTintColorWithColor:[UIColor whiteColor]];
        
        _singerDetailView.frame = CGRectMake(0, CGRectGetMaxY(self.stretchImgView.frame), self.view.bounds.size.width, self.view.bounds.size.height-SINGERDETAIL_HEADERVIEW_HEIGHT);
        
        self.menuBar.frame = CGRectMake(0, 0, self.view.bounds.size.width, BUBBLE_SINGLEROW_HEIGHT);
        [_singerDetailView addSubview:_menuBar];
    }
}

#pragma mark Lazy
- (MidDrawerSingerDetailView *)singerDetailView {
    if (!_singerDetailView) {
        _singerDetailView = [[MidDrawerSingerDetailView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.stretchImgView.frame), self.view.bounds.size.width, self.view.bounds.size.height-SINGERDETAIL_HEADERVIEW_HEIGHT)];
        _singerDetailView.delegate = self;
    }
    return _singerDetailView;
}

- (UIImageView *)stretchImgView {
    if (!_stretchImgView) {
        _stretchImgView = [UIImageView createImageViewWithImg:@""];
        [_stretchImgView sd_setImageWithURL:[NSURL URLWithString:SINGERSTRETCHAVATAR_PATH] placeholderImage:PLACEHOLDER_IMAGE];
        _stretchImgView.frame = CGRectMake(0, 0, self.view.bounds.size.width, SINGERDETAIL_HEADERVIEW_HEIGHT);
    }
    return _stretchImgView;
}

- (ZZMusicMenuBar *)menuBar {
    if (!_menuBar) {
        _menuBar = [[ZZMusicMenuBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, BUBBLE_SINGLEROW_HEIGHT) titles:@[@"单曲",@"专辑",@"MV",@"详情"]];
        _menuBar.backgroundColor = [UIColor orangeColor];
        WeakSelf;
        _menuBar.clickBlock = ^(NSInteger index) {
            weakSelf.singerDetailView.currentIndex = index;
        };
    }
    return _menuBar;
}

@end
