//
//  MidDrawerAllMusicSinglePlayAllTableViewCell.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/10.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerAllMusicSinglePlayAllTableViewCell.h"

@interface MidDrawerAllMusicSinglePlayAllTableViewCell ()

///imgView
@property (nonatomic, strong) UIImageView *imgView;
///titleLabel
@property (nonatomic, strong) UILabel *titleLabel;
///manageButton
@property (nonatomic, strong) UIButton *manageButton;
///line
@property (nonatomic, strong) UIView *line;

@end

@implementation MidDrawerAllMusicSinglePlayAllTableViewCell

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
    
    [self.contentView addSubview:self.manageButton];
    
    [self.contentView addSubview:self.line];
    
    [self addConstraints];
}

//添加约束
- (void)addConstraints {
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(fontSizeScale(10));
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(24), fontSizeScale(24)));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.left.mas_equalTo(self.imgView.mas_right).offset(fontSizeScale(10));
        make.width.mas_equalTo([self.titleLabel singleLineWidth]);
    }];
    
    [self.manageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-fontSizeScale(10));
        make.size.mas_equalTo(self.imgView);
        make.centerY.mas_equalTo(0);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.mas_equalTo(self.imgView);
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

+ (MidDrawerAllMusicSinglePlayAllTableViewCell *)createCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    
    MidDrawerAllMusicSinglePlayAllTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MidDrawerAllMusicSinglePlayAllTableViewCellID" forIndexPath:indexPath];
    if (!cell) {
        cell = [[MidDrawerAllMusicSinglePlayAllTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MidDrawerAllMusicSinglePlayAllTableViewCellID"];
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
        _imgView = [UIImageView createImageViewWithImg:@"全部播放"];
    }
    return _imgView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel createLabelWithText:@"全部播放" font:BIG_FONT textColor:BLACK_TEXTCOLOR];
    }
    return _titleLabel;
}

- (UIButton *)manageButton {
    if (!_manageButton) {
        _manageButton = [UIButton createButtonWithTarget:self action:@selector(buttonClick) title:nil textColor:nil imgStr:@"管理歌单"];
    }
    return _manageButton;
}

- (UIView *)line {
    if (!_line) {
        _line = [UIView createViewWithBackgroundColor:LINE_COLOR];
    }
    return _line;
}

@end
