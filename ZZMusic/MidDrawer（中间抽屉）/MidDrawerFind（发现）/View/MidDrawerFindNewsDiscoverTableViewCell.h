//
//  MidDrawerFindNewsDiscoverTableViewCell.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/6.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark 发现-Discover Cell

@interface MidDrawerFindNewsDiscoverTableViewCell : UITableViewCell

///创建cell
+ (MidDrawerFindNewsDiscoverTableViewCell *)createCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

@property (nonatomic, retain) MidDrawerBaseModel *model;

@end
