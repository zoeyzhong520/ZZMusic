//
//  AppDelegate.m
//  ZZMusic
//
//  Created by 仲召俊 on 2018/8/26.
//  Copyright © 2018年 zhognzhaojun. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

@interface AppDelegate ()

@property (nonatomic, assign) CGFloat fontSize;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //自适应不同屏幕尺寸的字体大小
    [self fontSizeScale];
    
    [self setRootViewController];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - fontSizeScale
- (void)fontSizeScale {
    if (iPhone7P) {
        self.fontSize = 1.1;
    } else if (iPhone7 || iPhoneX) {
        self.fontSize = 1.0;
    } else if (iPhoneSE) {
        self.fontSize = 0.9;
    } else if (iPhone4s) {
        self.fontSize = 0.7;
    } else {
        self.fontSize = 1.5;
    }
}

- (CGFloat)fontSizeScale:(CGFloat)scale {
    return scale * self.fontSize;
}

#pragma mark - init RootViewController
- (void)setRootViewController {
    self.window = [[UIWindow alloc] initWithFrame:SCREEN_RECT];
    RootViewController *rootVC = [[RootViewController alloc] init];
    LeftDrawerViewController *leftDrawerVC = [[LeftDrawerViewController alloc] init];
    MidDrawerViewController *midDrawerVC = [[MidDrawerViewController alloc] init];
    rootVC.leftDrawerView = leftDrawerVC;
    rootVC.midDrawerView = midDrawerVC;
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:rootVC];;
    [self.window makeKeyAndVisible];
}

@end
