//
//  RootViewController.m
//  ZZMusic
//
//  Created by 仲召俊 on 2018/8/26.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "RootViewController.h"
#import "RootViewControllerViewModel.h"

@interface RootViewController ()<UINavigationControllerDelegate>

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setPage];
}

- (void)setPage {
    self.navigationController.delegate = self;
    
    //设置边缘手势
    [self addScreenEdgePanGestureRecognizer];
    
    WeakSelf;
    
    [self addChildViewController:self.leftDrawerView];
    [self.view addSubview:self.leftDrawerView.view];
    self.leftDrawerView.footerView.buttonClickBlock = ^(LeftDrawerFooterClickType clickType) {
        [RootViewControllerViewModel handleLeftDrawerFooterViewBlockWithType:clickType vc:weakSelf];
    };
    self.leftDrawerView.leftDrawerView.clickBlock = ^(LeftDrawerViewClickType type) {
        [RootViewControllerViewModel handleLeftDrawerViewBlockWithType:type vc:weakSelf];
    };
    
    [self addChildViewController:self.midDrawerView];
    [self.view addSubview:self.midDrawerView.view];
    self.midDrawerView.navigationBar.leftButtonClickBlock = ^{ [weakSelf openLeftDrawer]; };
    self.midDrawerView.clickMongolianView = ^{ [weakSelf hideLeftDrawer:nil]; };
}

//设置边缘手势
- (void)addScreenEdgePanGestureRecognizer {
    [self addScreenEdgePanGestureRecognizerWithAction:@selector(showLeftDrawer:)];
}

//添加轻扫手势
- (void)addSwipeGestureRecognizer {
    [self addSwipeGestureRecognizerWithAction:@selector(hideLeftDrawer:)];
}

//点击事件
- (void)openLeftDrawer {
    self.midDrawerView.mongolianView.alpha = 0.0;
    self.midDrawerView.mongolianView.hidden = NO;
    
    [UIView animateWithDuration:ANIMATE_DURATION animations:^{
        self.midDrawerView.view.frame = CGRectMake(SCREEN_WIDTH*4/5, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.leftDrawerView.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        
        [self removeScreenEdgePanGestureRecognizer];
        [self addSwipeGestureRecognizer];
        //mongolianView蒙层alpha值与边缘手势保持一致
        self.midDrawerView.mongolianView.alpha = (SCREEN_WIDTH*4/5) / SCREEN_WIDTH;
    }];
}

- (void)showLeftDrawer:(UIGestureRecognizer *)gesture {
    /*
     -让view跟着手指去移动
     -frame的x应该为多少??应该获取到手指的x值
     -取到手势在当前控制器视图中识别的位置
     */
    CGPoint p = [gesture locationInView:self.view];
    CGRect frame = self.midDrawerView.view.frame;
    // 更改midDrawerView的x值. 手指的位置
    frame.origin.x = p.x;
    // 重新设置上去
    self.midDrawerView.view.frame = frame;
    //设置mongolianView蒙层的颜色渐变
    self.midDrawerView.mongolianView.hidden = NO;
    self.midDrawerView.mongolianView.alpha = p.x / SCREEN_WIDTH;
    
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
            self.midDrawerView.mongolianView.hidden = p.x > SCREEN_WIDTH/2 ? NO : YES;
        }];
    }
}

- (void)hideLeftDrawer:(UIGestureRecognizer *)gesture {//有动画
    self.midDrawerView.mongolianView.hidden = YES;
    
    [UIView animateWithDuration:ANIMATE_DURATION animations:^{
        self.midDrawerView.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [self addScreenEdgePanGestureRecognizer];
        [self removeSwipeGestureRecognizer];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:[viewController isKindOfClass:[RootViewController class]] animated:YES];
}

@end
