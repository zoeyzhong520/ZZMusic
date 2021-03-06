//
//  MidDrawerBaseModel.h
//  ZZMusic
//
//  Created by 仲召俊 on 2018/8/26.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "BaseModel.h"

@interface MidDrawerBaseModel : BaseModel

///分组标题
@property (nonatomic, copy) NSString *sectionTitle;
///分组类别
@property (nonatomic, copy) NSString *sectionType;
///cell类别
@property (nonatomic, copy) NSString *cellType;
///快讯类Cell是否显示图片下方标题
@property (nonatomic, assign) BOOL isNewsletterTitleVisible;

@end
