//
//  UIViewController+Category.h
//  ZZMusic
//
//  Created by 仲召俊 on 2018/8/26.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    left = 0,
    right = 1,
} Position;

@interface UIViewController (Category)

///添加UIBarButtonItem imgStr
- (void)addBarButtonItemWithPosition:(Position)position imgStr:(NSString *)imgStr target:(id)target action:(SEL)action;

///添加UIBarButtonItem title
- (void)addBarButtonItemWithPosition:(Position)position title:(NSString *)title target:(id)target action:(SEL)action;

@end
