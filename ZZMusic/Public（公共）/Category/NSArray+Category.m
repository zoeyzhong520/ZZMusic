//
//  NSArray+Category.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/14.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "NSArray+Category.h"

@implementation NSArray (Category)

+ (NSMutableArray *)getSortedAlphabetArrayWithOriginArray:(NSArray *)originArray Ascending:(BOOL)Ascending {
    
    NSMutableArray *alphabetArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < originArray.count; i ++) {
        NSString *alphabet = [(NSString *)[originArray objectAtIndex:i] getFirstLetter];
        if (![alphabetArray containsObject:alphabet]) {
            [alphabetArray addObject:alphabet];
        }
    }
    
    //排序
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:Ascending];
    NSArray *descriptors = [NSArray arrayWithObject:descriptor];
    NSMutableArray *result = [[NSMutableArray alloc] initWithArray:[alphabetArray sortedArrayUsingDescriptors:descriptors]];
    return result;
}

@end
