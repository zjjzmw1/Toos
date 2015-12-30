//
//  MyReactiveCocoaViewController.m
//  Toos
//
//  Created by xiaoming on 15/12/29.
//  Copyright © 2015年 shandandan. All rights reserved.
//

#import "MyReactiveCocoaViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>         //ReactiveCocoa
#import "MyReactiveCocoaModel.h"
#import "IOSUtils.h"

@interface MyReactiveCocoaViewController()

@property(nonatomic, strong) MyReactiveCocoaModel *viewModel;

@property(nonatomic, strong) UITextField *emailTextField;
@property(nonatomic, strong) UIButton *subscribeButton;
@property(nonatomic, strong) UILabel *statusLabel;

@end
@implementation MyReactiveCocoaViewController

- (id)init {
    self = [super init];
    if (self) {
        self.viewModel = [[MyReactiveCocoaModel alloc]init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Reactive 学习";
    
    [self addViews];
    [self defineLayout];
    [self bindWithViewModel];
    
    
}
#pragma mark -

- (void)addViews {
    _emailTextField = [UITextField new];
    _emailTextField.frame = CGRectMake(200, 300, 100, 30);
    _emailTextField.borderStyle = UITextBorderStyleRoundedRect;
    _emailTextField.font = [UIFont boldSystemFontOfSize:16];
    _emailTextField.placeholder = NSLocalizedString(@"Email address", nil);
    _emailTextField.keyboardType = UIKeyboardTypeEmailAddress;
    _emailTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.view addSubview:self.emailTextField];
    
    self.subscribeButton = [Tooles getButton:CGRectMake(0, 80, 100, 50) title:@"go" titleColor:@"ffffff" titleSize:15];
    [self.view addSubview:self.subscribeButton];
    
    self.statusLabel = [Tooles getLabel:CGRectMake(0, 200, 100, 50) fontSize:15 alignment:NSTextAlignmentLeft textColor:@"ffffff"];
    [self.view addSubview:self.statusLabel];
    
    
    
   
}

- (void)defineLayout {
//    @weakify(self);
//    
//    [self.emailTextField mas_makeConstraints:^(MASConstraintMaker *make) {
//        @strongify(self);
//        make.top.equalTo(self.view).with.offset(100.f);
//        make.left.equalTo(self.view).with.offset(20.f);
//        make.height.equalTo(@50.f);
//    }];
//    
//    [self.subscribeButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        @strongify(self);
//        make.centerY.equalTo(self.emailTextField);
//        make.right.equalTo(self.view).with.offset(-25.f);
//        make.width.equalTo(@70.f);
//        make.height.equalTo(@30.f);
//        make.left.equalTo(self.emailTextField.mas_right).with.offset(20.f);
//    }];
}

- (void)bindWithViewModel {
    RAC(self.viewModel, email) = self.emailTextField.rac_textSignal;//这个页面的emailTextField变化，会传给 viewModel的属性email
    //按钮点击事件绑定model
//    self.subscribeButton.rac_command = self.viewModel.subscribeCommand;
    //最常用的点击事件
//    [[self.subscribeButton rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
//        NSLog(@"点击事件");
//    }];
    //点击事件拦截。
    [[[self.subscribeButton rac_signalForControlEvents:UIControlEventTouchUpInside]filter:^BOOL(UIButton *button) {
        if ([button.currentTitle isEqualToString:@"sd"]) {
            return YES;
        }else{
            return NO;
        }
    }]subscribeNext:^(id x) {
         NSLog(@"点击事件");
    }];
    //RACObserve 是监听属性变化。
    //RAC 是给属性赋值。
    
}


@end
