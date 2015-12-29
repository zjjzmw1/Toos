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
@implementation TestBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"首页";
    
    [self leftButtonWithName:@"返回" image:nil];
    [self rightButtonWithName:@"编辑" image:nil];
    
    [self nextBackTitle:@""];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    SecondViewController *detailVC = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:detailVC animated:YES];
}


@end
