//
//  MyTableViewCell.h
//  Demo
//
//  Created by xiaoming on 15/11/11.
//  Copyright © 2015年 dandanshan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell

@property (strong, nonatomic) UIImageView *contenImageV;

#pragma mark - 初始化的cell.
+ (id)clubCellWithReuseIdentifier:(NSString *)reuseIdentifier andType:(NSString *)type;

#pragma mark - 自定义的cell赋值方法.
- (void)drawCellWithData:(NSArray *)array row:(NSInteger)row count:(NSInteger)count;


@end
