//
//  UIButton+Category.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/27.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "UIButton+Category.h"

@implementation UIButton (Category)

+ (UIButton *)createButtonWithTarget:(id)target action:(SEL)action title:(NSString *)title textColor:(UIColor *)textColor imgStr:(NSString *)imgStr {
    
    UIButton *button = [[UIButton alloc] init];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:title ? title : @"" forState:UIControlStateNormal];
    [button setTitleColor:textColor ? textColor : [UIColor clearColor] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imgStr ? imgStr : @""] forState:UIControlStateNormal];
    return button;
}

- (void)setEdgeInsetsWithTitleEdgeInsets:(UIEdgeInsets)titleEdgeInsets imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets {
    
    self.titleEdgeInsets = titleEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}

@end
