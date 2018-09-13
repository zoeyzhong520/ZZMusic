//
//  MidDrawerRankingViewController.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/13.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerRankingViewController.h"

@interface MidDrawerRankingViewController ()

@end

@implementation MidDrawerRankingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setPage];
}

- (void)setPage {
    self.title = @"排行";
    
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
