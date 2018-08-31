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

//判断手势方向
+ (TranslationDirection)commitTranslation:(CGPoint)translation {
    CGFloat absX = fabs(translation.x);
    CGFloat absY = fabs(translation.y);
    // 设置滑动有效距离
    if (MAX(absX, absY) < 10) {
        return TranslationNone;
    }
    if (absX > absY) {
        if (translation.x < 0) {//向左滑动
            NSLog(@"向左滑动");
            return TranslationLeft;
        } else {//向右滑动
            NSLog(@"向右滑动");
            return TranslationRight;
        }
    } else if (absY > absX) {
        if (translation.y < 0) {//向上滑动
            NSLog(@"向上滑动");
            return TranslationTop;
        } else {//向下滑动
            NSLog(@"向下滑动");
            return TranslationBottom;
        }
    }
    
    return TranslationNone;
}

@end
