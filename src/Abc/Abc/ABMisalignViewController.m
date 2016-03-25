//
//  ABMisalignViewController.m
//  Abc
//
//  Created by Len on 16/3/15.
//  Copyright © 2016年 Len. All rights reserved.
//

#import "ABMisalignViewController.h"

@interface ABMisalignViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

#define ONE_PIXEL (1 / [UIScreen mainScreen].scale)

@implementation ABMisalignViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    NSManagedObjectContext
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:self.tableView];
    
    self.title = @"Misalign Images";
    
}


#pragma mark - UITableViewDataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSInteger row = indexPath.row;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kIdentifierUnaligned"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"kIdentifierUnaligned"];
        UIImageView *unalignedImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Image"]];
        unalignedImageView.center = cell.contentView.center;
        [cell addSubview:unalignedImageView];
        
        UILabel *misalignedLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10.25, 120, 20)];
        CGRect rect =  CGRectIntegral(CGRectMake(9.12, 8.49, 19.65, 20.99));
        NSLog(@"x:%@,y:%@,w:%@,h:%@", @(rect.origin.x),@(rect.origin.y),@(rect.size.width),@(rect.size.height));
        misalignedLabel.text = @"sb?";
        [cell.contentView addSubview:misalignedLabel];
//        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(190, 23.25, 20, 13.5)];
//        view.backgroundColor = [UIColor redColor];
//        [cell.contentView addSubview:view];
//        UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(190, 23.25-13.5, 20, 13.5)];
//        view2.backgroundColor = [UIColor redColor];
//        [cell.contentView addSubview:view2];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

@end
