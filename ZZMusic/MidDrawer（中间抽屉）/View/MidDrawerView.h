//
//  MidDrawerView.h
//  ZZMusic
//
//  Created by 仲召俊 on 2018/8/26.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MidDrawerView : UIView

///设置ScrollView的contentOffset
- (void)configScrollViewContentOffset:(NSInteger)index;

///滚动时执行的闭包，抛出当前页码
@property (nonatomic, copy) void(^scrollViewDidEndDeceleratingBlock)(NSInteger currentIndex);

@end
