//
//  ViewController.m
//  TopCollectionView
//
//  Created by mac on 16/9/17.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "TopCollectionView.h"
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    [self setupTableView];
}

- (void)setupTableView {

    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH ) style:UITableViewStyleGrouped];
    self.tableView = tableView;
    tableView.dataSource = self;
    tableView.delegate = self;
//    tableView.backgroundColor = [UIColor redColor];
    [self.view addSubview:tableView];
    TopCollectionView *view = [TopCollectionView topCollectionView];
    //    view.backgroundColor = [UIColor lightGrayColor];
    view.frame = CGRectMake(0, 0, ScreenW, 145);
//    [tableView addSubview:view];
//    tableView.contentInset = UIEdgeInsetsMake(145, 0, 44, 0);
//    self.view.backgroundColor = [UIColor lightGrayColor];
    
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 100)];
    footerView.backgroundColor = [UIColor greenColor];
    tableView.tableFooterView = footerView;
    
//    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 100)];
//    headerView.backgroundColor = [UIColor greenColor];
    tableView.tableHeaderView = view;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 0.定义一个重用标识
    static NSString *ID = @"cell";
    // 1.去缓存池中找可循环利用的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 2.如果缓存池中没有可循环利用的cell,自己创建
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    // 3.设置数据
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据第%zd组-- 第%zd行",indexPath.section,indexPath.row];
    
    
    return cell;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//
//    return [NSString stringWithFormat:@"第%zd组数据",section];
//}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 35)];
    view.backgroundColor = [UIColor orangeColor];
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 35)];
    lable.text = [NSString stringWithFormat:@"第%zd组数据",section];
    [view addSubview:lable];
    return view;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {

    if (section == 4) {
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 100)];
//        view.backgroundColor = [UIColor redColor];
        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 50)];
        lable.font = [UIFont systemFontOfSize:40];
        lable.textAlignment = NSTextAlignmentCenter;
        lable.preferredMaxLayoutWidth = ScreenW - 10;
        lable.numberOfLines = 0;
        lable.text = @"viewForFooterInSectionfadsfa";
        [view addSubview:lable];
        return view;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 4) {
        return 200;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 35;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
