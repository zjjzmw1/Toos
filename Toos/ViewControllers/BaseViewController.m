//
//  BaseViewController.m
//  Vodka
//
//  Created by Mark C.J. on 15-1-13.
//  Copyright (c) 2015年 Beijing Beast Technology Co.,Ltd. All rights reserved.
//

#import "BaseViewController.h"
#import "GlobalDefinition.h"
#import "UIColor+IOSUtils.h"
#import "UIView+Utils.h"

//#import "ProgressHUD.h"

@interface BaseViewController () {
    UIImage *navigationBarDefaultBackgroundImage;   // 默认背景色
    UIImage *navigationBarDefaultShadowImage;       // 默认阴影颜色
}

@end

@implementation BaseViewController

@synthesize networkInavailableView;
@synthesize navigationBarTransparent;

-(instancetype)init {
    self = [super init];
    if (self) {
        self.navigationBarTransparent = NO;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"";
        self.tabBarItem.image = nil;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    if (self.view) {
        self.view.backgroundColor = [UIColor colorFromHexString:@"333436"];
        
        if (networkInavailableView == nil) {
            networkInavailableView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 202, 124)];
            networkInavailableView.backgroundColor = [UIColor clearColor];
            UIImageView *ivTip = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 202, 124)];
            ivTip.image = [UIImage imageNamed:@"bad_network_please_check_setting"];
            networkInavailableView.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2-50);
            [networkInavailableView addSubview:ivTip];
            [self.view addSubview:networkInavailableView];
            self.networkInavailableView.hidden = YES;
        }

//        if (_emptyView == nil) {
//            self.emptyView = [[EmptyView alloc]initWithFrame:CGRectMake(0, self.view.top, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
//            [self.view addSubview:self.emptyView];
//            self.emptyView.backgroundColor = [UIColor colorFromHexString:@"#181818"];
//            self.emptyView.hidden = YES;///暂时隐藏。
//        }
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (navigationBarTransparent) {
        navigationBarDefaultBackgroundImage = [self.navigationController.navigationBar backgroundImageForBarMetrics:UIBarMetricsDefault];
        navigationBarDefaultShadowImage = [self.navigationController.navigationBar shadowImage];
        //     NavigationBar 设置为透明
        [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                      forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.shadowImage = [UIImage new];
    }
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (navigationBarTransparent) {
        // 还原NavigationBar样式
        [self.navigationController.navigationBar setBackgroundImage:navigationBarDefaultBackgroundImage
                                                      forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.shadowImage = navigationBarDefaultShadowImage;
    }
    
//    [ProgressHUD dismiss];
}



#pragma mark - 重新返回按钮
//- (void)initializationBackButton{
//    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button setFrame:CGRectMake(0, 0, 60, 44)];
//    
//    [button setImage:[UIImage imageNamed:@"back_bt_image"] forState:UIControlStateNormal];
//    [button setImage:[UIImage imageNamed:@"back_bt_image"] forState:UIControlStateHighlighted];
//    [button setContentEdgeInsets:UIEdgeInsetsMake(0, -12, 0, 50)];
//    __weak typeof(self) wSelf = self;
//    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
//        [bkTextView resignFirstResponder];
//        if (self.imageArray.count > 0 || [NSString isEmptyString:[Tooles removeAllBlank:bkTextView.text]] || [NSString isEmptyString:singleton.sportIdentify]) {
//            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:NSLocalizedString(@"确定退出编辑？", @"") delegate:nil cancelButtonTitle:NSLocalizedString(@"取消",@"") otherButtonTitles:NSLocalizedString(@"确定", @""), nil];
//            [[alert rac_buttonClickedSignal] subscribeNext:^(id x) {
//                if([x integerValue] == 1){
//                    [wSelf.navigationController popViewControllerAnimated:YES];
//                }
//            }];
//            [alert show];
//        }else{
//            [wSelf.navigationController popViewControllerAnimated:YES];
//        }
//    }];
//    
//    UIBarButtonItem* leftItem = [[UIBarButtonItem alloc] initWithCustomView:button];
//    self.navigationItem.leftBarButtonItem = leftItem;
//}
@end
