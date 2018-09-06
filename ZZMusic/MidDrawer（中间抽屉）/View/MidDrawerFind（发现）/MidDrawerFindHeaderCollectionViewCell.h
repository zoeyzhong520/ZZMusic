//
//  MidDrawerFindHeaderCollectionViewCell.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/6.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark 音乐馆-HeaderCell

@interface MidDrawerFindHeaderCollectionViewCell : UICollectionViewCell

///创建cell
+ (MidDrawerFindHeaderCollectionViewCell *)createCellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;

@end
