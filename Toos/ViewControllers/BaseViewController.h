//
//  BaseViewController.h
//  Vodka
//
//  Created by Mark C.J. on 15-1-13.
//  Copyright (c) 2015年 Beijing Beast Technology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

//#import "DDLogCommon.h"
//#import "EmptyView.h"                   ///空视图.
//#import "ProgressHUD.h"

#import "GlobalDefinition.h"
//#import "CodeFragments.h"
#import <Masonry.h>

@interface BaseViewController : UIViewController

@property (nonatomic, retain) UIView *networkInavailableView;
@property (nonatomic, assign) BOOL navigationBarTransparent;
//@property (nonatomic, strong) EmptyView *emptyView;                //没有内容的时候的view.

@end
