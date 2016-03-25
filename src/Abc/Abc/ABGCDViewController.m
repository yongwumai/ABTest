//
//  ABGCDViewController.m
//  Abc
//
//  Created by Len on 16/3/22.
//  Copyright © 2016年 Len. All rights reserved.
//

#import "ABGCDViewController.h"

@interface ABGCDViewController ()

@property (strong, nonatomic) NSString *gcdString;

@end

@implementation ABGCDViewController


- (void)viewDidLoad
{
    self.title = @"GCD";
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        self.gcdString = @"GCD1";
        [self fetchData];
        dispatch_sync(queue, ^{
            self.gcdString = @"GCD2";
            [self fetchData];
        });
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            
        });
    });
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, dispatch_get_main_queue(), ^{
        self.gcdString = @"GCD3";
        [self fetchData];
    });
}


- (void)fetchData
{
    NSLog(@"ABGCDViewController fetchData");
    NSLog(self.gcdString);
    self.gcdString;
}

- (void)dealloc
{
    NSLog(@"ABGCDViewController dealloc");
}


@end
