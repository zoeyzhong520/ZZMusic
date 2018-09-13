//
//  MidDrawerAllMusicSingleTableViewCell.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/10.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MidDrawerAllMusicSingleTableViewCell : UITableViewCell

///创建cell
+ (MidDrawerAllMusicSingleTableViewCell *)createCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

@property (nonatomic, copy) dispatch_block_t clickBlock;

@end
