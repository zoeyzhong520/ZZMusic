//
//  LoginViewController.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/29.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"

@interface LoginViewController ()

@property (nonatomic, strong) LoginView *loginView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setPage];
}

- (void)setPage {
    self.view.backgroundColor = SECTION_BACKGROUNDCOLOR;
    
    [self addBarButtonItemWithPosition:Left title:@"取消" action:@selector(disMiss)];
    
    [self setNavigationBarTransparent:YES];
    
    [self.view addSubview:self.loginView];
}

//点击事件
- (void)disMiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Lazy
- (LoginView *)loginView {
    if (!_loginView) {
        _loginView = [[LoginView alloc] initWithFrame:self.view.bounds];
    }
    return _loginView;
}

@end
