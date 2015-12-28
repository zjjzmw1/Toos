//
//  BaseViewController.m
//  Vodka
//
//  Created by Mark C.J. on 15-1-13.
//  Copyright (c) 2015年 Beijing Beast Technology Co.,Ltd. All rights reserved.
//

#import "BaseViewController.h"
#import "IOSUtilsConfig.h"
#import "UIColor+IOSUtils.h"
#import "UIView+Utils.h"


@interface BaseViewController () {
    
}

@end

@implementation BaseViewController


-(instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorFromHexString:@"333436"];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (_emptyView == nil) {//尽量在后面加加入，不容易被子视图的view覆盖了
        self.emptyView = [[EmptyView alloc]initWithFrame:CGRectMake(0, self.view.top, kScreenWidth, kScreenHeight - kNavigationBarHeight)];
        [self.view addSubview:self.emptyView];
        self.emptyView.backgroundColor = [UIColor colorFromHexString:@"#181818"];
        self.emptyView.hidden = YES;///暂时隐藏。
    }
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
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
