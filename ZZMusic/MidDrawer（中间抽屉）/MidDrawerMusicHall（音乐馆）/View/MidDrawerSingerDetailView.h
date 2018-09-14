//
//  MidDrawerSingerDetailView.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/14.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MidDrawerSingerDetailViewDelegate <NSObject>

@optional

- (void)MidDrawerSingerDetailViewScrollViewDidScroll:(UIScrollView *)scrollView;

@end

#pragma mark 歌手-详情View

@interface MidDrawerSingerDetailView : UIView

///代理
@property (nonatomic, weak) id<MidDrawerSingerDetailViewDelegate>delegate;

@end
