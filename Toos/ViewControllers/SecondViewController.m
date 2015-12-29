//
//  SecondViewController.m
//  Toos
//
//  Created by xiaoming on 15/12/29.
//  Copyright © 2015年 shandandan. All rights reserved.
//

#import "SecondViewController.h"

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"第二个页面";
    
//    [self leftButtonWithName:@"返回1" image:nil];
    [self rightButtonWithName:@"编辑" image:nil];
//    [self nextBackTitle:@""];
    
    
}

-(void)leftAction:(UIButton *)button {
    [self.navigationController popViewControllerAnimated:YES];
}


@end




















































