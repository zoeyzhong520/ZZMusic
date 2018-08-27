//
//  RootViewController.m
//  ZZMusic
//
//  Created by 仲召俊 on 2018/8/26.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@property (nonatomic, strong) BaseNavigationBar *navigationBar;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setPage];
}

- (void)setPage {
    [self addChildViewController:self.leftDrawerView];
    [self.view addSubview:self.leftDrawerView.view];
    
    [self addChildViewController:self.midDrawerView];
    [self.view addSubview:self.midDrawerView.view];
    [self.midDrawerView.view addSubview:self.navigationBar];
    [self addScreenEdgePanGestureRecognizer];
}

#pragma mark 设置边缘手势
- (void)addScreenEdgePanGestureRecognizer {
    UIScreenEdgePanGestureRecognizer *leftGes = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(showLeftDrawer:)];
    leftGes.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:leftGes];
}

- (void)removeScreenEdgePanGestureRecognizer {
    for (UIGestureRecognizer *gesture in self.view.gestureRecognizers) {
        if ([gesture isKindOfClass:[UIScreenEdgePanGestureRecognizer class]]) {
            [self.view removeGestureRecognizer:gesture];
        }
    }
}

#pragma mark 添加轻扫手势
- (void)addSwipeGestureRecognizer {
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(hideLeftDrawer:)];
    swipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipe];
}

- (void)removeSwipeGestureRecognizer {
    for (UIGestureRecognizer *gesture in self.view.gestureRecognizers) {
        if ([gesture isKindOfClass:[UISwipeGestureRecognizer class]]) {
            [self.view removeGestureRecognizer:gesture];
        }
    }
}

//点击事件
- (void)openLeftDrawer {
    if (self.midDrawerView.view.frame.origin.x == 0) {
        [UIView animateWithDuration:ANIMATE_DURATION animations:^{
            self.midDrawerView.view.frame = CGRectMake(SCREEN_WIDTH*4/5, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            self.leftDrawerView.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            
            [self removeScreenEdgePanGestureRecognizer];
            
            [self addSwipeGestureRecognizer];
        }];
    } else {
        [UIView animateWithDuration:ANIMATE_DURATION animations:^{
            self.midDrawerView.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            
            [self addScreenEdgePanGestureRecognizer];
            
            [self removeSwipeGestureRecognizer];
        }];
    }
}

- (void)showLeftDrawer:(UIScreenEdgePanGestureRecognizer *)gesture {
    // 让view跟着手指去移动
    // frame的x应该为多少??应该获取到手指的x值
    // 取到手势在当前控制器视图中识别的位置
    CGPoint p = [gesture locationInView:self.view];
    CGRect frame = self.midDrawerView.view.frame;
    // 更改midDrawerView的x值. 手指的位置
    frame.origin.x = p.x;
    // 重新设置上去
    self.midDrawerView.view.frame = frame;
    
    if (gesture.state == UIGestureRecognizerStateEnded || gesture.state == UIGestureRecognizerStateCancelled) {
        // 判断midDrawerView在屏幕上显示是否超过一半
        if (p.x > SCREEN_WIDTH/2) {
            // 如果超过,那么完全展示出来
            frame.origin.x = SCREEN_WIDTH*4/5;
            [self removeScreenEdgePanGestureRecognizer];
            
            [self addSwipeGestureRecognizer];
        } else {
            frame.origin.x = 0;
        }
        
        [UIView animateWithDuration:ANIMATE_DURATION animations:^{
            self.midDrawerView.view.frame = frame;
        }];
    }
}

- (void)hideLeftDrawer:(UISwipeGestureRecognizer *)gesture {
    [UIView animateWithDuration:ANIMATE_DURATION animations:^{
        self.midDrawerView.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        
        [self addScreenEdgePanGestureRecognizer];
        
        [self removeSwipeGestureRecognizer];
    }];
}

- (void)addBubbleView {
    MidDrawerBubbleView *bubbleView = [[MidDrawerBubbleView alloc] initWithTitles:@[@"听歌识曲", @"扫一扫", @"视频海报"] images:@[@"听歌识曲", @"扫一扫", @"视频海报"]];
    [bubbleView show];
    UIView *sourceView = [UIView createViewWithBackgroundColor:[UIColor whiteColor]];
    sourceView.frame = CGRectMake(SCREEN_WIDTH - fontSizeScale(48), STATUS_BAR_HEIGHT, fontSizeScale(48), fontSizeScale(48));
    bubbleView.sourceView = sourceView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Lazy
- (BaseNavigationBar *)navigationBar {
    if (!_navigationBar) {
        _navigationBar = [[BaseNavigationBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, STATUS_BAR_HEIGHT + NAVIGATION_BAR_HEIGHT)];
        WeakSelf;
        _navigationBar.clickBlock = ^(BarButtonType barButtonType) {
            switch (barButtonType) {
                case LeftMenuButton:
                    [weakSelf openLeftDrawer];
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
