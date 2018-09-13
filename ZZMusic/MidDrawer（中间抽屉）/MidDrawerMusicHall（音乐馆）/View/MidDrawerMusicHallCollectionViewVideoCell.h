//
//  MidDrawerMusicHallCollectionViewVideoCell.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/4.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark 音乐馆-VideoCell

@interface MidDrawerMusicHallCollectionViewVideoCell : UICollectionViewCell

///创建cell
+ (MidDrawerMusicHallCollectionViewVideoCell *)createCellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;

///是否显示副标题
@property (nonatomic, assign) BOOL isSubTitleVisible;

@end
