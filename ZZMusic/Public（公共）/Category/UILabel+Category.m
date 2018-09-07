//
//  UILabel+Category.m
//  ZZMusic
//
//  Created by 仲召俊 on 2018/8/27.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "UILabel+Category.h"

@implementation UILabel (Category)

+ (UILabel *)createLabelWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor {
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = font;
    label.textColor = textColor;
    return label;
}

- (CGFloat)singleLineWidth {
    if (!self.text) {
        return 0.0;
    }
    
    return [self.text sizeWithAttributes:@{NSFontAttributeName:self.font}].width+2;
}

@end
