//
//  RootViewController.m
//  ZZMusic
//
//  Created by 仲召俊 on 2018/8/26.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

///添加到midDrawerView的蒙层
@property (nonatomic, strong) UIView *mongolianView;

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
    [self addScreenEdgePanGestureRecognizer];
    [self.midDrawerView.view addSubview:self.mongolianView];
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
    self.mongolianView.alpha = 0.0;
    self.mongolianView.hidden = NO;
    
    [UIView animateWithDuration:ANIMATE_DURATION animations:^{
        self.midDrawerView.view.frame = CGRectMake(SCREEN_WIDTH*4/5, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.leftDrawerView.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        
        [self removeScreenEdgePanGestureRecognizer];
        
        [self addSwipeGestureRecognizer];
        //mongolianView蒙层alpha值与边缘手势保持一致
        self.mongolianView.alpha = (SCREEN_WIDTH*4/5) / SCREEN_WIDTH;
    }];
}

- (void)showLeftDrawer:(UIScreenEdgePanGestureRecognizer *)gesture {
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
    self.mongolianView.hidden = NO;
    self.mongolianView.alpha = p.x / SCREEN_WIDTH;
    
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
            self.mongolianView.hidden = p.x > SCREEN_WIDTH/2 ? NO : YES;
        }];
    }
}

- (void)hideLeftDrawer:(UIGestureRecognizer *)gesture {//有动画
    self.mongolianView.hidden = YES;
    
    [UIView animateWithDuration:ANIMATE_DURATION animations:^{
        self.midDrawerView.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [self addScreenEdgePanGestureRecognizer];
        [self removeSwipeGestureRecognizer];
    }];
}

- (void)openSetting {//无动画
    self.mongolianView.hidden = YES;
    self.midDrawerView.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self removeScreenEdgePanGestureRecognizer];
    [self removeSwipeGestureRecognizer];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openLeftDrawer) name:OPEN_LEFTDRAWER_NOTIFICATION object:nil];
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

#pragma mark - Lazy
- (UIView *)mongolianView {
    if (!_mongolianView) {
        _mongolianView = [UIView createViewWithBackgroundColor:MONGOLIANLAYER_COLOR];
        _mongolianView.hidden = YES;
        _mongolianView.frame = SCREEN_RECT;
        [_mongolianView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideLeftDrawer:)]];
    }
    return _mongolianView;
}

@end
