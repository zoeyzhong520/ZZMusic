//
//  UIImageView+Category.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/28.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "UIImageView+Category.h"

@implementation UIImageView (Category)

+ (UIImageView *)createImageViewWithImg:(NSString *)img {
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:img ? img : @""]];
    return imageView;
}

@end
