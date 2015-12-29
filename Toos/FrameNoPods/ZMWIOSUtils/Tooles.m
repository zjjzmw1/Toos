//
//  Tooles.m
//  Vodka
//
//  Created by 小明 on 15-12-26.
//  Copyright (c) 2014年 Beijing Beast Technology Co.,Ltd. All rights reserved.
//

#import "Tooles.h"
#import "UIColor+IOSUtils.h"
#import "NSString+IOSUtils.h"
#import <ReactiveCocoa/ReactiveCocoa.h>         //各种方便的block封装

#define SYSTEM_LIBIARY_PATH      NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0]

@implementation Tooles

#pragma mark - 下面两个方法可以存储自定义的对象---TMCache就不行。
+(BOOL)saveFileToLoc:(NSString *) fileName theFile:(id) file{
    NSString *Path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *CachePath = [fileName stringByReplacingOccurrencesOfString: @"/" withString: @"_"];
    NSString *filename=[Path stringByAppendingPathComponent:CachePath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:filename]) {
        if (! [fileManager createFileAtPath:filename contents:nil attributes:nil]) {
            NSLog(@"createFile error occurred");
        }
    }
    return  [file writeToFile:filename atomically:YES];
}

+(BOOL) getFileFromLoc:(NSString*)filePath into:(id)file {
    NSString *Path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *CachePath = [filePath stringByReplacingOccurrencesOfString: @"/" withString: @"_"];
    NSString *filename=[Path stringByAppendingPathComponent:CachePath];
    
    if ([file isKindOfClass:[NSMutableDictionary class]]) {
        [file setDictionary: [NSMutableDictionary dictionaryWithContentsOfFile:filename]];
        if ([file count]==0) {
            return NO;
        }
    }else if ([file isKindOfClass:[NSMutableArray class]]) {
        [file addObjectsFromArray: [NSMutableArray arrayWithContentsOfFile:filename]];
        if ([file count]==0) {
            return NO;
        }
    }else if ([file isKindOfClass:[NSData class]]) {
        file = [NSData dataWithContentsOfFile:filename];
        if ([file length] ==0) {
            return NO;
        }
    }
    
    return YES;
}

+(NSData *) getDataFileFromLoc:(NSString*)filePath into:(id)file {
    NSString *Path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *CachePath = [filePath stringByReplacingOccurrencesOfString: @"/" withString: @"_"];
    NSString *filename=[Path stringByAppendingPathComponent:CachePath];
    
    if ([file isKindOfClass:[NSData class]]) {
        file = [NSData dataWithContentsOfFile:filename];
        if ([file length] ==0) {
            return nil;
        }
        return file;
    }
    return nil;
    
}

+(BOOL)removeLoc:(NSString *)fileName{
    NSString *Path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *CachePath = [fileName stringByReplacingOccurrencesOfString: @"/" withString: @"_"];
    NSString *filename=[Path stringByAppendingPathComponent:CachePath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:filename]) {
        if ([fileManager removeItemAtPath:filename error:nil]) {
            return YES;
        }
        return NO;
    }
    return NO;
    
}

/**
 *  获取UILabel 、UIButton 、UIImageView的类方法汇总
 *
 *  @param frame     控件大小
 *  @param fontSize  字体大小
 *  @param alignment 对齐方式
 *  @param textColor 字体颜色
 *
 *  @return UILabel/UIButton/UIImageView
 */
#pragma mark - 获取UILabel 、UIButton 、UIImageView的类方法汇总
+(UILabel *)getLabel:(CGRect)frame fontSize:(float)fontSize alignment:(NSTextAlignment)alignment textColor:(NSString *)textColor{
    UILabel *label = [[UILabel alloc]init];
    label.frame = frame;
    label.font = [UIFont systemFontOfSize:16];//默认是16
    if (fontSize > 0) {
        label.font = [UIFont systemFontOfSize:fontSize];
    }
    label.textAlignment = alignment;
    
    label.textColor = [UIColor colorFromHexString:textColor];//例如：@"ffffff"
    label.backgroundColor = [UIColor clearColor];
    
    return label;
}

+(UIButton *)getButton:(CGRect)frame title:(NSString *)title titleColor:(NSString *)titleColor titleSize:(float)titleSize{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setBackgroundColor:[UIColor clearColor]];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorFromHexString:titleColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    if (titleSize > 0) {
        button.titleLabel.font = [UIFont systemFontOfSize:titleSize];
    }
    return button;
}

+(UIImageView *)getImageView:(CGRect)frame cornerRadius:(float)cornerRadius {
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = frame;
    imageView.layer.cornerRadius = cornerRadius;
    imageView.layer.masksToBounds = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFill;     ///这个是取中间的一部分。。不压缩的。
    imageView.backgroundColor = [UIColor clearColor];
    return imageView;
}

#pragma mark ====点击textField的时候，上下移动View的通用方法========
+ (void) animateTextField: (UITextField *)textField up: (BOOL)up viewController:(UIViewController *)tempVC
{
    const int movementDistance = -(int)textField.tag;
    const float movementDuration = 0.3f;
    
    int movement = (up ? movementDistance: -movementDistance);
    
    [UIView beginAnimations:@"animateTextField" context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:movementDuration];
    
    tempVC.view.frame = CGRectOffset(tempVC.view.frame, 0, movement);
    [UIView commitAnimations];
    
}

/**
 *  获取本地路径url 或者 网络url
 *
 *  @param folderName 文件夹名称  本地路径的时候用，否则传 nil
 *  @param fileName   文件名字 本地路径的时候用，否则传 nil
 *  @param urlString  网络urlString
 *
 *  @return NSURL（网络或者本地）
 */
+(NSURL *)getURLWithFolderName:(NSString *)folderName fileName:(NSString *)fileName urlString:(NSString *)urlString {
    if ([folderName isEmptyString]) {
        folderName = @"Cycling_Record_Road_Images";
    }
    
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSString* path = [self absolutePath:[NSString stringWithFormat:@"%@/%@.png", folderName,fileName] systemPath:SYSTEM_LIBIARY_PATH];
    
    if([fileManager fileExistsAtPath:path]){
        
        return [NSURL fileURLWithPath:path];
    }else{
        return [NSURL URLWithString:urlString];
    }
}

+ (NSString*)absolutePath:(NSString*)relativePath systemPath:(NSString*)systemPath{
    return [systemPath stringByAppendingPathComponent:relativePath];
}

#pragma mark - 各种方便的block封装  ReactiveCocoa
-(void)reactiveCocoaAction{
//    __weak typeof(self) wSelf = self;
    //------------------------------------通知监听----------------------------------------
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"log_out" object:nil] subscribeNext:^(id x) {
        //        NSNotification* notification = (NSNotification*)x;
        //        int unreadClubMsgCount = 0;
        //        if (notification.object) {
        //            unreadClubMsgCount = [notification.object intValue];
        //        }
        //退出登录的通知。---"log_out"是自定义的
    }];
    
    //退出登录后执行。。。。上面的通知方法就可以触发了。
    [[NSNotificationCenter defaultCenter]postNotificationName:@"log_out" object:nil];
    
    //------------------------------------UITextField输入限制-----------------------------
    UITextField *textField;//自己写初始化
    [textField.rac_textSignal subscribeNext:^(NSString* text) {
        if(text.length > 12){
            textField.text = [text substringToIndex:12];
        }
    }];
    //------------------------------------UIAlertView,UIActionSheet点击方法-----------------------------
    UIAlertView *alertView;//自己写初始化
    [[alertView rac_buttonClickedSignal] subscribeNext:^(id x) {
        if ([x integerValue] == 1) {//alert的按钮
            
        }
    }];
    [alertView show];
    UIActionSheet* actionSheet ;
    [[actionSheet rac_buttonClickedSignal] subscribeNext:^(id x) {
        if ([x integerValue] == 1) {//actionSheet的按钮
            
        }
    }];
//    [actionSheet showInView:self.view];
    //------------------------------------UIButton点击方法-----------------------------
    UIButton *button;//自己写初始化
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
    }];
    
    //------------------------------------监听某个类的某个属性的变化-----------------------------
    //    [RACObserve([ClubMessageManager defaultManager], hasUnreadFriendShare) subscribeNext:^(id x) {
    [RACObserve(self, count) subscribeNext:^(id x) {
        if ([x integerValue] == 0) {
            
        }else if ([x integerValue] > 100){
            
        }
    }];
    //------------------------------------segmentedControl-----------------------------
    UISegmentedControl *segmentedControl;
    [[segmentedControl rac_signalForControlEvents:UIControlEventValueChanged] subscribeNext:^(id x) {
        
        
    }];
    
}


@end
