//
//  BubbleLayer.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/27.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark 气泡视图

//箭头方向
typedef enum : NSUInteger {
    ArrowDirectionTop = 0,
    ArrowDirectionBottom,
    ArrowDirectionLeft,
    ArrowDirectionRight
} ArrowDirection;

@interface BubbleLayer : NSObject

@property CGFloat cornerRadius;
@property CGFloat arrowHeight;
@property CGFloat arrowWidth;
@property ArrowDirection arrowDirection;
// 箭头的位置 0表示最左／上，1表示最右／下
@property CGFloat arrowPosition;

- (instancetype)initWithSize:(CGSize)size;
// 返回一个 CAShapeLayer去mask
- (CAShapeLayer *)layer;

@end
