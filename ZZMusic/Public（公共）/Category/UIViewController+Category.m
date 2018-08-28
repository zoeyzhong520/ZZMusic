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
    if (position == Left) {
        self.navigationItem.leftBarButtonItem = buttonItem;
    } else if (position == Right) {
        self.navigationItem.rightBarButtonItem = buttonItem;
    }
}

- (void)pop {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
