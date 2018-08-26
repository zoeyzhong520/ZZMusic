//
//  UIViewController+Category.m
//  ZZMusic
//
//  Created by 仲召俊 on 2018/8/26.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "UIViewController+Category.h"

@implementation UIViewController (Category)

- (void)addBarButtonItemWithPosition:(Position)position imgStr:(NSString *)imgStr target:(id)target action:(SEL)action {
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:imgStr ? imgStr : @""] style:UIBarButtonItemStylePlain target:target action:action];
    if (position == left) {
        self.navigationItem.leftBarButtonItem = buttonItem;
    } else if (position == right) {
        self.navigationItem.rightBarButtonItem = buttonItem;
    }
}

- (void)addBarButtonItemWithPosition:(Position)position title:(NSString *)title target:(id)target action:(SEL)action {
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithTitle:title ? title : @"" style:UIBarButtonItemStylePlain target:target action:action];
    if (position == left) {
        self.navigationItem.leftBarButtonItem = buttonItem;
    } else if (position == right) {
        self.navigationItem.rightBarButtonItem = buttonItem;
    }
}

@end
