//
//  MyTableViewCell.m
//  Demo
//
//  Created by xiaoming on 15/11/11.
//  Copyright © 2015年 dandanshan. All rights reserved.
//

#import "MyTableViewCell.h"
#import <UIImageView+YYWebImage.h>

@implementation MyTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andType:(NSString *)type
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.contenImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 150)];
        [self.contentView addSubview:_contenImageV];
        self.contenImageV.layer.masksToBounds = YES;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

+ (id)clubCellWithReuseIdentifier:(NSString *)reuseIdentifier andType:(NSString *)type
{
    return [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier andType:type];
}

#pragma mark - 好友列表的cell.
- (void)drawCellWithData:(NSArray *)array row:(NSInteger)row count:(NSInteger)count{
    self.accessoryType = UITableViewCellAccessoryNone;

    [self.contenImageV yy_setImageWithURL:[NSURL URLWithString:[array objectAtIndex:row]] placeholder:[UIImage imageNamed:@"default"]];

}

@end
