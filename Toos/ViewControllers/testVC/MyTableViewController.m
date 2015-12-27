//
//  MyTableViewController.m
//  Demo
//
//  Created by xiaoming on 15/11/8.
//  Copyright © 2015年 dandanshan. All rights reserved.
//

#import "MyTableViewController.h"
#import "MyTableViewCell.h"
#import "IOSUtils.h"                //测试公用类的方法
@interface MyTableViewController ()
{
    NSArray *urlArray;
}
@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化几个大图的url
    urlArray = [NSArray arrayWithObjects:@"http://ic.topit.me/c/74/90/1149402544cf49074co.jpg",@"http://imgsrc.baidu.com/forum/pic/item/3ac79f3df8dcd1004e9102b8728b4710b9122f1e.jpg",@"http://i6.topit.me/6/3d/c7/1132049425fc9c73d6o.jpg",@"http://i6.topit.me/6/0f/07/11325948309cb070f6o.jpg",@"http://i6.topit.me/6/ca/4e/11248655556d24eca6o.jpg",@"http://f0.topit.me/0/f8/68/1122299417ae868f80o.jpg",@"http://if.topit.me/f/56/2e/1107217042dee2e56fo.jpg",@"http://f5.topit.me/5/f8/ce/1137495361085cef85o.jpg",@"http://fd.topit.me/d/e2/34/110627273206234e2do.jpg",@"http://i4.topit.me/4/e4/5e/1132253263b8b5ee44o.jpg",@"http://ic.topit.me/c/74/90/1149402544cf49074co.jpg",@"http://imgsrc.baidu.com/forum/pic/item/3ac79f3df8dcd1004e9102b8728b4710b9122f1e.jpg",@"http://i6.topit.me/6/3d/c7/1132049425fc9c73d6o.jpg",@"http://i6.topit.me/6/0f/07/11325948309cb070f6o.jpg",@"http://i6.topit.me/6/ca/4e/11248655556d24eca6o.jpg",@"http://f0.topit.me/0/f8/68/1122299417ae868f80o.jpg",@"http://if.topit.me/f/56/2e/1107217042dee2e56fo.jpg",@"http://f5.topit.me/5/f8/ce/1137495361085cef85o.jpg",@"http://fd.topit.me/d/e2/34/110627273206234e2do.jpg",@"http://i4.topit.me/4/e4/5e/1132253263b8b5ee44o.jpg",@"http://ic.topit.me/c/74/90/1149402544cf49074co.jpg",@"http://imgsrc.baidu.com/forum/pic/item/3ac79f3df8dcd1004e9102b8728b4710b9122f1e.jpg",@"http://i6.topit.me/6/3d/c7/1132049425fc9c73d6o.jpg",@"http://i6.topit.me/6/0f/07/11325948309cb070f6o.jpg",@"http://i6.topit.me/6/ca/4e/11248655556d24eca6o.jpg",@"http://f0.topit.me/0/f8/68/1122299417ae868f80o.jpg",@"http://if.topit.me/f/56/2e/1107217042dee2e56fo.jpg",@"http://f5.topit.me/5/f8/ce/1137495361085cef85o.jpg",@"http://fd.topit.me/d/e2/34/110627273206234e2do.jpg",@"http://i4.topit.me/4/e4/5e/1132253263b8b5ee44o.jpg",@"http://down.tutu001.com/d/file/20101129/2f5ca0f1c9b6d02ea87df74fcc_560.jpg",@"http://zx.kaitao.cn/UserFiles/Image/beijingtupian6.jpg",@"http://ppt360.com/background/UploadFiles_6733/201012/2010122016291897.jpg",@"http://anquanweb.com/uploads/userup/913/1322O9102-2596.jpg",@"http://pic1.nipic.com/2008-08-12/200881211331729_2.jpg",@"http://imgsrc.baidu.com/forum/pic/item/3ac79f3df8dcd1004e9102b8728b4710b9122f1e.jpg",@"http://down.tutu001.com/d/file/20101129/2f5ca0f1c9b6d02ea87df74fcc_560.jpg",@"http://zx.kaitao.cn/UserFiles/Image/beijingtupian6.jpg",@"http://ppt360.com/background/UploadFiles_6733/201012/2010122016291897.jpg",@"http://anquanweb.com/uploads/userup/913/1322O9102-2596.jpg",@"http://pic1.nipic.com/2008-08-12/200881211331729_2.jpg",@"http://imgsrc.baidu.com/forum/pic/item/3ac79f3df8dcd1004e9102b8728b4710b9122f1e.jpg", nil];
    
}


-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [urlArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"MyTableViewCell";
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell){
        cell = [MyTableViewCell clubCellWithReuseIdentifier:CellIdentifier andType:nil];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    [cell drawCellWithData:urlArray row:indexPath.row count:urlArray.count];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"名字===%@，年龄===%d",singleton.testName,singleton.testAge);
    
    singleton.testName = [NSString stringWithFormat:@"row%ld",(long)indexPath.row];
    singleton.testAge = (int)indexPath.row;
    
}

@end
