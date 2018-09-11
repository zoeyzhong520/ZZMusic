//
//  ZZMusicTableShapeAlertView.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/10.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark 表格样式弹框

@interface ZZMusicTableShapeAlertView : UIView

- (instancetype)initWithButtons:(NSArray *)buttons;

//显示
- (void)show;

@property (nonatomic, copy) void(^clickBlock)(NSInteger index);

@end
