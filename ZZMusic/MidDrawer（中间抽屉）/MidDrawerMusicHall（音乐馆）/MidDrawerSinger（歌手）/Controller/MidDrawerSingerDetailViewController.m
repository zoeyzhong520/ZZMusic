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

///avatarImgView
@property (nonatomic, strong) UIImageView *avatarImgView;
///strecthHeaderView
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
    [self.view addSubview:self.avatarImgView];
    
    [self.view addSubview:self.singerDetailView];
    [self.singerDetailView addSubview:self.menuBar];
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
        self.menuBar.frame = CGRectMake(0, STATUS_BAR_HEIGHT+NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, BUBBLE_SINGLEROW_HEIGHT);
        [self.view addSubview:self.menuBar];
        
        self.singerDetailView.frame = CGRectMake(0, CGRectGetMaxY(self.menuBar.frame), SCREEN_WIDTH, CONTENT_HEIGHT-BUBBLE_SINGLEROW_HEIGHT);
    } else {
        self.singerDetailView.frame = CGRectMake(0, CGRectGetMaxY(self.avatarImgView.frame), SCREEN_WIDTH, SCREEN_HEIGHT-SINGERDETAIL_HEADERVIEW_HEIGHT);
        
        self.menuBar.frame = CGRectMake(0, 0, SCREEN_WIDTH, BUBBLE_SINGLEROW_HEIGHT);
        [self.singerDetailView addSubview:self.menuBar];
    }
}

#pragma mark Lazy
- (MidDrawerSingerDetailView *)singerDetailView {
    if (!_singerDetailView) {
        _singerDetailView = [[MidDrawerSingerDetailView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.avatarImgView.frame), self.view.bounds.size.width, SCREEN_HEIGHT-SINGERDETAIL_HEADERVIEW_HEIGHT-BUBBLE_SINGLEROW_HEIGHT)];
        _singerDetailView.delegate = self;
    }
    return _singerDetailView;
}

- (UIImageView *)avatarImgView {
    if (!_avatarImgView) {
        _avatarImgView = [UIImageView createImageViewWithImg:@""];
        _avatarImgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SINGERDETAIL_HEADERVIEW_HEIGHT);
        [_avatarImgView sd_setImageWithURL:[NSURL URLWithString:SINGERSTRETCHAVATAR_PATH] placeholderImage:PLACEHOLDER_IMAGE];
        self.stretchHeaderView = [[ZZMusicStretchHeaderView alloc] initWithStretchView:_avatarImgView];
    }
    return _avatarImgView;
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
