//
//  MidDrawerMineTableViewCell.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/8/31.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerMineTableViewCell.h"

@interface MidDrawerMineTableViewCell ()

///歌单图片
@property (nonatomic, strong) UIImageView *imgView;
///主标题
@property (nonatomic, strong) UILabel *titleLabel;
///箭头
@property (nonatomic, strong) UIImageView *arrow;

@end

@implementation MidDrawerMineTableViewCell

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
    
    [self.contentView addSubview:self.arrow];
    
    [self addConstraints];
}

- (void)addConstraints {
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(fontSizeScale(10));
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(self.bounds.size.height-2, self.bounds.size.height-2));
    }];
    
    UIImageView *add = [UIImageView createImageViewWithImg:@"添加歌单"];
    [self.imgView addSubview:add];
    [add mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(12), fontSizeScale(12)));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imgView.mas_right).offset(fontSizeScale(10));
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(self.bounds.size.width/2);
    }];
    
    [self.arrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-fontSizeScale(10));
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(14), fontSizeScale(14)));
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

+ (MidDrawerMineTableViewCell *)createCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    MidDrawerMineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MidDrawerMineTableViewCellID" forIndexPath:indexPath];
    if (!cell) {
        NSLog(@"创建cell失败！");
    }
    return cell;
}

#pragma mark Lazy
- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView createImageViewWithImg:nil];
        _imgView.backgroundColor = LINE_COLOR;
    }
    return _imgView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel createLabelWithText:@"" font:NORMAL_FONT textColor:BLACK_TEXTCOLOR];
    }
    return _titleLabel;
}

- (UIImageView *)arrow {
    if (!_arrow) {
        _arrow = [UIImageView createImageViewWithImg:@"rightArrow"];
    }
    return _arrow;
}

@end
