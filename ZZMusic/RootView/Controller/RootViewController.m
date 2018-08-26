//
//  RootViewController.m
//  ZZMusic
//
//  Created by 仲召俊 on 2018/8/26.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

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
    [self setLeftButton];
}

- (void)setLeftButton {
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, STATUS_BAR_HEIGHT + fontSizeScale(10), fontSizeScale(50), fontSizeScale(50));
    [leftButton setImage:[UIImage imageNamed:@"midLeftMenu"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftItemAction) forControlEvents:UIControlEventTouchUpInside];
    [self.midDrawerView.view addSubview:leftButton];
}

//点击事件
- (void)leftItemAction {
    if (self.midDrawerView.view.frame.origin.x == 0) {
        [UIView animateWithDuration:ANIMATE_DURATION animations:^{
            self.midDrawerView.view.frame = CGRectMake(SCREEN_WIDTH*4/5, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            self.leftDrawerView.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        }];
    } else {
        [UIView animateWithDuration:ANIMATE_DURATION animations:^{
            self.midDrawerView.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
