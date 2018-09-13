//
//  MidDrawerAllMusicViewController.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/10.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerAllMusicViewController.h"
#import "MidDrawerAllMusicView.h"
#import "MidDrawerAllMusicViewControllerViewModel.h"

@interface MidDrawerAllMusicViewController ()

///菜单栏
@property (nonatomic, strong) ZZMusicMenuBar *menuBar;
///allMusicView
@property (nonatomic, strong) MidDrawerAllMusicView *allMusicView;

@end

@implementation MidDrawerAllMusicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setPage];
}

- (void)setPage {
    self.title = @"全部歌曲";
    
    [self addBarButtonItemWithPosition:Right imgStr:@"三个圈" action:@selector(rightBarButtonClick)];
    
    [self.view addSubview:self.menuBar];
    
    [self.view addSubview:self.allMusicView];
}

//点击事件
- (void)rightBarButtonClick {
    ZZMusicTableShapeAlertView *alert = [[ZZMusicTableShapeAlertView alloc] initWithButtons:@[@"切换排序方式", @"导入歌曲", @"本地歌曲恢复助手", @"取消"]];
    [alert show];
    alert.clickBlock = ^(NSInteger index) {
        
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Lazy
- (ZZMusicMenuBar *)menuBar {
    if (!_menuBar) {
        _menuBar = [[ZZMusicMenuBar alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT+NAVIGATION_BAR_HEIGHT, self.view.bounds.size.width, BUBBLE_SINGLEROW_HEIGHT) titles:@[@"单曲",@"歌手",@"专辑"]];
        WeakSelf;
        _menuBar.clickBlock = ^(NSInteger index) {
            weakSelf.allMusicView.currentIndex = index;
        };
    }
    return _menuBar;
}

- (MidDrawerAllMusicView *)allMusicView {
    if (!_allMusicView) {
        _allMusicView = [[MidDrawerAllMusicView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.menuBar.frame), self.view.bounds.size.width, CONTENT_HEIGHT-BUBBLE_SINGLEROW_HEIGHT)];
        WeakSelf;
        _allMusicView.clickBlock = ^(MidDrawerAllMusicViewClickType type) {
            [MidDrawerAllMusicViewControllerViewModel handleMidDrawerAllMusicViewBlockWithType:type vc:weakSelf];
        };
    }
    return _allMusicView;
}

@end
