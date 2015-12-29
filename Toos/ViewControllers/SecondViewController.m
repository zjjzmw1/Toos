//
//  SecondViewController.m
//  Toos
//
//  Created by xiaoming on 15/12/29.
//  Copyright © 2015年 shandandan. All rights reserved.
//

#import "SecondViewController.h"

#import <ReactiveCocoa/ReactiveCocoa.h>         //各种方便的block封装

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"第二个页面";
    
//    [self leftButtonWithName:@"返回1" image:nil];
    [self rightButtonWithName:@"编辑" image:nil];
//    [self nextBackTitle:@""];
    
    //各种方便的block封装  ReactiveCocoa
    [self reactiveCocoaAction];
}

-(void)leftAction:(UIButton *)button {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 各种方便的block封装  ReactiveCocoa

-(void)reactiveCocoaAction{
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"log_out" object:nil] subscribeNext:^(id x) {//x是object 传的值。一般不传。
        //退出登录的通知。---"log_out"是自定义的
    }];
    
    //退出登录后执行。。。。上面的通知方法就可以触发了。
    [[NSNotificationCenter defaultCenter]postNotificationName:@"log_out" object:nil];//object可以传值，一般都不传。
    
    
    
}

@end




















































