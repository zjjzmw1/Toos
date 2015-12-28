//
//  BaseViewController.h
//  Vodka
//
//  Created by Mark C.J. on 15-1-13.
//  Copyright (c) 2015年 Beijing Beast Technology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "EmptyView.h"                   ///空视图.

@interface BaseViewController : UIViewController

@property (strong, nonatomic) EmptyView *emptyView;                //没有内容的时候的view.

@end
