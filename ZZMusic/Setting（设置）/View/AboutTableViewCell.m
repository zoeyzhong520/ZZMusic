//
//  AboutTableViewCell.m
//  ZZMusic
//
//  Created by 仲召俊 on 2018/9/7.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "AboutTableViewCell.h"

@interface AboutTableViewCell ()

///Title
@property (nonatomic, strong) UILabel *titleLabel;
///arrowImgView
@property (nonatomic, strong) UIImageView *arrowImgView;
///line
@property (nonatomic, strong) UIView *line;

@end

@implementation AboutTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    [self.contentView addSubview:self.titleLabel];
    
    [self.contentView addSubview:self.arrowImgView];
    
    [self.contentView addSubview:self.line];
    
    [self addConstraints];
}

//添加约束
- (void)addConstraints {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(fontSizeScale(15));
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo([self.titleLabel singleLineWidth]);
    }];
    
    [self.arrowImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-fontSizeScale(15));
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(12), fontSizeScale(12)));
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.mas_equalTo(self.titleLabel);
        make.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(fontSizeScale(0.5));
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (AboutTableViewCell *)createCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    
    AboutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AboutTableViewCellID" forIndexPath:indexPath];
    if (!cell) {
        NSLog(@"创建cell失败！");
    }
    return cell;
}

#pragma mark Setter
- (void)setTitleText:(NSString *)titleText {
    self.titleLabel.text = titleText;
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo([self.titleLabel singleLineWidth]);
    }];
}

#pragma mark Lazy
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel createLabelWithText:@"" font:NORMAL_FONT textColor:BLACK_TEXTCOLOR];
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
