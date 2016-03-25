//
//  ABNotificationViewController.m
//  Abc
//
//  Created by Len on 16/3/22.
//  Copyright © 2016年 Len. All rights reserved.
//

#import "ABNotificationViewController.h"

@interface ABNotificationViewController ()

@property (strong, nonatomic) NSString *notificationstring;

@end

@implementation ABNotificationViewController

- (void)viewDidLoad
{
    self.title = @"Noti";
    typeof(self) __weak weakSelf = self;
    [[NSNotificationCenter defaultCenter] addObserverForName:@"blockNotification" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notification) {
        weakSelf.notificationstring = @"blockNotification";
        [weakSelf fetchData];
    }];
}


- (void)fetchData
{
    NSLog(@"ABNotificationViewController fetchData");
    self.notificationstring;
}

- (void)dealloc
{
    NSLog(@"ABNotificationViewController dealloc");
}

@end
