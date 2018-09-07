//
//  AboutViewController.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/7.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "AboutViewController.h"
#import "AboutView.h"

@interface AboutViewController ()

@property (nonatomic, strong) AboutView *aboutView;

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setPage];
}

- (void)setPage {
    self.title = @"关于ZZ音乐";
    
    [self.view addSubview:self.aboutView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Lazy
- (AboutView *)aboutView {
    if (!_aboutView) {
        _aboutView = [[AboutView alloc] initWithFrame:self.view.bounds];
    }
    return _aboutView;
}

@end
