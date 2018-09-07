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

- (void)setTopImageBottomTitleWithMargin:(CGFloat)margin {
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    //文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    self.titleEdgeInsets = UIEdgeInsetsMake(self.imageView.frame.size.height+margin, -self.imageView.frame.size.width, 0.0, 0.0);
    //图片距离右边框距离减少图片的宽度，其它不变
    self.imageEdgeInsets = UIEdgeInsetsMake(-margin, 0.0, 0.0, -self.titleLabel.frame.size.width);
}

- (void)setImageToRightWithSize:(CGSize)size {
    CGFloat btnWidth = [self.titleLabel.text boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:self.titleLabel.font} context:nil].size.width;
    
    //调节文本和图片的内边距
    [self setEdgeInsetsWithTitleEdgeInsets:UIEdgeInsetsMake(0, -self.imageView.image.size.width-5, 0, self.imageView.image.size.width) imageEdgeInsets:UIEdgeInsetsMake(0, btnWidth+5, 0, -btnWidth)];
}

@end
