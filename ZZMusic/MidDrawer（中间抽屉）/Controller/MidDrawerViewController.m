//
//  MidDrawerViewController.m
//  ZZMusic
//
//  Created by 仲召俊 on 2018/8/26.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerViewController.h"
#import "SettingViewController.h"

@interface MidDrawerViewController ()<UINavigationControllerDelegate>

@property (nonatomic, strong) BaseNavigationBar *navigationBar;

@end

@implementation MidDrawerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setPage];
}

- (void)setPage {
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.delegate = self;
    
    [self.view addSubview:self.navigationBar];
}

//设置气泡视图
- (void)addBubbleView {
    MidDrawerBubbleView *bubbleView = [[MidDrawerBubbleView alloc] initWithTitles:@[@"听歌识曲", @"扫一扫", @"视频海报"] images:@[@"听歌识曲", @"扫一扫", @"视频海报"]];
    [bubbleView show];
    UIView *sourceView = [UIView createViewWithBackgroundColor:[UIColor whiteColor]];
    sourceView.frame = CGRectMake(SCREEN_WIDTH - fontSizeScale(48), STATUS_BAR_HEIGHT, fontSizeScale(48), fontSizeScale(48));
    bubbleView.sourceView = sourceView;
}

//打开设置
- (void)openSetting {
    [self.navigationController pushViewController:[SettingViewController new] animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openSetting) name:OPEN_SETTING_NOTIFICATION object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:[viewController isKindOfClass:[self class]] animated:YES];
}

#pragma mark - Lazy
- (BaseNavigationBar *)navigationBar {
    if (!_navigationBar) {
        _navigationBar = [[BaseNavigationBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, STATUS_BAR_HEIGHT + NAVIGATION_BAR_HEIGHT)];
        WeakSelf;
        _navigationBar.clickBlock = ^(BarButtonType barButtonType) {
            switch (barButtonType) {
                case LeftMenuButton:
                    [[NSNotificationCenter defaultCenter] postNotificationName:OPEN_LEFTDRAWER_NOTIFICATION object:nil];
                    break;
                case RightBubbleButton:
                    [weakSelf addBubbleView];
                    break;
                default:
                    break;
            }
        };
    }
    return _navigationBar;
}

@end
