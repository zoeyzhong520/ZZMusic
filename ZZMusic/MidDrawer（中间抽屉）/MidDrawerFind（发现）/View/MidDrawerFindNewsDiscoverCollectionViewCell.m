//
//  MidDrawerFindNewsDiscoverCollectionViewCell.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/6.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerFindNewsDiscoverCollectionViewCell.h"

@interface MidDrawerFindNewsDiscoverCollectionViewCell ()

///imgView
@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation MidDrawerFindNewsDiscoverCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    [self.contentView addSubview:self.imgView];
    
    [self addConstraints];
}

//添加约束
- (void)addConstraints {
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

+ (MidDrawerFindNewsDiscoverCollectionViewCell *)createCellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    
    MidDrawerFindNewsDiscoverCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MidDrawerFindNewsDiscoverCollectionViewCellID" forIndexPath:indexPath];
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

@end

