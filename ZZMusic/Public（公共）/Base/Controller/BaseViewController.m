//
//  BaseViewController.m
//  ZZMusic
//
//  Created by 仲召俊 on 2018/8/26.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupPage];
}

- (void)setupPage {
    self.view.backgroundColor = [UIColor whiteColor];
    ///去除导航栏下方黑线
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setMusicStrip];
}

//设置音乐条
- (void)setMusicStrip {
    ZZMusicStripView *musicStrip = [ZZMusicStripView new];
    musicStrip.backgroundColor = SECTION_BACKGROUNDCOLOR;
    [musicStrip show];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [SVProgressHUD dismiss];
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
