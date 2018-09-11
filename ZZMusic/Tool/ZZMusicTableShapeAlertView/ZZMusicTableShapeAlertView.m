//
//  ZZMusicTableShapeAlertView.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/10.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "ZZMusicTableShapeAlertView.h"

@interface ZZMusicTableShapeAlertView ()<UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate>

///按钮标题
@property (nonatomic, strong) NSArray *buttons;
///TableView
@property (nonatomic, strong) UITableView *tableView;
///contentView
@property (nonatomic, strong) UIView *contentView;

@end

@implementation ZZMusicTableShapeAlertView

- (instancetype)initWithButtons:(NSArray *)buttons
{
    self = [super init];
    if (self) {
        self.buttons = buttons;
        [self createView];
    }
    return self;
}

- (void)createView {
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.backgroundColor = MONGOLIANLAYER_COLOR;
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
    tapGes.delegate = self;
    [self addGestureRecognizer:tapGes];
    
    if (self.contentView == nil) {
        _contentView = [UIView createViewWithBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_contentView];
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(self.mas_bottom);
            make.height.mas_equalTo(fontSizeScale(50)*self.buttons.count);
        }];
        
        [self configContentView];
    }
}

//config contentView
- (void)configContentView {
    [_contentView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView);
    }];
    [self.tableView reloadData];
}

//显示
- (void)show {
    self.alpha = 0.0;
    _contentView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:ANIMATE_DURATION delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:10 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.alpha = 1.0;
        [ZZKEYWINDOW addSubview:self];
        self.contentView.transform = CGAffineTransformMakeTranslation(0, -fontSizeScale(50)*self.buttons.count);
    } completion:nil];
}

//隐藏
- (void)hide {
    self.alpha = 1.0;
    _contentView.transform = CGAffineTransformMakeTranslation(0, -fontSizeScale(50)*self.buttons.count);
    [UIView animateWithDuration:ANIMATE_DURATION delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.alpha = 0.0;
        self.contentView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

//设置Block
- (void)createBlock:(NSInteger)index {
    if (self.clickBlock) {
        self.clickBlock(index);
    }
}

#pragma mark UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.buttons.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor = BLACK_TEXTCOLOR;
    cell.textLabel.font = NORMAL_FONT;
    cell.textLabel.text = self.buttons[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self createBlock:indexPath.row];
    [self hide];
}

#pragma mark UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return !([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]);
}

#pragma mark Lazy
- (NSArray *)buttons {
    if (!_buttons) {
        _buttons = [NSArray array];
    }
    return _buttons;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.rowHeight = fontSizeScale(50);
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.scrollEnabled = NO;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    }
    return _tableView;
}

@end
