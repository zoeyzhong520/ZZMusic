//
//  LeftDrawerFooterView.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/28.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftDrawerFooterView : UIView

@property (nonatomic, copy) void(^buttonClickBlock)(LeftDrawerFooterClickType clickType);

@end
