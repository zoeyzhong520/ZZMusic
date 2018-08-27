//
//  BubbleLayer.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/27.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "BubbleLayer.h"

@interface BubbleLayer ()

// 箭头的三个点
@property (nonatomic, strong) NSMutableArray *arrowPoints;
// 开始画圆角的点：对应角顺序是：右下、左下，左上，右上
// 这个顺序的好处后面会说
@property (nonatomic, strong) NSMutableArray *keyPointAtcorner;
// 圆角的圆心，顺序对应上面圆角的顺序
@property (nonatomic, strong) NSMutableArray *centerOfCorner;
// 矩形的frame
@property (nonatomic) CGRect contentFrame;
// 整个Layer的size
@property (nonatomic) CGSize size;

@end

@implementation BubbleLayer

//计算矩形的范围。contentFrame的作用主要是方便计算keyPointAtcorner和centerOfCorner
- (CGRect)contentFrame {
    CGFloat x = 0, y = 0;
    CGFloat width = _size.width, height = _size.height;
    
    switch (_arrowDirection) {
        case ArrowDirectionRight:
            width -= _arrowHeight;
            break;
        case ArrowDirectionBottom:
            height -= _arrowHeight;
            break;
        case ArrowDirectionLeft:
            x = _arrowHeight;
            width -= _arrowHeight;
            break;
        case ArrowDirectionTop:
            y = _arrowHeight;
            height -= _arrowHeight;
            break;
        default:
            break;
    }
    
    _contentFrame = CGRectMake(x, y, width, height);
    return _contentFrame;
}

//计算在每个圆角处，开始画弧线的点。计算出这些关键的点，在画直线的时候会很方便。
- (NSMutableArray *)keyPointAtcorner {
    CGRect cFrame = [self contentFrame];
    
    CGPoint bottomRight = CGPointMake(CGRectGetMaxX(cFrame), CGRectGetMaxY(cFrame) - _cornerRadius);
    CGPoint bottomLeft = CGPointMake(CGRectGetMinX(cFrame) + _cornerRadius, CGRectGetMaxY(cFrame));
    CGPoint topLeft = CGPointMake(CGRectGetMinX(cFrame), CGRectGetMinY(cFrame) + _cornerRadius);
    CGPoint topRight = CGPointMake(CGRectGetMaxX(cFrame) - _cornerRadius, CGRectGetMinY(cFrame));
    
    _keyPointAtcorner = [NSMutableArray arrayWithObjects:[NSValue valueWithCGPoint:bottomRight], [NSValue valueWithCGPoint:bottomLeft], [NSValue valueWithCGPoint:topLeft], [NSValue valueWithCGPoint:topRight], nil];
    return _keyPointAtcorner;
}

//画每个圆角的圆弧的圆心，圆心放在数组中的顺序必须跟keyPointAtcorner中对应点的顺序一致。计算出圆心的位置，画弧线的时候也会方便一点。
- (NSMutableArray *)centerOfCorner {
    CGRect cFrame = [self contentFrame];
    
    CGPoint bottomRight = CGPointMake(CGRectGetMaxX(cFrame) - _cornerRadius, CGRectGetMaxY(cFrame) - _cornerRadius);
    CGPoint bottomLeft = CGPointMake(CGRectGetMinX(cFrame) + _cornerRadius, CGRectGetMaxY(cFrame) - _cornerRadius);
    CGPoint topLeft = CGPointMake(CGRectGetMinX(cFrame) + _cornerRadius, CGRectGetMinY(cFrame) + _cornerRadius);
    CGPoint topRight = CGPointMake(CGRectGetMaxX(cFrame) - _cornerRadius, CGRectGetMinY(cFrame) + _cornerRadius);
    
    _centerOfCorner = [NSMutableArray arrayWithObjects:[NSValue valueWithCGPoint:bottomRight], [NSValue valueWithCGPoint:bottomLeft], [NSValue valueWithCGPoint:topLeft], [NSValue valueWithCGPoint:topRight], nil];
    return _centerOfCorner;
}

//计算箭头的三个点。按照顺时针画，所以箭头的三个点也要按照顺序放好。
- (NSMutableArray *)arrowPoints {
    CGPoint beginPoint;
    CGPoint headPoint;
    CGPoint endPoint;
    
    // 箭头 纵向/横向的可调长度
    CGFloat validWidthForHead = _size.width - 2 * _cornerRadius - _arrowWidth;
    CGFloat validHeightForHead = _size.height - 2 * _cornerRadius - _arrowWidth;
    
    switch (_arrowDirection) {
            
            //右
        case ArrowDirectionRight:  //以中间作基准
            headPoint = CGPointMake(_size.width , _size.height/2 + validHeightForHead*(_arrowPosition - 0.5));
            beginPoint = CGPointMake(headPoint.x - _arrowHeight, headPoint.y - _arrowWidth/2);
            endPoint = CGPointMake(beginPoint.x, beginPoint.y + _arrowWidth);
            break;
            
            //下
        case ArrowDirectionBottom:
            headPoint = CGPointMake(_size.width/2 + validWidthForHead*(_arrowPosition - 0.5), _size.height);
            beginPoint = CGPointMake(headPoint.x + _arrowWidth/2, headPoint.y - _arrowHeight);
            endPoint = CGPointMake(beginPoint.x - _arrowWidth, beginPoint.y);
            break;
            
            // 左
        case ArrowDirectionLeft:
            headPoint = CGPointMake(0, _size.height/2 + validHeightForHead*(_arrowPosition - 0.5));
            beginPoint = CGPointMake(headPoint.x + _arrowHeight, headPoint.y + _arrowWidth/2);
            endPoint = CGPointMake(beginPoint.x, beginPoint.y - _arrowWidth);
            break;
            
            //上
        case ArrowDirectionTop:
            headPoint = CGPointMake(_size.width/2 + validWidthForHead*(_arrowPosition - 0.5), 0);
            beginPoint = CGPointMake(headPoint.x - _arrowWidth/2, headPoint.y + _arrowHeight);
            endPoint = CGPointMake(beginPoint.x + _arrowWidth, beginPoint.y);
            break;
    }
    
    _arrowPoints = [NSMutableArray arrayWithObjects:[NSValue valueWithCGPoint:beginPoint],
                    [NSValue valueWithCGPoint:headPoint],
                    [NSValue valueWithCGPoint:endPoint],  nil];
    
    return _arrowPoints;
}

//所以的关键点都准备好之后，就可以开始动笔了。画图的大致流程是：先画出三角形箭头，然后按照顺时针方向，画出直线边和圆角；画完最后一个圆角就完成了（起点和终点不用手动连起来）。
- (UIBezierPath *)bubblePath {
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    NSMutableArray *arrow = [self arrowPoints];
    NSMutableArray *keyPoints = [self keyPointAtcorner];
    NSMutableArray *centers = [self centerOfCorner];
    
    // 第一个被绘制的角在数组中的下标
    // 根据箭头的方向决定的
    // 箭头向右时，箭头开始顺时针第一个角是右下角 数组下标为0
    // 以此类推
    int currentCorner;
    
    switch (_arrowDirection) {
        case ArrowDirectionRight:
            currentCorner = 0;
            break;
        case ArrowDirectionBottom:
            currentCorner = 1;
            break;
        case ArrowDirectionLeft:
            currentCorner = 2;
            break;
        case ArrowDirectionTop:
            currentCorner = 3;
            break;
        default:
            break;
    }
    
    // 先画箭头，顺时针画
    CGPoint nextPoint = [[arrow objectAtIndex:0] CGPointValue];
    [path moveToPoint:CGPointMake(nextPoint.x, nextPoint.y)];
    // 箭头顶点
    nextPoint = [[arrow objectAtIndex:1] CGPointValue];
    [path addLineToPoint:CGPointMake(nextPoint.x, nextPoint.y)];
    
    nextPoint = [[arrow objectAtIndex:2] CGPointValue];
    [path addLineToPoint:CGPointMake(nextPoint.x, nextPoint.y)];
    
    // 用来画圆角的圆心
    CGPoint nextCenter;
    
    for (int i = 0; i < 4; i ++) {
        // 连到开始画圆角的点
        nextPoint = [[keyPoints objectAtIndex:currentCorner] CGPointValue];
        [path addLineToPoint:CGPointMake(nextPoint.x, nextPoint.y)];
        
        // 画圆角
        nextCenter = [[centers objectAtIndex:currentCorner] CGPointValue];
        [path addArcWithCenter:nextCenter radius:_cornerRadius startAngle:currentCorner * M_PI / 2 endAngle:(currentCorner+1) * M_PI / 2 clockwise:YES];
        // 之所以把右下角的相关信息放在数组的第一位，
        // 是因为右下角画弧线是，开始角度是 0 * M_PI/2
        // 其他三个弧线的开始角度就依次是 1 * M_PI/2；2 * M_PI/2；3 * M_PI/2
        
        // 准备下一个圆角
        currentCorner = (currentCorner+1)%4;
    }
    return path;
}

//调用上面的方法，一个气泡式的path就被绘制出来。接下来只要把它应用到一个CAShapeLayer对象上，就可以拿去用了。
- (CAShapeLayer *)layer {
    UIBezierPath *path = [self bubblePath];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    return layer;
}

//下面是初始化方法和设置默认属性的方法
- (void)setDefaultProperty {
    _cornerRadius = 10;
    _arrowWidth = 10;
    _arrowHeight = 10;
    _arrowDirection = ArrowDirectionBottom;
    _arrowPosition = 0.5;
}

- (instancetype)initWithSize:(CGSize)size {
    self = [super init];
    if (self) {
        [self setDefaultProperty];
        _size = size;
    }
    return self;
}

@end
