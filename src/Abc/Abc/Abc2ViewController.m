//
//  Abc2ViewController.m
//  Abc
//
//  Created by Len on 16/2/16.
//  Copyright © 2016年 Len. All rights reserved.
//

#import "Abc2ViewController.h"

@interface Abc2ViewController ()

@property (strong, nonatomic) void (^block)();

@end

@implementation Abc2ViewController

- (void)viewDidLoad
{
    
}

- (void)dealloc
{
    self.title = nil;
    NSLog(@"dealloc2");
}

@end
