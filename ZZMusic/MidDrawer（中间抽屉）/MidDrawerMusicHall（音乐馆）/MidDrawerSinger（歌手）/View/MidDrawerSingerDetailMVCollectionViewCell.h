//
//  MidDrawerSingerDetailMVCollectionViewCell.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/20.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MidDrawerSingerDetailMVCollectionViewCell : UICollectionViewCell

///创建cell
+ (MidDrawerSingerDetailMVCollectionViewCell *)createCellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
