//
//  TestBaseVC.m
//  Toos
//
//  Created by xiaoming on 15/12/28.
//  Copyright © 2015年 shandandan. All rights reserved.
//

#import "TestBaseVC.h"
#import "IOSUtils.h"

#import "SecondViewController.h"
#import "MyReactiveCocoaViewController.h"       //学习RectiveCocoa的demo
@implementation TestBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"首页";
    
    [self leftButtonWithName:@"返回" image:nil];
    [self rightButtonWithName:@"提交" image:nil block:nil];
//    [self rightButtonWithName:@"提交" image:nil block:^(UIButton *btn) {
//        SecondViewController *detailVC = [[SecondViewController alloc]init];
//        [self.navigationController pushViewController:detailVC animated:YES];
//    }];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    MyReactiveCocoaViewController *detailVC = [[MyReactiveCocoaViewController alloc]init];
//    [self.navigationController pushViewController:detailVC animated:YES];
    
    SecondViewController *detailVC = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:detailVC animated:YES];
}


@end
