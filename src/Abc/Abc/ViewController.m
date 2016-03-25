//
//  ViewController.m
//  Abc
//
//  Created by Len on 16/1/29.
//  Copyright © 2016年 Len. All rights reserved.
//

#import "ViewController.h"
#import "AbcViewController.h"
#import "Abc2ViewController.h"
#import <CoreData/CoreData.h>
#import "ABUIViewController.h"
#import "ABTimerViewController.h"
#import "ABBlockViewController.h"
#import "ABGCDViewController.h"
#import "ABMemoryViewController.h"
#import "ABNotificationViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) ViewController *leakVc;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSManagedObjectContext
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:self.tableView];
    
    
//    for (NSInteger i = 0; i < 10000; i++) {
//        @autoreleasepool {
//            UIView *misalignedLabel = [[UIView alloc]initWithFrame:CGRectMake(10 + i + 0.25, 100.25 + i, 120.33, 20.92)];
////            UIView *misalignedLabel = [[UIView alloc]initWithFrame:CGRectMake(10 + i, 100 + i, 120, 20)];
//            misalignedLabel.backgroundColor = [UIColor blueColor];
//            [self.view addSubview:misalignedLabel];
//        }
//    }
    self.title = @"测试";
    
}


#pragma mark - UITableViewDataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kIdentifierNormal"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"kIdentifierNormal"];
    }
    NSString *title = @"";
    switch (row) {
        case 0:
            title = @"Core Animation";
            break;
        case 1:
            title = @"no @autoreleasepool";
            break;
        case 2:
            title = @"@autoreleasepool";
            break;
        case 3:
            title = @"循环引用NSTimer";
            break;
        case 4:
            title = @"循环引用block";
            break;
        case 5:
            title = @"循环引用GCD";
            break;
        case 6:
            title = @"notificaiton block引用测试";
            break;
        case 7:
            title = @"常用block引用测试";
            break;
        case 8:
            title = @"blockNotification";
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
        // Core Animation
        ABUIViewController *vc = [[ABUIViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (row == 1) {
        // no @autoreleasepool
        for (NSInteger i = 0; i < 10000; i++) {
            Abc2ViewController *vc = [[Abc2ViewController alloc] init];
        }
    } else if (row == 2) {
        // @autoreleasepool
        for (NSInteger i = 0; i < 10000; i++) {
            @autoreleasepool {
                Abc2ViewController *vc = [[Abc2ViewController alloc] init];
            }
        }
    } else if (row == 3) {
        ABTimerViewController *vc = [[ABTimerViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (row == 4) {
        ABBlockViewController *vc = [[ABBlockViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (row == 5) {
        ABGCDViewController *vc = [[ABGCDViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (row == 6) {
        ABNotificationViewController *vc = [[ABNotificationViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }  else if (row == 7) {
        ABMemoryViewController *vc = [[ABMemoryViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (row == 8) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"blockNotification" object:nil];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

- (UIImage*)imageFromView:(UIImage *)srcImage rect:(CGRect)rect
{
    CGImageRef cr = CGImageCreateWithImageInRect(srcImage.CGImage, rect);
    UIImage* cropped = [UIImage imageWithCGImage:cr];
    
    CGImageRelease(cr);
    return cropped;
}

@end
