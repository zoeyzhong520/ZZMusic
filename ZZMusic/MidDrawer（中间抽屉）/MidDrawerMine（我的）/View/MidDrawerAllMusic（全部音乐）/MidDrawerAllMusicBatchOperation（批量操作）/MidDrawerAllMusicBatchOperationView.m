//
//  MidDrawerAllMusicBatchOperationView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/11.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerAllMusicBatchOperationView.h"
#import "MidDrawerAllMusicBatchOperationBottomMenu.h"
#import "MidDrawerAllMusicBatchOperationTableViewCell.h"

@interface MidDrawerAllMusicBatchOperationView ()<UITableViewDelegate, UITableViewDataSource>

///全选（全不选）
@property (nonatomic, strong) UIButton *selectAllButton;
///标题title
@property (nonatomic, strong) UILabel *titleLabel;
///关闭
@property (nonatomic, strong) UIButton *closeButton;
///bottomMenu底部菜单
@property (nonatomic, strong) MidDrawerAllMusicBatchOperationBottomMenu *bottomMenu;
///tableView
@property (nonatomic, strong) UITableView *tableView;
///数据源
@property (nonatomic, strong) NSMutableArray *dataArray;
///被删除的数据
@property (nonatomic, strong) NSMutableArray *deleteArray;
///contentView
@property (nonatomic, strong) UIView *contentView;

@end

@implementation MidDrawerAllMusicBatchOperationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    if (!_contentView) {
        _contentView = [UIView createViewWithBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_contentView];
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(self.mas_bottom);
            make.height.mas_equalTo(SCREEN_HEIGHT);
        }];
        
        [self configContentView];
    }
}

- (void)configContentView {
    [_contentView addSubview:self.selectAllButton];
    
    [_contentView addSubview:self.titleLabel];
    
    [_contentView addSubview:self.closeButton];
    
    [_contentView addSubview:self.tableView];
    
    [_contentView addSubview:self.bottomMenu];
    
    [self addConstraints];
}

//添加约束
- (void)addConstraints {
    [self.selectAllButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(STATUS_BAR_HEIGHT);
        make.left.mas_equalTo(fontSizeScale(5));
        make.size.mas_equalTo(CGSizeMake(fontSizeScale(48), fontSizeScale(48)));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(self.selectAllButton);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH/2, fontSizeScale(16)));
    }];
    
    [self.closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-fontSizeScale(5));
        make.size.centerY.mas_equalTo(self.selectAllButton);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(STATUS_BAR_HEIGHT+NAVIGATION_BAR_HEIGHT);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-SEARCHBAR_HEIGHT-fontSizeScale(15));
    }];
    
    [self.bottomMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(SEARCHBAR_HEIGHT+fontSizeScale(15));
    }];
}

//点击事件
- (void)buttonClick:(UIButton *)button {
    if (button.tag == 0) {//全选（全不选）
        _selectAllButton.selected = !button.selected;
        self.titleLabel.text = button.selected ? [NSString stringWithFormat:@"已选定%ld首", self.dataArray.count] : @"批量操作";
        self.bottomMenu.isEnable = button.selected;
        if (_selectAllButton.selected) {
            for (int i = 0; i < self.dataArray.count; i ++) {
                [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0] animated:NO scrollPosition:UITableViewScrollPositionBottom];
            }
            [self.deleteArray addObjectsFromArray:self.dataArray];
        } else {
            [self.deleteArray removeAllObjects];
            for (int i = 0; i < self.dataArray.count; i ++) {
                [self.tableView deselectRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0] animated:NO];
            }
        }
        
    } else if (button.tag == 1) {//关闭
        [self hide];
    }
}

//显示
- (void)show {
    _contentView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:ANIMATE_DURATION animations:^{
        [ZZKEYWINDOW addSubview:self];
        self.contentView.transform = CGAffineTransformMakeTranslation(0, -SCREEN_HEIGHT);
    } completion:nil];
}

//隐藏
- (void)hide {
    _contentView.transform = CGAffineTransformMakeTranslation(0, -SCREEN_HEIGHT);
    [UIView animateWithDuration:ANIMATE_DURATION animations:^{
        self.contentView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MidDrawerAllMusicBatchOperationTableViewCell *cell = [MidDrawerAllMusicBatchOperationTableViewCell createCellWithTableView:tableView indexPath:indexPath];
    cell.tintColor = MAIN_COLOR;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!tableView.isEditing) {//非编辑状态
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
    } else {//编辑状态
        [self.deleteArray addObject:self.dataArray[indexPath.row]];
        self.titleLabel.text = self.deleteArray.count > 0 ? [NSString stringWithFormat:@"已选定%ld首", self.deleteArray.count] : @"批量操作";
        self.bottomMenu.isEnable = self.deleteArray.count > 0;
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.deleteArray removeObject:self.dataArray[indexPath.row]];
    self.titleLabel.text = self.deleteArray.count > 0 ? [NSString stringWithFormat:@"已选定%ld首", self.deleteArray.count] : @"批量操作";
    self.bottomMenu.isEnable = self.deleteArray.count > 0;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
}

#pragma mark Lazy
- (UIButton *)selectAllButton {
    if (!_selectAllButton) {
        _selectAllButton = [UIButton createButtonWithTarget:self action:@selector(buttonClick:) title:@"全选" textColor:BLACK_TEXTCOLOR imgStr:nil];
        _selectAllButton.titleLabel.font = NORMAL_FONT;
        [_selectAllButton setTitle:@"全不选" forState:UIControlStateSelected];
        _selectAllButton.tag = 0;
    }
    return _selectAllButton;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel createLabelWithText:@"批量操作" font:BIG_FONT textColor:BLACK_TEXTCOLOR];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UIButton *)closeButton {
    if (!_closeButton) {
        _closeButton = [UIButton createButtonWithTarget:self action:@selector(buttonClick:) title:@"关闭" textColor:BLACK_TEXTCOLOR imgStr:nil];
        _closeButton.titleLabel.font = NORMAL_FONT;
        _closeButton.tag = 1;
    }
    return _closeButton;
}

- (UIView *)bottomMenu {
    if (!_bottomMenu) {
        _bottomMenu = [[MidDrawerAllMusicBatchOperationBottomMenu alloc] initWithFrame:CGRectMake(0, self.bounds.size.height-SEARCHBAR_HEIGHT, self.bounds.size.width, SEARCHBAR_HEIGHT+fontSizeScale(15))];
    }
    return _bottomMenu;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.rowHeight = fontSizeScale(50);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.editing = YES;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[MidDrawerAllMusicBatchOperationTableViewCell class] forCellReuseIdentifier:@"MidDrawerAllMusicBatchOperationTableViewCellID"];
    }
    return _tableView;
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:0];
        for (int i = 0; i < 40; i ++) {
            [_dataArray addObject:@(i)];
        }
    }
    return _dataArray;
}

- (NSMutableArray *)deleteArray {
    if (!_deleteArray) {
        _deleteArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _deleteArray;
}

@end
