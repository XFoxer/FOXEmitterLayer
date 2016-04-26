//
//  FOXBaseViewController.m
//  CAEmitterAnimation
//
//  Created by XFoxer on 16/4/26.
//  Copyright © 2016年 XFoxer. All rights reserved.
//

#import "FOXBaseViewController.h"

@interface FOXBaseViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;

@end

@implementation FOXBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:self.tableView = [self createTableView]];
}


- (UITableView *)createTableView
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    [tableView setMultipleTouchEnabled:YES];
    [tableView setShowsVerticalScrollIndicator:YES];
    [tableView setShowsHorizontalScrollIndicator:NO];
    return tableView;
}



- (NSMutableArray *)animationType
{
    return [[NSMutableArray alloc]initWithObjects:@"FOXSakuraViewController", nil];
}


- (NSMutableArray *)titleType
{
    return [[NSMutableArray alloc]initWithObjects:@"樱花落",nil];
}


#pragma mark - TableView  DataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *reuseIdentity = @"REUSE_IDENTITY";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentity];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentity];
    }
    
    NSString *title = [self titleType][indexPath.row];
    [cell.textLabel setText:title];
    [cell.textLabel setFont:[UIFont systemFontOfSize:17]];
    [cell.textLabel setTextColor:[UIColor magentaColor]];
    return cell;
}


#pragma mark- TableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.00001f;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *className = [self animationType][indexPath.row];
    Class cls = NSClassFromString(className);
    UIViewController *vc = (UIViewController *)[[cls alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
  
}


@end
