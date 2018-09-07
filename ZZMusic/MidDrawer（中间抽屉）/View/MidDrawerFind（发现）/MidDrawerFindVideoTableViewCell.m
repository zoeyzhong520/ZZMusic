//
//  MidDrawerFindVideoTableViewCell.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/6.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerFindVideoTableViewCell.h"

@interface MidDrawerFindVideoTableViewCell ()

///头像
@property (nonatomic, strong) UIImageView *avatarImgView;
///等级图标
@property (nonatomic, strong) UIImageView *gradeImgView;
///姓名
@property (nonatomic, strong) UILabel *nameLabel;
///type类型
@property (nonatomic, strong) UILabel *typeLabel;
///title
@property (nonatomic, strong) UILabel *titleLabel;
///imgView
@property (nonatomic, strong) UIImageView *imgView;
///播放按钮
@property (nonatomic, strong) UIButton *playButton;
///时间
@property (nonatomic, strong) UILabel *timeLabel;
///评论
@property (nonatomic, strong) UIButton *commentButton;
///点赞
@property (nonatomic, strong) UIButton *likeButton;

@end

@implementation MidDrawerFindVideoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    [self.contentView addSubview:self.avatarImgView];
    [self.avatarImgView addSubview:self.gradeImgView];
    
    [self.contentView addSubview:self.nameLabel];
    
    [self.contentView addSubview:self.typeLabel];
    
    [self.contentView addSubview:self.titleLabel];
    
    [self.contentView addSubview:self.imgView];
    [self.imgView addSubview:self.playButton];
    
    [self.contentView addSubview:self.timeLabel];
    
    [self.contentView addSubview:self.commentButton];
    
    [self.contentView addSubview:self.likeButton];
    
    [self addConstraints];
}

//添加约束
- (void)addConstraints {
    [self.avatarImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(fontSizeScale(20));
        make.left.mas_equalTo(fontSizeScale(10));
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(30), fontSizeScale(30)));
    }];
    
    [self.gradeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(8), fontSizeScale(8)));
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.avatarImgView.mas_right).offset(fontSizeScale(10));
        make.centerY.mas_equalTo(self.avatarImgView);
        make.size.mas_equalTo(CGSizeMake([self.nameLabel singleLineWidth], fontSizeScale(14)));
    }];
    
    [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nameLabel.mas_right).offset(fontSizeScale(10));
        make.centerY.mas_equalTo(self.nameLabel);
        make.size.mas_equalTo(CGSizeMake([self.typeLabel singleLineWidth], fontSizeScale(12)));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.avatarImgView.mas_bottom).offset(fontSizeScale(10));
        make.left.mas_equalTo(fontSizeScale(10));
        make.right.mas_equalTo(-fontSizeScale(10));
    }];
    
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(fontSizeScale(10));
        make.left.mas_equalTo(fontSizeScale(10));
        make.right.mas_equalTo(-fontSizeScale(10));
        make.height.mas_equalTo(FIND_BANNER_HEIGHT);
    }];
    
    [self.playButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.imgView);
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(44), fontSizeScale(44)));
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-fontSizeScale(10));
        make.leftMargin.mas_equalTo(self.imgView);
        make.size.mas_equalTo(CGSizeMake([self.timeLabel singleLineWidth], fontSizeScale(12)));
    }];
    
    [self.likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-fontSizeScale(10));
        make.centerY.mas_equalTo(self.timeLabel);
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(44), fontSizeScale(24)));
    }];
    [self.likeButton setImageToRightWithSize:CGSizeMake(fontSizeScale(44), fontSizeScale(24))];
    
    [self.commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.likeButton.mas_left).offset(-fontSizeScale(10));
        make.size.mas_equalTo(self.likeButton);
        make.centerY.mas_equalTo(self.likeButton);
    }];
    [self.commentButton setImageToRightWithSize:CGSizeMake(fontSizeScale(44), fontSizeScale(24))];
}

//点击事件
- (void)buttonClick:(UIButton *)button {
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (MidDrawerFindVideoTableViewCell *)createCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    
    MidDrawerFindVideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MidDrawerFindVideoTableViewCellID" forIndexPath:indexPath];
    if (!cell) {
        NSLog(@"创建cell失败！");
    }
    return cell;
}

#pragma mark Lazy
- (UIImageView *)avatarImgView {
    if (!_avatarImgView) {
        _avatarImgView = [UIImageView createImageViewWithImg:nil];
        [_avatarImgView sd_setImageWithURL:[NSURL URLWithString:AVATAR_PATH] placeholderImage:PLACEHOLDER_IMAGE];
        _avatarImgView.layer.masksToBounds = YES;
        _avatarImgView.layer.cornerRadius = fontSizeScale(15);
    }
    return _avatarImgView;
}

- (UIImageView *)gradeImgView {
    if (!_gradeImgView) {
        _gradeImgView = [UIImageView createImageViewWithImg:nil];
        _gradeImgView.layer.masksToBounds = YES;
        _gradeImgView.layer.cornerRadius = fontSizeScale(4);
    }
    return _gradeImgView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel createLabelWithText:@"团综计划" font:NORMAL_FONT textColor:BLACK_TEXTCOLOR];
    }
    return _nameLabel;
}

- (UILabel *)typeLabel {
    if (!_typeLabel) {
        _typeLabel = [UILabel createLabelWithText:@"分享视频" font:SMALL_FONT textColor:GRAY_TEXTCOLOR];
    }
    return _typeLabel;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel createLabelWithText:@"EP3：玩！暑假最后的狂欢！【预警】笑到劈叉！笑到流泪！笑出鹅叫！" font:NORMAL_FONT textColor:BLACK_TEXTCOLOR];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView createImageViewWithImg:nil];
        _imgView.backgroundColor = SECTION_BACKGROUNDCOLOR;
    }
    return _imgView;
}

- (UIButton *)playButton {
    if (!_playButton) {
        _playButton = [UIButton createButtonWithTarget:self action:@selector(buttonClick:) title:nil textColor:nil imgStr:@"个性电台播放"];
    }
    return _playButton;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [UILabel createLabelWithText:@"最新推荐" font:SMALL_FONT textColor:MAIN_COLOR];
    }
    return _timeLabel;
}

- (UIButton *)commentButton {
    if (!_commentButton) {
        _commentButton = [UIButton createButtonWithTarget:self action:@selector(buttonClick:) title:@"8" textColor:GRAY_TEXTCOLOR imgStr:@"评论"];
        _commentButton.titleLabel.font = SMALL_FONT;
    }
    return _commentButton;
}

- (UIButton *)likeButton {
    if (!_likeButton) {
        _likeButton = [UIButton createButtonWithTarget:self action:@selector(buttonClick:) title:@"88" textColor:GRAY_TEXTCOLOR imgStr:@"点赞"];
        _likeButton.titleLabel.font = SMALL_FONT;
    }
    return _likeButton;
}

@end
