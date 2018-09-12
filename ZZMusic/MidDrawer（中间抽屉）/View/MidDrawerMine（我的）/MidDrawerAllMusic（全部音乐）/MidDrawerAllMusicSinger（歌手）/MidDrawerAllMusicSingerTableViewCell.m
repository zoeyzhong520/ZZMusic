//
//  MidDrawerAllMusicSingerTableViewCell.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/12.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerAllMusicSingerTableViewCell.h"

@interface MidDrawerAllMusicSingerTableViewCell ()

///imgView
@property (nonatomic, strong) UIImageView *imgView;
///titleLabel
@property (nonatomic, strong) UILabel *titleLabel;
///subTitleLabel
@property (nonatomic, strong) UILabel *subTitleLabel;
///arrowImgView
@property (nonatomic, strong) UIImageView *arrowImgView;
///line
@property (nonatomic, strong) UIView *line;

@end

@implementation MidDrawerAllMusicSingerTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    [self.contentView addSubview:self.imgView];
    
    [self.contentView addSubview:self.titleLabel];
    
    [self.contentView addSubview:self.subTitleLabel];
    
    [self.contentView addSubview:self.arrowImgView];
    
    [self.contentView addSubview:self.line];
    
    [self addConstraints];
}

- (void)addConstraints {
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(fontSizeScale(10));
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(30), fontSizeScale(30)));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imgView.mas_right).offset(fontSizeScale(10));
        make.top.mas_equalTo(fontSizeScale(10));
        make.size.mas_equalTo(CGSizeMake([self.titleLabel singleLineWidth], fontSizeScale(14)));
    }];
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.mas_equalTo(self.titleLabel);
        make.bottom.mas_equalTo(-fontSizeScale(10));
        make.size.mas_equalTo(CGSizeMake([self.subTitleLabel singleLineWidth], fontSizeScale(12)));
    }];
    
    [self.arrowImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-fontSizeScale(10));
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(12), fontSizeScale(12)));
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.mas_equalTo(self.titleLabel);
        make.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(fontSizeScale(0.5));
    }];
}

+ (MidDrawerAllMusicSingerTableViewCell *)createCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    
    MidDrawerAllMusicSingerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MidDrawerAllMusicSingerTableViewCellID" forIndexPath:indexPath];
    if (!cell) {
        cell = [[MidDrawerAllMusicSingerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MidDrawerAllMusicSingerTableViewCellID"];
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
- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView createImageViewWithImg:@""];
        _imgView.backgroundColor = SECTION_BACKGROUNDCOLOR;
    }
    return _imgView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel createLabelWithText:@"Ashes Remain" font:NORMAL_FONT textColor:BLACK_TEXTCOLOR];
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [UILabel createLabelWithText:@"1首歌曲" font:SMALL_FONT textColor:GRAY_TEXTCOLOR];
    }
    return _subTitleLabel;
}

- (UIImageView *)arrowImgView {
    if (!_arrowImgView) {
        _arrowImgView = [UIImageView createImageViewWithImg:@"rightArrow"];
    }
    return _arrowImgView;
}

- (UIView *)line {
    if (!_line) {
        _line = [UIView createViewWithBackgroundColor:LINE_COLOR];
    }
    return _line;
}

@end
