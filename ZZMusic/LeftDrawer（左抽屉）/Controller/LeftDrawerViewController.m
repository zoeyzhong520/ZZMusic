//
//  LeftDrawerViewController.m
//  ZZMusic
//
//  Created by 仲召俊 on 2018/8/26.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "LeftDrawerViewController.h"
#import "LeftDrawerView.h"
#import "LeftDrawerFooterView.h"

@interface LeftDrawerViewController ()<UINavigationControllerDelegate>

@property (nonatomic, strong) LeftDrawerView *leftDrawerView;

@property (nonatomic, strong) LeftDrawerFooterView *footerView;

@end

@implementation LeftDrawerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setPage];
}

- (void)setPage {
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.delegate = self;
    
    [self.view addSubview:self.leftDrawerView];
    
    [self.view addSubview:self.footerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:[viewController isKindOfClass:[self class]] animated:YES];
}

#pragma mark Lazy
- (LeftDrawerView *)leftDrawerView {
    if (!_leftDrawerView) {
        _leftDrawerView = [[LeftDrawerView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width*4/5, self.view.bounds.size.height)];
    }
    return _leftDrawerView;
}

- (LeftDrawerFooterView *)footerView {
    if (!_footerView) {
        _footerView = [[LeftDrawerFooterView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - fontSizeScale(50), self.view.bounds.size.width*4/5, fontSizeScale(50))];
        WeakSelf;
        _footerView.buttonClickBlock = ^(LeftDrawerFooterClickType clickType) {
            switch (clickType) {
                case Setting:
                    [[NSNotificationCenter defaultCenter] postNotificationName:OPEN_SETTING_NOTIFICATION object:nil];
                    break;
                    case Login:
                    break;
                default:
                    break;
            }
        };
    }
    return _footerView;
}

@end
