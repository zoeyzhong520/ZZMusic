//
//  AboutTableViewCell.h
//  ZZMusic
//
//  Created by 仲召俊 on 2018/9/7.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutTableViewCell : UITableViewCell

///创建cell
+ (AboutTableViewCell *)createCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

///titleText
@property (nonatomic, copy) NSString *titleText;

@end
