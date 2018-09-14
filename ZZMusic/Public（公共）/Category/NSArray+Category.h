//
//  NSArray+Category.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/14.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Category)

/**
 字符串数组获取拼音首字母并进行排序
 @param originArray 需要排序的原字符串数组
 @param Ascending 排序方式
*/
+ (NSMutableArray *)getSortedAlphabetArrayWithOriginArray:(NSArray *)originArray Ascending:(BOOL)Ascending;

@end
