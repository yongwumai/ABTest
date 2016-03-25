//
//  ABTimerViewController.m
//  Abc
//
//  Created by Len on 16/3/17.
//  Copyright © 2016年 Len. All rights reserved.
//

#import "ABTimerViewController.h"

@interface ABTimerViewController ()

@property (strong, nonatomic) NSTimer *timer;

@property (assign, nonatomic) NSInteger i;

@end

@implementation ABTimerViewController

- (void)viewDidLoad
{
    self.title = @"NSTimer";
//    typeof(&*self) __weak weakSelf = self;
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                      target:self
                                                    selector:@selector(fetchData)
                                                    userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    self.timer = timer;

}


- (void)fetchData
{
    NSLog(@"ABTimerViewController fetchData %@", @(self.i));
    self.i++;
    if (self.i > 100) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (void)dealloc
{
    NSLog(@"ABTimerViewController dealloc");
    [self.timer invalidate];
    self.timer = nil;
}

@end
