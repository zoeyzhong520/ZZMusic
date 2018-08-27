//
//  UIView+Category.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/27.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)

+ (UIView *)createViewWithBackgroundColor:(UIColor *)backgroundColor {
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = backgroundColor;
    return view;
}

@end
