//
//  MidDrawerFindArticleTableViewCell.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/6.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark 发现-文章Cell

@interface MidDrawerFindArticleTableViewCell : UITableViewCell

///创建cell
+ (MidDrawerFindArticleTableViewCell *)createCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

@end
