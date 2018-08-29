//
//  SettingTableViewCell.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/29.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "SettingTableViewCell.h"

@interface SettingTableViewCell ()

///主标题
@property (nonatomic, strong) UILabel *titleLabel;
///副标题
@property (nonatomic, strong) UILabel *subTitleLabel;
///开关控件
@property (nonatomic, strong) UISwitch *switchControl;
///箭头
@property (nonatomic, strong) UIImageView *imgView;
///横线
@property (nonatomic, strong) UIView *bottomLine;

@end

@implementation SettingTableViewCell

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
    
    [self.contentView addSubview:self.switchControl];
    
    [self.contentView addSubview:self.imgView];

    [self.contentView addSubview:self.bottomLine];
    
    [self addConstraints];
}

- (void)addConstraints {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(fontSizeScale(15));
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(SCREEN_WIDTH / 2);
    }];
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-fontSizeScale(45));
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(SCREEN_WIDTH / 2);
    }];
    
    [self.switchControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-fontSizeScale(15));
        make.centerY.mas_equalTo(0);
    }];
    
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-fontSizeScale(15));
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(14), fontSizeScale(14)));
    }];
    
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(fontSizeScale(15));
        make.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(fontSizeScale(0.5));
    }];
}

+ (SettingTableViewCell *)createCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingTableViewCellID" forIndexPath:indexPath];
    if (!cell) {
        NSLog(@"创建cell失败！");
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

#pragma mark Setter
- (void)setTitleText:(NSString *)titleText {
    self.titleLabel.text = titleText;
}

- (void)setSubTitleText:(NSString *)subTitleText {
    self.subTitleLabel.hidden = NO;
    self.subTitleLabel.text = subTitleText;
}

- (void)setIsOn:(BOOL)isOn {
    self.switchControl.hidden = NO;
    self.switchControl.on = isOn;
    self.imgView.hidden = YES;
}

#pragma mark Lazy
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel createLabelWithText:@"" font:NORMAL_FONT textColor:BLACK_TEXTCOLOR];
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [UILabel createLabelWithText:@"" font:SMALL_FONT textColor:GRAY_TEXTCOLOR];
        _subTitleLabel.textAlignment = NSTextAlignmentRight;
        _subTitleLabel.hidden = YES;
    }
    return _subTitleLabel;
}

- (UISwitch *)switchControl {
    if (!_switchControl) {
        _switchControl = [UISwitch new];
        _switchControl.on = NO;
        _switchControl.hidden = YES;
        _switchControl.transform = CGAffineTransformMakeScale(0.7, 0.7);
    }
    return _switchControl;
}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView createImageViewWithImg:@"rightArrow"];
    }
    return _imgView;
}

- (UIView *)bottomLine {
    if (!_bottomLine) {
        _bottomLine = [UIView createViewWithBackgroundColor:LINE_COLOR];
    }
    return _bottomLine;
}

@end
