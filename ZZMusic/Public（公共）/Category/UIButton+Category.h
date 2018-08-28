//
//  UIButton+Category.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/27.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Category)

///CreateButtonWithTarget
+ (UIButton *)createButtonWithTarget:(id)target action:(SEL)action title:(NSString *)title textColor:(UIColor *)textColor imgStr:(NSString *)imgStr;

///设置文本、图片的间距
- (void)setEdgeInsetsWithTitleEdgeInsets:(UIEdgeInsets)titleEdgeInsets imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets;

@end
