//
//  MidDrawerFindNewsletterTableViewCell.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/6.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark 发现-快讯Cell

@interface MidDrawerFindNewsletterTableViewCell : UITableViewCell

///创建cell
+ (MidDrawerFindNewsletterTableViewCell *)createCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

@property (nonatomic, retain) MidDrawerBaseModel *model;

@end
