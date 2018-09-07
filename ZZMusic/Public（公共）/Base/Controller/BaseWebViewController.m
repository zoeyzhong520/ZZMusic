//
//  BaseWebViewController.m
//  ZZMusic
//
//  Created by zhifu360 on 2018/9/7.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "BaseWebViewController.h"
#import <WebKit/WebKit.h>

NSString * const BAIDU_URL = @"https://www.baidu.com/";

@interface BaseWebViewController ()<WKNavigationDelegate>

///WKWebView
@property (nonatomic, strong) WKWebView *webView;

@end

@implementation BaseWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setPage];
}

- (void)setPage {
    [self.view addSubview:self.webView];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString && self.urlString.length > 0 ? self.urlString : BAIDU_URL]]];
    [self.webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [self.webView removeObserver:self forKeyPath:@"title"];
}

#pragma mark KVO的监听代理
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"title"]) {
        if (object == self.webView) {
            self.title = self.webView.title;
        } else {
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark WKNavigationDelegate
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    [SVProgressHUD show];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [SVProgressHUD dismiss];
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"error = %@", error.localizedDescription);
}

#pragma mark Lazy
- (WKWebView *)webView {
    if (!_webView) {
        WKWebViewConfiguration *config = [WKWebViewConfiguration new];
        _webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
        _webView.navigationDelegate = self;
    }
    return _webView;
}

@end
