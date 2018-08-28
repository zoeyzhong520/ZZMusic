//
//  MidDrawerBubbleTableViewCell.h
//  ZZMusic
//
//  Created by 仲召俊 on 2018/8/27.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MidDrawerBubbleTableViewCell : UITableViewCell

@property (nonatomic, copy) NSString *titleText;

@property (nonatomic, copy) NSString *imgStr;

///创建cell
+ (MidDrawerBubbleTableViewCell *)createCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

@end
