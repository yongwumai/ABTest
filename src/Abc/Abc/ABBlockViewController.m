//
//  ABBlockViewController.m
//  Abc
//
//  Created by Len on 16/3/17.
//  Copyright © 2016年 Len. All rights reserved.
//

#import "ABBlockViewController.h"

@interface ABBlockViewController ()

@property (strong, nonatomic) NSTimer *timer;

@property (strong, nonatomic) void (^block)();

@property (strong, nonatomic) NSString *testString;

@property (assign, nonatomic) NSInteger i;

@end

@implementation ABBlockViewController

- (void)viewDidLoad
{
    self.title = @"BLOCK";
    // 这种做法必须执行才能解决循环引用
//    __block ABBlockViewController *weakSelf = self;
    //
//    typeof(&*self) __weak weakSelf = self;
    typeof(self) __weak weakSelf = self;
    _testString = @"keke";
    self.block = ^{
        //        self.view;
//        weakSelf.view;
        NSLog(weakSelf.testString);
//        weakSelf = nil;
    };
//    self.block();
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:10.0f
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
    self.block();
    if (self.i > 10) {
        [self.timer invalidate];
        self.timer = nil;
    }
}


- (void)dealloc
{
    NSLog(@"ABBlockViewController dealloc");
}

@end
