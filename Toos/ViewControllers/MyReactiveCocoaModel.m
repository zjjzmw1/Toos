//
//  MyReactiveCocoaModel.m
//  Toos
//
//  Created by xiaoming on 15/12/29.
//  Copyright © 2015年 shandandan. All rights reserved.
//

#import "MyReactiveCocoaModel.h"
#import "NSString+IOSUtils.h"

@implementation MyReactiveCocoaModel

- (id)init {
    self = [super init];
    if (self) {
//        [self mapSubscribeCommandStateToStatusMessage];
    }
    return self;
}


- (RACCommand *)subscribeCommand {
   
    if (!_subscribeCommand) {
//        __weak typeof(self) wSelf = self;
//        @weakify(self);
//        _subscribeCommand = [[RACCommand alloc] initWithEnabled:self.emailValidSignal signalBlock:^RACSignal *(id input) {
////            @strongify(self);
//            NSLog(@"输入成功，可以写点击事件了。%@",input);
//            return nil;
//        }];
        
        _subscribeCommand = [[RACCommand alloc]initWithEnabled:self.emailValidSignal signalBlock:^RACSignal *(UIButton *button) {
            NSLog(@"点击按钮");
            return [RACSignal empty];
        }];
        
    }
    return _subscribeCommand;
}

- (RACSignal *)emailValidSignal {
    if (!_emailValidSignal) {
        _emailValidSignal = [RACObserve(self, email) map:^id(NSString *email) {
            if ([email isValidEmail]) {
                return @(YES);
            }else{
                return @(NO);
            }
        }];
    }
    return _emailValidSignal;
}


#pragma mark - 暂时不用、以后再了解更深的用法（看懂一半）
- (void)mapSubscribeCommandStateToStatusMessage {
    RACSignal *startedMessageSource = [self.subscribeCommand.executionSignals map:^id(RACSignal *subscribeSignal) {
        return NSLocalizedString(@"Sending request...", nil);
    }];
    
    RACSignal *completedMessageSource = [self.subscribeCommand.executionSignals flattenMap:^RACStream *(RACSignal *subscribeSignal) {
        return [[[subscribeSignal materialize] filter:^BOOL(RACEvent *event) {
            return event.eventType == RACEventTypeCompleted;
        }] map:^id(id value) {
            return NSLocalizedString(@"Thanks", nil);
        }];
    }];
    
    RACSignal *failedMessageSource = [[self.subscribeCommand.errors subscribeOn:[RACScheduler mainThreadScheduler]] map:^id(NSError *error) {
        return NSLocalizedString(@"Error :(", nil);
    }];
    
    RAC(self, statusMessage) = [RACSignal merge:@[startedMessageSource, completedMessageSource, failedMessageSource]];
    
}

@end
