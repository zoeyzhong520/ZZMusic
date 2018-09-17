//
//  ZZMusicMenuBar.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/10.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark 菜单栏

@interface ZZMusicMenuBar : UIView

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;

@property (nonatomic, copy) void(^clickBlock)(NSInteger index);

///当前选择的index
@property (nonatomic, assign) NSInteger selectedIndex;

@end
