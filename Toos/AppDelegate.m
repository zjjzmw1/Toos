//
//  AppDelegate.m
//  Toos
//
//  Created by xiaoming on 15/12/12.
//  Copyright © 2015年 shandandan. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseViewController.h"
#import "MyTableViewController.h"       //ImageCache---YYCache测试。

#import <CoreLocation/CoreLocation.h>   //定位用的

#import "IOSUtils.h"                    //通用的方法测试。
#import "TestBaseVC.h"                  //测试跟视图
@interface AppDelegate ()<CLLocationManagerDelegate>
{
    CLLocationManager *_locationManager;

}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor blueColor];
    [self.window makeKeyAndVisible];
    
    //测试跟视图
    [self testBaseAction];
    
    
    
    //test----ImageCache---YYCache测试
//    [self imageCacheWithYYCacthAction];
    
    //test -----定位
//    [self testLocationAction];
    
    //测试 IOSUtils里面的方法
//    [self testIOSUtilsAction];
    
    
    
    return YES;
}

#pragma mark - baseVC的测试
-(void)baseAction {
    BaseViewController *detailVC = [[BaseViewController alloc]init];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:detailVC];
    self.window.rootViewController = navi;
}

#pragma mark - ImageCache---YYCache测试
-(void)imageCacheWithYYCacthAction {
    singleton = [Singleton sharedInstance];
    singleton.testAge = 10;
    singleton.testName = @"xiaoming";
    
    MyTableViewController *detailVC = [[MyTableViewController alloc]init];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:detailVC];
    self.window.rootViewController = navi;
}

#pragma mark - 测试定位-蓝条。
-(void)testLocationAction{
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.pausesLocationUpdatesAutomatically = NO;   // 该值默认为YES，设置为NO，保持定位更新
    //    if(IS_IOS8) {
                [_locationManager requestAlwaysAuthorization];
//    [_locationManager requestWhenInUseAuthorization];
    //    }
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [_locationManager startUpdatingHeading];
    [_locationManager startUpdatingLocation];
}

#pragma mark - 测试 IOSUtils里面的方法
-(void)testIOSUtilsAction{
    
    [self.window setTapActionWithBlock:^{
        NSLog(@"点击了window");
    }];
    
    [self.window setLongPressActionWithBlock:^{
        NSLog(@"长按了window");
    }];
}
#pragma mark 测试 跟视图
-(void)testBaseAction{
    TestBaseVC *detailVC = [[TestBaseVC alloc]init];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:detailVC];
    self.window.rootViewController = navi;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [_locationManager stopUpdatingLocation];//有这句话就可以取消蓝条。。。。。
    [_locationManager stopUpdatingHeading];
    
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
