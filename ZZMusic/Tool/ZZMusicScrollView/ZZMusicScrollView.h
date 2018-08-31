//
//  ZZMusicScrollView.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/29.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    TranslationTop = 0,
    TranslationLeft,
    TranslationBottom,
    TranslationRight,
    TranslationNone
} TranslationDirection;

@interface ZZMusicScrollView : UIScrollView

///判断手势方向
+ (TranslationDirection)commitTranslation:(CGPoint)translation;

@end
