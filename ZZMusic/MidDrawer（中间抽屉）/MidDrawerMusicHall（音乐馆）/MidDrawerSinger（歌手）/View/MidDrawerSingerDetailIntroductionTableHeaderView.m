//
//  MidDrawerSingerDetailIntroductionTableHeaderView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/20.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerSingerDetailIntroductionTableHeaderView.h"

@interface MidDrawerSingerDetailIntroductionTableHeaderView ()

///titleLabel
@property (nonatomic, strong) UILabel *titleLabel;
///singerProfile
@property (nonatomic, strong) UIButton *singerProfileButton;

@end

@implementation MidDrawerSingerDetailIntroductionTableHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    [self addSubview:self.titleLabel];
    
    [self addSubview:self.singerProfileButton];
    
    [self addConstraints];
}

//添加约束
- (void)addConstraints {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(fontSizeScale(10), fontSizeScale(10), fontSizeScale(30), fontSizeScale(10)));
    }];
    
    [self.singerProfileButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom);
        make.left.right.bottom.mas_equalTo(0);
    }];
}

//点击事件
- (void)buttonClick {
    
}

#pragma mark Lazy
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel createLabelWithText:@"周杰伦（Jay Chou），1979年1月18日出生于台湾省新北市，中国台湾流行乐男歌手、音乐人、演员、导演、编剧、监制、商人。 2000年发行首张个人专辑《Jay》。2001年发行的专辑《范特西》奠定其融合中西方音乐的风格 [1]  。2002年举行“The One”世界巡回演唱会 [2]  。2003年成为美国《时代周刊》封面人物 [3-4]  。2004年获得世界音乐大奖中国区最畅销艺人奖 [5]  。2005年凭借动作片《头文字D》获得台湾电影金马奖、香港电影金像奖最佳新人奖 [6]  。2006年起连续三年获得世界音乐大奖中国区最畅销艺人奖 [7]  。2007年自编自导的文艺片《不能说的秘密》获得台湾电影金马奖年度台湾杰出电影奖 [8]  。 2008年凭借歌曲《青花瓷》获得第19届金曲奖最佳作曲人奖 [9]  。2009年入选美国CNN评出的“25位亚洲最具影响力的人物”[10]  ；同年凭借专辑《魔杰座》获得第20届金曲奖最佳国语男歌手奖 [11]  。2010年入选美国《Fast Company》评出的“全球百大创意人物” [12]  。2011年凭借专辑《跨时代》再度获得金曲奖最佳国语男歌手奖，并且第4次获得金曲奖最佳国语专辑奖 [13] ；同年主演好莱坞电影《青蜂侠》 [14]  。2012年登福布斯中国名人榜榜首 [15]  。2014年发行华语乐坛首张数字音乐专辑《哎呦，不错哦》 [16]  。2018年举行“地表最强2世界巡回演唱会” [17]  。 演艺事业外，他还涉足商业、设计等领域。2007年成立杰威尔有限公司 [18]  。2011年担任华硕笔电设计师并入股香港文化传信集团 [19-20]  。 周杰伦热心公益慈善，多次向中国内地灾区捐款捐物。2008年捐款援建希望小学 [21]  。2014年担任中国禁毒宣传形象大使[22]  。" font:NORMAL_FONT textColor:GRAY_TEXTCOLOR];
        _titleLabel.numberOfLines = 4;
    }
    return _titleLabel;
}

- (UIButton *)singerProfileButton {
    if (!_singerProfileButton) {
        _singerProfileButton = [UIButton createButtonWithTarget:self action:@selector(buttonClick) title:@"完整歌手资料" textColor:MAIN_COLOR imgStr:@"rightArrow绿色"];
        _singerProfileButton.titleLabel.font = NORMAL_FONT;
        [_singerProfileButton setImageToRightWithSize:CGSizeMake(self.bounds.size.width, fontSizeScale(30))];
    }
    return _singerProfileButton;
}

@end
