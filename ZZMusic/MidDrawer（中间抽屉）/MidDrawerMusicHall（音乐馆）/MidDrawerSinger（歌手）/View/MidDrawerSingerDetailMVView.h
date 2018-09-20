//
//  MidDrawerSingerDetailMVView.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/17.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark 歌手详情-MV View

@interface MidDrawerSingerDetailMVView : UIView

@property (nonatomic, copy) void(^scrollBlock)(UIScrollView *scrollView);
///设置滚动到顶部
@property (nonatomic, assign) BOOL shouldScrollToTop;

@end
