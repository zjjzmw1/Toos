//
//  TestBaseVC.m
//  Toos
//
//  Created by xiaoming on 15/12/28.
//  Copyright © 2015年 shandandan. All rights reserved.
//

#import "TestBaseVC.h"
#import "IOSUtils.h"

@implementation TestBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"首页";
    
    [self leftButtonWithName:@"返回" image:nil];
    [self rightButtonWithName:@"编辑" image:nil];
    
    
}

@end
