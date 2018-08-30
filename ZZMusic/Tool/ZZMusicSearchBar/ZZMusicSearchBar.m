//
//  ZZMusicSearchBar.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/30.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "ZZMusicSearchBar.h"

@implementation ZZMusicSearchBar

- (void)layoutSubviews {
    [super layoutSubviews];
    UIImage *img = [UIImage GetImageWithColor:MAIN_COLOR andHeight:SEARCHBAR_HEIGHT];
    [self setBackgroundImage:img];
    [self setBackgroundColor:[UIColor clearColor]];
    self.placeholder = @"搜索";
    
    ///获取UITextField
    UIView *searchTextField = nil;
    searchTextField = [[[self.subviews firstObject] subviews] lastObject];
    if ([searchTextField isKindOfClass:[UITextField class]]) {
        UITextField *tf = (UITextField *)searchTextField;
        //修改UISearchBar上的TextField高度
//        searchTextField.frame = CGRectMake(5, 0, SCREEN_WIDTH-10, 30);
        searchTextField.backgroundColor = RGB(0, 170, 112);
        tf.borderStyle = UITextBorderStyleNone;
        //通过kvc改变搜索文本框的占位符字体颜色
        [searchTextField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    }
    
    UIButton *cancelButton = [self valueForKey:@"cancelButton"];
    [cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
}

@end
