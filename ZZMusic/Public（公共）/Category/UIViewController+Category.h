//
//  UIViewController+Category.h
//  ZZMusic
//
//  Created by 仲召俊 on 2018/8/26.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    Left = 0,
    Right = 1,
} Position;

@interface UIViewController (Category)

///添加UIBarButtonItem imgStr
- (void)addBarButtonItemWithPosition:(Position)position imgStr:(NSString *)imgStr action:(SEL)action;

///添加UIBarButtonItem title
- (void)addBarButtonItemWithPosition:(Position)position title:(NSString *)title action:(SEL)action;

///PresentLoginViewController
- (void)presentLoginViewController;

///ShowViewControllerWithClassName
- (void)showViewControllerWithClassName:(NSString *)className;

///showWebViewControllerWithUrl
- (void)showWebViewControllerWithUrl:(NSString *)url;

///设置边缘手势
- (void)addScreenEdgePanGestureRecognizerWithAction:(SEL)action;

///移除边缘手势
- (void)removeScreenEdgePanGestureRecognizer;

///添加轻扫手势
- (void)addSwipeGestureRecognizerWithAction:(SEL)action;

///移除轻扫手势
- (void)removeSwipeGestureRecognizer;

///设置导航栏是否全透明
- (void)setNavigationBarTransparent:(BOOL)isTransparent;

///设置导航栏TintColor
- (void)setNavigationBarTintColorWithColor:(UIColor *)color;

///设置导航栏背景色
- (void)setNavigationBarBackgroundColorWithColor:(UIColor *)color;

@end
