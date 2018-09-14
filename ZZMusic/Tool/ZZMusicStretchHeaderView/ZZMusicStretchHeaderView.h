//
//  ZZMusicStretchHeaderView.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/14.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZMusicStretchHeaderView : NSObject

- (instancetype)initWithStretchView:(UIView *)stretchView;

- (void)scrollViewDidScrollWithScrollView:(UIScrollView *)scrollView;

@end
