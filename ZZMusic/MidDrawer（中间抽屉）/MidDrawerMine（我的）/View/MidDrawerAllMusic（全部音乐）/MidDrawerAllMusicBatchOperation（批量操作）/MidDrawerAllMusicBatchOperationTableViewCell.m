//
//  MidDrawerAllMusicBatchOperationTableViewCell.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/11.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerAllMusicBatchOperationTableViewCell.h"

@interface MidDrawerAllMusicBatchOperationTableViewCell ()

///titleLabel
@property (nonatomic, strong) UILabel *titleLabel;
///subTitleLabel
@property (nonatomic, strong) UILabel *subTitleLabel;

@end

@implementation MidDrawerAllMusicBatchOperationTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    [self.contentView addSubview:self.titleLabel];
    
    [self.contentView addSubview:self.subTitleLabel];
    
    [self addConstraints];
}

//添加约束
- (void)addConstraints {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(fontSizeScale(10));
        make.size.mas_equalTo(CGSizeMake([self.titleLabel singleLineWidth], fontSizeScale(14)));
    }];
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.mas_equalTo(self.titleLabel);
        make.bottom.mas_equalTo(-fontSizeScale(10));
        make.size.mas_equalTo(CGSizeMake([self.subTitleLabel singleLineWidth], fontSizeScale(12)));
    }];
}

+ (MidDrawerAllMusicBatchOperationTableViewCell *)createCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    
    MidDrawerAllMusicBatchOperationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MidDrawerAllMusicBatchOperationTableViewCellID" forIndexPath:indexPath];
    if (!cell) {
        cell = [[MidDrawerAllMusicBatchOperationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MidDrawerAllMusicBatchOperationTableViewCellID"];
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark Lazy
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel createLabelWithText:@"A.I.N.Y." font:NORMAL_FONT textColor:BLACK_TEXTCOLOR];
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [UILabel createLabelWithText:@"邓紫棋·18（国语专辑）" font:SMALL_FONT textColor:GRAY_TEXTCOLOR];
    }
    return _subTitleLabel;
}

@end
