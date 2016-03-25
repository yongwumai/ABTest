//
//  ABOffscreenRenderViewController.m
//  Abc
//
//  Created by Len on 16/3/17.
//  Copyright © 2016年 Len. All rights reserved.
//

#import "ABOffscreenRenderViewController.h"
#import "ABOffscreenRenderTableViewCell.h"

@interface ABOffscreenRenderViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ABOffscreenRenderViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    NSManagedObjectContext
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:self.tableView];
    
    self.title = @"Core Animation";
    
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
    ABOffscreenRenderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kIdentifierOffScreenNormal"];
    if (!cell) {
        cell = [[ABOffscreenRenderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"kIdentifierOffScreenNormal"];
        cell.textLabel.layer.shouldRasterize = YES;
    }
    [cell configTitle:[NSString stringWithFormat:@"offsetScreen %@", @(row)] index:row];
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
