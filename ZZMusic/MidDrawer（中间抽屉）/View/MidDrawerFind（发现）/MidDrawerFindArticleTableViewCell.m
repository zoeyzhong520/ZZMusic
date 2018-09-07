//
//  MidDrawerFindArticleTableViewCell.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/6.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerFindArticleTableViewCell.h"

@interface MidDrawerFindArticleTableViewCell ()

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
///subTitle
@property (nonatomic, strong) UILabel *subTitleLabel;
///imgView
@property (nonatomic, strong) UIImageView *imgView;
///推荐类别
@property (nonatomic, strong) UILabel *recommendTypeLabel;
///评论
@property (nonatomic, strong) UIButton *commentButton;
///点赞
@property (nonatomic, strong) UIButton *likeButton;

@end

@implementation MidDrawerFindArticleTableViewCell

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
    
    [self.contentView addSubview:self.subTitleLabel];
    
    [self.contentView addSubview:self.imgView];
    
    [self.contentView addSubview:self.recommendTypeLabel];
    
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
    
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-fontSizeScale(44));
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(100), fontSizeScale(100)));
        make.right.mas_equalTo(-fontSizeScale(10));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.avatarImgView.mas_bottom).offset(fontSizeScale(20));
        make.leftMargin.mas_equalTo(self.avatarImgView);
        make.right.mas_equalTo(self.imgView.mas_left).offset(-fontSizeScale(30));
    }];
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.mas_equalTo(self.titleLabel);
        make.right.mas_equalTo(self.imgView.mas_left).offset(-fontSizeScale(15));
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(fontSizeScale(20));
    }];
    
    [self.recommendTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-fontSizeScale(10));
        make.left.mas_equalTo(fontSizeScale(10));
        make.size.mas_equalTo(CGSizeMake([self.recommendTypeLabel singleLineWidth], fontSizeScale(12)));
    }];
    
    [self.likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-fontSizeScale(5));
        make.centerY.mas_equalTo(self.recommendTypeLabel);
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(44), fontSizeScale(24)));
    }];
    
    [self.commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.likeButton.mas_left).offset(-fontSizeScale(10));
        make.size.mas_equalTo(self.likeButton);
        make.centerY.mas_equalTo(self.likeButton);
    }];
}

//点击事件
- (void)buttonClick:(UIButton *)button {
    
}

+ (MidDrawerFindArticleTableViewCell *)createCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    MidDrawerFindArticleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MidDrawerFindArticleTableViewCellID" forIndexPath:indexPath];
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
        _nameLabel = [UILabel createLabelWithText:@"华纳音乐国际" font:NORMAL_FONT textColor:BLACK_TEXTCOLOR];
    }
    return _nameLabel;
}

- (UILabel *)typeLabel {
    if (!_typeLabel) {
        _typeLabel = [UILabel createLabelWithText:@"发布文章" font:SMALL_FONT textColor:GRAY_TEXTCOLOR];
    }
    return _typeLabel;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel createLabelWithText:@"纳纳圆梦～请你们去首尔看MXM的演唱会！！" font:BIG_FONT textColor:BLACK_TEXTCOLOR];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [UILabel createLabelWithText:@"福利又来了！这两个鲜肉boy，把粉丝比喻成钻石女孩！到底是谁这么温暖？是我们MXM！！听MXMX精选电台。" font:NORMAL_FONT textColor:GRAY_TEXTCOLOR];
        _subTitleLabel.numberOfLines = 3;
    }
    return _subTitleLabel;
}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView createImageViewWithImg:@""];
        _imgView.backgroundColor = SECTION_BACKGROUNDCOLOR;
    }
    return _imgView;
}

- (UILabel *)recommendTypeLabel {
    if (!_recommendTypeLabel) {
        _recommendTypeLabel = [UILabel createLabelWithText:@"最新推荐" font:SMALL_FONT textColor:MAIN_COLOR];
    }
    return _recommendTypeLabel;
}

- (UIButton *)commentButton {
    if (!_commentButton) {
        _commentButton = [UIButton createButtonWithTarget:self action:@selector(buttonClick:) title:@"8" textColor:GRAY_TEXTCOLOR imgStr:@""];
        _commentButton.titleLabel.font = SMALL_FONT;
    }
    return _commentButton;
}

- (UIButton *)likeButton {
    if (!_likeButton) {
        _likeButton = [UIButton createButtonWithTarget:self action:@selector(buttonClick:) title:@"8" textColor:GRAY_TEXTCOLOR imgStr:@""];
        _likeButton.titleLabel.font = SMALL_FONT;
    }
    return _likeButton;
}

@end
