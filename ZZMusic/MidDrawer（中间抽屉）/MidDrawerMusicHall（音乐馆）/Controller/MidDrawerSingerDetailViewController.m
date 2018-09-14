//
//  MidDrawerSingerDetailViewController.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/14.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "MidDrawerSingerDetailViewController.h"
#import "MidDrawerSingerDetailView.h"

@interface MidDrawerSingerDetailViewController ()<UINavigationControllerDelegate, MidDrawerSingerDetailViewDelegate>

@property (nonatomic, strong) MidDrawerSingerDetailView *singerDetailView;
///stretchHeaderView
@property (nonatomic, strong) ZZMusicStretchHeaderView *strecthHeaderView;
///strecthImgView
@property (nonatomic, strong) UIImageView *stretchImgView;

@end

@implementation MidDrawerSingerDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setPage];
}

- (void)setPage {
    self.navigationController.delegate = self;
    
    [self.view addSubview:self.stretchImgView];
    self.strecthHeaderView = [[ZZMusicStretchHeaderView alloc] initWithStretchView:self.stretchImgView];
    
    [self.view addSubview:self.singerDetailView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark MidDrawerSingerDetailViewDelegate
- (void)MidDrawerSingerDetailViewScrollViewDidScroll:(UIScrollView *)scrollView {
    [self.strecthHeaderView scrollViewDidScrollWithScrollView:scrollView];
}

#pragma mark UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    return [self.navigationController setNavigationBarHidden:[viewController isKindOfClass:[self class]] animated:YES];
}

#pragma mark Lazy
- (MidDrawerSingerDetailView *)singerDetailView {
    if (!_singerDetailView) {
        _singerDetailView = [[MidDrawerSingerDetailView alloc] initWithFrame:CGRectMake(0, -STATUS_BAR_HEIGHT, self.view.bounds.size.width, self.view.bounds.size.height)];
        _singerDetailView.delegate = self;
    }
    return _singerDetailView;
}

- (UIImageView *)stretchImgView {
    if (!_stretchImgView) {
        _stretchImgView = [UIImageView createImageViewWithImg:@""];
        [_stretchImgView sd_setImageWithURL:[NSURL URLWithString:BANNER_IMAGEPATH_FIRST] placeholderImage:PLACEHOLDER_IMAGE];
        _stretchImgView.frame = CGRectMake(0, -STATUS_BAR_HEIGHT, self.view.bounds.size.width, SINGERDETAIL_HEADERVIEW_HEIGHT);
    }
    return _stretchImgView;
}

@end
