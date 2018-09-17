//
//  MidDrawerSingerTableViewCell.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/14.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerSingerTableViewCell.h"

@interface MidDrawerSingerTableViewCell ()

///imgView
@property (nonatomic, strong) UIImageView *imgView;
///titleLabel
@property (nonatomic, strong) UILabel *titleLabel;
///arrowImgView
@property (nonatomic, strong) UIImageView *arrowImgView;
///line
@property (nonatomic, strong) UIView *line;

@end

@implementation MidDrawerSingerTableViewCell

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
    
    [self.contentView addSubview:self.arrowImgView];
    
    [self.contentView addSubview:self.line];
    
    [self addConstraints];
}

//添加约束
- (void)addConstraints {
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(fontSizeScale(10));
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(40), fontSizeScale(40)));
    }];

    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imgView.mas_right).offset(fontSizeScale(10));
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo([self.titleLabel singleLineWidth]);
    }];

    [self.arrowImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-fontSizeScale(10));
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(12), fontSizeScale(12)));
        make.centerY.mas_equalTo(0);
    }];

    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.mas_equalTo(self.titleLabel);
        make.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(fontSizeScale(0.5));
    }];
}

+ (MidDrawerSingerTableViewCell *)createCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    
    MidDrawerSingerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MidDrawerSingerTableViewCellID" forIndexPath:indexPath];
    if (!cell) {
        cell = [[MidDrawerSingerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MidDrawerSingerTableViewCellID"];
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
        [_imgView sd_setImageWithURL:[NSURL URLWithString:AVATAR_PATH] placeholderImage:PLACEHOLDER_IMAGE];
        _imgView.layer.cornerRadius = fontSizeScale(20);
        _imgView.layer.masksToBounds = YES;
    }
    return _imgView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel createLabelWithText:@"白小白" font:NORMAL_FONT textColor:BLACK_TEXTCOLOR];
    }
    return _titleLabel;
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
