//
//  MidDrawerSingerDetailIntroductionRecentDevelopmentTableViewCell.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/20.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerSingerDetailIntroductionRecentDevelopmentTableViewCell.h"

@interface MidDrawerSingerDetailIntroductionRecentDevelopmentTableViewCell ()

///avatarImgView
@property (nonatomic, strong) UIImageView *avatarImgView;
///titleLabel
@property (nonatomic, strong) UILabel *titleLabel;
///subTitleLabel
@property (nonatomic, strong) UILabel *subTitleLabel;
///arrowImgView
@property (nonatomic, strong) UIImageView *arrowImgView;

@end

@implementation MidDrawerSingerDetailIntroductionRecentDevelopmentTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    [self.contentView addSubview:self.avatarImgView];
    
    [self.contentView addSubview:self.titleLabel];
    
    [self.contentView addSubview:self.subTitleLabel];
    
    [self.contentView addSubview:self.arrowImgView];
    
    [self addConstraints];
}

//添加约束
- (void)addConstraints {
    [self.avatarImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.left.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(self.bounds.size.height-fontSizeScale(4), self.bounds.size.height-fontSizeScale(4)));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.avatarImgView.mas_right).offset(fontSizeScale(5));
        make.topMargin.mas_equalTo(self.avatarImgView).offset(fontSizeScale(5));
        make.size.mas_equalTo(CGSizeMake([self.titleLabel singleLineWidth], fontSizeScale(14)));
    }];
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.mas_equalTo(self.titleLabel);
        make.bottomMargin.mas_equalTo(self.avatarImgView).offset(-fontSizeScale(5));
        make.size.mas_equalTo(CGSizeMake([self.subTitleLabel singleLineWidth], fontSizeScale(12)));
    }];
    
    [self.arrowImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-fontSizeScale(10));
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(12), fontSizeScale(12)));
    }];
}

+ (MidDrawerSingerDetailIntroductionRecentDevelopmentTableViewCell *)createCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    MidDrawerSingerDetailIntroductionRecentDevelopmentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MidDrawerSingerDetailIntroductionRecentDevelopmentTableViewCellID" forIndexPath:indexPath];
    if (!cell) {
        cell = [[MidDrawerSingerDetailIntroductionRecentDevelopmentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MidDrawerSingerDetailIntroductionRecentDevelopmentTableViewCellID"];
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
- (UIImageView *)avatarImgView {
    if (!_avatarImgView) {
        _avatarImgView = [UIImageView createImageViewWithImg:@""];
        [_avatarImgView sd_setImageWithURL:[NSURL URLWithString:AVATAR_PATH] placeholderImage:PLACEHOLDER_IMAGE];
    }
    return _avatarImgView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel createLabelWithText:@"旋律一响，就被拽回三年二班" font:NORMAL_FONT textColor:BLACK_TEXTCOLOR];
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [UILabel createLabelWithText:@"嘿吆音乐 阅读13868" font:SMALL_FONT textColor:GRAY_TEXTCOLOR];
    }
    return _subTitleLabel;
}

- (UIImageView *)arrowImgView {
    if (!_arrowImgView) {
        _arrowImgView = [UIImageView createImageViewWithImg:@"rightArrow"];
    }
    return _arrowImgView;
}

@end
