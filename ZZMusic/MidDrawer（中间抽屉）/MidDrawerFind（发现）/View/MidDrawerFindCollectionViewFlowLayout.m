//
//  MidDrawerFindCollectionViewFlowLayout.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/7.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerFindCollectionViewFlowLayout.h"

@implementation MidDrawerFindCollectionViewFlowLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.minimumLineSpacing = fontSizeScale(5);
        self.sectionInset = UIEdgeInsetsMake(0, fontSizeScale(2.5), 0, fontSizeScale(2.5));
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return self;
}

@end
