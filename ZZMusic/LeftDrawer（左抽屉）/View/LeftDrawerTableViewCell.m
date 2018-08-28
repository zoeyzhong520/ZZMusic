//
//  LeftDrawerTableViewCell.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/28.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "LeftDrawerTableViewCell.h"

@interface LeftDrawerTableViewCell ()

///主标题
@property (nonatomic, strong) UILabel *titleLabel;
///副标题
@property (nonatomic, strong) UILabel *subTitleLabel;
///开关按钮
@property (nonatomic, strong) UISwitch *switchControl;

@end

@implementation LeftDrawerTableViewCell

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
    
    [self addConstraints];
}

- (void)addConstraints {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(fontSizeScale(15));
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(SCREEN_WIDTH/2);
    }];
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-fontSizeScale(15));
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(SCREEN_WIDTH/2);
    }];
    
    [self.switchControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-fontSizeScale(15));
        make.centerY.mas_equalTo(0);
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

+ (LeftDrawerTableViewCell *)createCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    LeftDrawerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LeftDrawerTableViewCellID" forIndexPath:indexPath];
    if (!cell) {
        NSLog(@"创建cell失败！");
    }
    return cell;
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
        _subTitleLabel.hidden = YES;
        _subTitleLabel.textAlignment = NSTextAlignmentRight;
    }
    return _subTitleLabel;
}

- (UISwitch *)switchControl {
    if (!_switchControl) {
        _switchControl = [UISwitch new];
        _switchControl.on = NO;
        _switchControl.hidden = YES;
        _switchControl.transform = CGAffineTransformMakeScale(0.8, 0.8);//缩放
    }
    return _switchControl;
}

@end
