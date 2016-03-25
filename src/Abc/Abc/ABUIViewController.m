//
//  ABUIViewController.m
//  Abc
//
//  Created by Len on 16/3/15.
//  Copyright © 2016年 Len. All rights reserved.
//

#import "ABUIViewController.h"
#import "ABRasterizeViewController.h"
#import "ABMisalignViewController.h"
#import "ABBlendedLayerViewController.h"
#import "ABOffscreenRenderViewController.h"

@interface ABUIViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ABUIViewController


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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kIdentifierNormal"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"kIdentifierNormal"];
//        cell.textLabel.layer.shouldRasterize = YES;
    }
    NSString *title = @"";
    switch (row) {
        case 0:
            title = @"Rasterize";
            break;
        case 1:
            title = @"MisAlignImages";
            break;
        case 2:
            title = @"blended Layer";
            break;
        case 3:
            title = @"offsetScreen Render";
            break;
        default:
            break;
    }
    cell.textLabel.text = title;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSInteger row = indexPath.row;
    if (row == 0) {
        ABRasterizeViewController *vc = [[ABRasterizeViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (row == 1) {
        ABMisalignViewController *vc = [[ABMisalignViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (row == 2) {
        ABBlendedLayerViewController *vc = [[ABBlendedLayerViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (row == 3) {
        ABOffscreenRenderViewController *vc = [[ABOffscreenRenderViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}


@end
