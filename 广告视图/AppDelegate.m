//
//  AppDelegate.m
//  ZKADviewDemo
//
//  Created by 张日奎 on 16/12/28.
//  Copyright © 2016年 bestdew. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ZKADView.h"

@interface AppDelegate () <ZKADViewDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[ViewController alloc] init];
    [self.window makeKeyAndVisible];
    
    /** 添加广告页 */
    [self addADView];
    
    /** 获取广告图URL */
    [self getADImageURL];
    
    return YES;
}

- (void)addADView
{
    ZKADView *adView = [[ZKADView alloc] init];
    
    adView.tag = 100;
    adView.duration = 5;
    adView.waitTime = 5;
    adView.skipType = SkipButtonTypeTimeAndText;
    adView.options = ZKWebImageOptionDefault;
    adView.delegate = self;
    
    // 必须先将adView添加到父视图上才能调用 reloadDataWithURL: 方法加载广告图
    [self.window addSubview:adView];
}

- (void)getADImageURL
{
    // 此处推荐使用tag来获取adView，勿使用全局变量。因为在AppDelegate中将其设为全局变量时，不会被释放
    ZKADView *adView = (ZKADView *)[self.window viewWithTag:100];
    
    // 模拟从服务器上获取广告图URL
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSString *urlString = @"http://c.hiphotos.baidu.com/image/pic/item/d62a6059252dd42a6a943c180b3b5bb5c8eab8e7.jpg";
        
        [adView reloadDataWithURL:[NSURL URLWithString:urlString]]; // 加载广告图
    });
}

#pragma mark -- ZKADView Delegate
- (void)adImageLoadFinish:(ZKADView *)adView image:(UIImage *)image
{
    NSLog(@"%@", image);
}

- (void)adImageDidClick:(ZKADView *)adView
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://baidu.com"]
                                       options:@{}
                             completionHandler:nil];
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


@end
