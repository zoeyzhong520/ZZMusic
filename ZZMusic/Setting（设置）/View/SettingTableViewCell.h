//
//  SettingTableViewCell.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/29.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingTableViewCell : UITableViewCell

///创建cell
+ (SettingTableViewCell *)createCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

@property (nonatomic, copy) NSString *titleText;

@property (nonatomic, copy) NSString *subTitleText;

@property (nonatomic, assign) BOOL isOn;

@end
