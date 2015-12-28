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
#import "NSString+IOSUtils.h"

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



#pragma mark - 左边的按钮
- (void)leftButtonWithName:(NSString *)name image:(NSString *)imageString{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, 70, 44)];
//    button.backgroundColor = [UIColor blueColor];
    if (![imageString isEmptyString]) {
        [button setImage:[UIImage imageNamed:@"navigator_btn_back"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigator_btn_back"] forState:UIControlStateHighlighted];
    }
    
    [button setTitle:name forState:UIControlStateNormal];
    [button setTitle:name forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    
    [button addTarget:self action:@selector(leftAction:) forControlEvents:UIControlEventTouchUpInside];
    
//    [button setContentEdgeInsets:UIEdgeInsetsMake(0, -12, 0, 50)];
    
    UIBarButtonItem* leftItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -18;
    self.navigationItem.leftBarButtonItems = @[negativeSpacer, leftItem];
    
}
#pragma mark 左边按钮的点击方法
-(void)leftAction:(UIButton *)button {
    
}

#pragma mark - 左边的按钮
- (void)rightButtonWithName:(NSString *)name image:(NSString *)imageString{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, 70, 44)];
//    button.backgroundColor = [UIColor blueColor];

    if (![imageString isEmptyString]) {
        [button setImage:[UIImage imageNamed:imageString] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:imageString] forState:UIControlStateHighlighted];
    }
    
    [button setTitle:name forState:UIControlStateNormal];
    [button setTitle:name forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    
    [button addTarget:self action:@selector(rightAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = rightItem;
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -18;
    self.navigationItem.rightBarButtonItems = @[negativeSpacer, rightItem];
}
#pragma mark 左边按钮的点击方法
-(void)rightAction:(UIButton *)button {
    button.titleLabel.font = [UIFont systemFontOfSize:16];//可以用。
}



#pragma mark - 下面是准备写下常用的 rac 的方法的demo

//__weak typeof(self) wSelf = self;
//[[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
//    [bkTextView resignFirstResponder];
//    if (self.imageArray.count > 0 || [NSString isEmptyString:[Tooles removeAllBlank:bkTextView.text]] || [NSString isEmptyString:singleton.sportIdentify]) {
//        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:NSLocalizedString(@"确定退出编辑？", @"") delegate:nil cancelButtonTitle:NSLocalizedString(@"取消",@"") otherButtonTitles:NSLocalizedString(@"确定", @""), nil];
//        [[alert rac_buttonClickedSignal] subscribeNext:^(id x) {
//            if([x integerValue] == 1){
//                [wSelf.navigationController popViewControllerAnimated:YES];
//            }
//        }];
//        [alert show];
//    }else{
//        [wSelf.navigationController popViewControllerAnimated:YES];
//    }
//}];




@end
