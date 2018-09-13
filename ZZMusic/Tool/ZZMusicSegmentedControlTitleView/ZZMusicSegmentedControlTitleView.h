//
//  MidDrawerMusicHallTitleView.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/13.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark SegmentedControl titleView

@interface ZZMusicSegmentedControlTitleView : UIView

- (instancetype)initWithFrame:(CGRect)frame items:(NSArray *)items;

///点击回调block
@property (nonatomic, copy) void(^clickBlock)(NSInteger index);

@end
