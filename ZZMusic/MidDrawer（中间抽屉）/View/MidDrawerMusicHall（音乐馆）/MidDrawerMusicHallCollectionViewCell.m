//
//  MidDrawerMusicHallCollectionViewCell.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/3.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerMusicHallCollectionViewCell.h"

@interface MidDrawerMusicHallCollectionViewCell ()



@end

@implementation MidDrawerMusicHallCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    UIView *view = [UIView createViewWithBackgroundColor:MAIN_COLOR];
    [self.contentView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView);
    }];
}

+ (MidDrawerMusicHallCollectionViewCell *)createCellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    MidDrawerMusicHallCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MidDrawerMusicHallCollectionViewCellID" forIndexPath:indexPath];
    if (!cell) {
        NSLog(@"创建cell失败！");
    }
    return cell;
}

@end
