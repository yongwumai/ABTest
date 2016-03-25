//
//  ABMemoryViewController.m
//  Abc
//
//  Created by Len on 16/3/22.
//  Copyright © 2016年 Len. All rights reserved.
//

#import "ABMemoryViewController.h"

@interface ABMemoryViewController ()

@property (strong, nonatomic) UIView *cview;

@property (strong, nonatomic) NSString *queueString;

@end

@implementation ABMemoryViewController


- (void)viewDidLoad
{
    self.title = @"Memory";
    // animate
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor blueColor];
    view.opaque = 0;
    self.cview = view;
    [self.view addSubview:self.cview];
    [UIView animateWithDuration:10.0 animations:^{
        self.cview.frame = CGRectMake(100, 100, 50, 50);
    }];
    
    // operation
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        self.queueString = @"NSOperationQueue";
        [self fetchData];
    }];
}


- (void)fetchData
{
    NSLog(@"ABMemoryViewController fetchData");
    self.queueString;
}

- (void)dealloc
{
    NSLog(@"ABMemoryViewController dealloc");
}

@end
