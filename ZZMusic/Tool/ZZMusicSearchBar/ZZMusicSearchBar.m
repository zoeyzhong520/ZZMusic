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
    UIView *searchTextField = nil;
//    self.barTintColor = [UIColor whiteColor];
    searchTextField = [[[self.subviews firstObject] subviews] lastObject];
    if ([searchTextField isKindOfClass:[UITextField class]]) {
        UITextField *tf = (UITextField *)searchTextField;
        //修改UISearchBar上的TextField高度
//        searchTextField.frame = CGRectMake(5, 0, SCREEN_WIDTH-10, 30);
        searchTextField.backgroundColor = RGB(0, 170, 112);
        tf.borderStyle = UITextBorderStyleNone;
    }
}

@end
