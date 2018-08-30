//
//  ZZMusicScrollView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/29.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "ZZMusicScrollView.h"

@interface ZZMusicScrollView ()<UIGestureRecognizerDelegate>

@end

@implementation ZZMusicScrollView

#pragma mark UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    if ([otherGestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]] || [otherGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        if (otherGestureRecognizer.state == UIGestureRecognizerStateBegan && self.contentOffset.x == 0) {
            return YES;
        }
    }
    
    return NO;
}

@end
