//
//  MidDrawerAllMusicSingleTableViewCell.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/10.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerAllMusicSingleTableViewCell.h"

@interface MidDrawerAllMusicSingleTableViewCell ()

///titleLabel
@property (nonatomic, strong) UILabel *titleLabel;
///subTitleLabel
@property (nonatomic, strong) UILabel *subTitleLabel;
///optionButton
@property (nonatomic, strong) UIButton *optionButton;
///imgView
@property (nonatomic, strong) UIImageView *imgView;
///line
@property (nonatomic, strong) UIView *line;

@end

@implementation MidDrawerAllMusicSingleTableViewCell

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
    
    [self.contentView addSubview:self.optionButton];
    [self.optionButton addSubview:self.imgView];
    
    [self.contentView addSubview:self.line];
    
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
    
    [self.optionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-fontSizeScale(10));
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(30), fontSizeScale(30)));
    }];
    
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(15), fontSizeScale(15)));
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.mas_equalTo(self.titleLabel);
        make.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(fontSizeScale(0.5));
    }];
}

//点击事件
- (void)buttonClick {
    if (self.clickBlock) {
        self.clickBlock();
    }
}

+ (MidDrawerAllMusicSingleTableViewCell *)createCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    
    MidDrawerAllMusicSingleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MidDrawerAllMusicSingleTableViewCellID" forIndexPath:indexPath];
    if (!cell) {
        cell = [[MidDrawerAllMusicSingleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MidDrawerAllMusicSingleTableViewCellID"];
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

- (UIButton *)optionButton {
    if (!_optionButton) {
        _optionButton = [UIButton createButtonWithTarget:self action:@selector(buttonClick) title:nil textColor:nil imgStr:nil];
    }
    return _optionButton;
}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView createImageViewWithImg:@"三个圈灰色"];
    }
    return _imgView;
}

- (UIView *)line {
    if (!_line) {
        _line = [UIView createViewWithBackgroundColor:LINE_COLOR];
    }
    return _line;
}

@end
