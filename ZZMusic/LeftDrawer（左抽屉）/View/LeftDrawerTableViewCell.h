//
//  LeftDrawerTableViewCell.h
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/28.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftDrawerTableViewCell : UITableViewCell

@property (nonatomic, copy) NSString *titleText;

@property (nonatomic, copy) NSString *subTitleText;

@property (nonatomic, assign) BOOL isOn;

///创建cell
+ (LeftDrawerTableViewCell *)createCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

@end
