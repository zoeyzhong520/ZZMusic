//
//  ZZMusicCollectShapeAlertScrollView.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/11.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZMusicCollectShapeAlertScrollView : UIView

///列数
@property (nonatomic, assign) NSInteger columnCount;

- (instancetype)initWithFrame:(CGRect)frame images:(NSArray *)images titles:(NSArray *)titles;

@end
