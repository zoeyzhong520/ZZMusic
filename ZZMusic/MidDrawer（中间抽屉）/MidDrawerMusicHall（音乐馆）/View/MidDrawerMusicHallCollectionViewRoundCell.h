//
//  MidDrawerMusicHallCollectionViewRoundCell.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/4.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark 音乐馆-音乐Cell（圆形）

@interface MidDrawerMusicHallCollectionViewRoundCell : UICollectionViewCell

///创建cell
+ (MidDrawerMusicHallCollectionViewRoundCell *)createCellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;

@end
