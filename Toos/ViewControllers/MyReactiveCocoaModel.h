//
//  MyReactiveCocoaModel.h
//  Toos
//
//  Created by xiaoming on 15/12/29.
//  Copyright © 2015年 shandandan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface MyReactiveCocoaModel : NSObject

@property (strong, nonatomic) RACCommand    *subscribeCommand;
@property (strong, nonatomic) NSString      *email;
@property (strong, nonatomic) NSString      *statusMessage;
@property (strong, nonatomic) RACSignal     *emailValidSignal;

@end
