//
//  UIViewController+Category.m
//  ZZMusic
//
//  Created by 仲召俊 on 2018/8/26.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "UIViewController+Category.h"

@implementation UIViewController (Category)

- (void)addBarButtonItemWithPosition:(Position)position imgStr:(NSString *)imgStr action:(SEL)action {
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:imgStr ? imgStr : @""] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] style:UIBarButtonItemStylePlain target:self action:action ? action : @selector(pop)];
    buttonItem.tintColor = BLACK_TEXTCOLOR;
    if (position == Left) {
        self.navigationItem.leftBarButtonItem = buttonItem;
    } else if (position == Right) {
        self.navigationItem.rightBarButtonItem = buttonItem;
    }
}

- (void)addBarButtonItemWithPosition:(Position)position title:(NSString *)title action:(SEL)action {
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithTitle:title ? title : @"" style:UIBarButtonItemStylePlain target:self action:action ? action : @selector(pop)];
    buttonItem.tintColor = BLACK_TEXTCOLOR;
    if (position == Left) {
        self.navigationItem.leftBarButtonItem = buttonItem;
    } else if (position == Right) {
        self.navigationItem.rightBarButtonItem = buttonItem;
    }
}

- (void)pop {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)presentLoginViewController {
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:[LoginViewController new]] animated:YES completion:nil];
}

- (void)showViewControllerWithClassName:(NSString *)className {
    if (!NSClassFromString(className)) {
        return;
    }
    UIViewController *vc = [[NSClassFromString(className) alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)showWebViewControllerWithUrl:(NSString *)url {
    BaseWebViewController *webVC = [[BaseWebViewController alloc] init];
    webVC.urlString = url;
    [self.navigationController pushViewController:webVC animated:YES];
}

///设置边缘手势
- (void)addScreenEdgePanGestureRecognizerWithAction:(SEL)action {
    UIScreenEdgePanGestureRecognizer *leftGes = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:action];
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

///添加轻扫手势
- (void)addSwipeGestureRecognizerWithAction:(SEL)action {
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:action];
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

- (void)setNavigationBarTransparent:(BOOL)isTransparent {
    [self.navigationController.navigationBar setBackgroundImage:isTransparent ? [UIImage new] : nil forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = isTransparent ? [UIImage new] : nil;
}

- (void)setNavigationBarTintColorWithColor:(UIColor *)color {
    if (color) {
        self.navigationController.navigationBar.tintColor = color;
    }
}

@end
