//
//  ABBlendedLayerViewController.m
//  Abc
//
//  Created by Len on 16/3/15.
//  Copyright © 2016年 Len. All rights reserved.
//

#import "ABBlendedLayerViewController.h"
#import "ABBlendedLayerTableViewCell.h"

@interface ABBlendedLayerViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ABBlendedLayerViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    NSManagedObjectContext
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:self.tableView];
    
    self.title = @"BlendedLayer";
    
}


#pragma mark - UITableViewDataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    ABBlendedLayerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kIdentifierBlendedNormal"];
    if (!cell) {
        cell = [[ABBlendedLayerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"kIdentifierBlendedNormal"];
    }
    [cell configTitle:[NSString stringWithFormat:@"blended %@", @(row)] index:row];
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
