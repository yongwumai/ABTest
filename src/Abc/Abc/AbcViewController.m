//
//  AbcViewController.m
//  Abc
//
//  Created by Len on 16/2/16.
//  Copyright © 2016年 Len. All rights reserved.
//

#import "AbcViewController.h"
#import "Abc2ViewController.h"

@interface AbcViewController () <UITableViewDataSource, UITableViewDelegate>
{
    id obj;
}

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSArray *array;
@property (strong, nonatomic) void (^block)();
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation AbcViewController

- (instancetype)init
{
    return self;
}

- (void)viewDidLoad {
        for (NSInteger i = 0; i < 10000; i++) {
            @autoreleasepool {
                Abc2ViewController *vc = [[Abc2ViewController alloc] init];
            }
//            vc.delegate = self;
        }
    
//    __block AbcViewController *weakSelf = self;
//    self.block = ^{
////        self.view;
//        weakSelf.view;
//        weakSelf = nil;
//    };
//    self.block();
    
//    __block AbcViewController *weakSelf = self;
//    self.block = ^{
//        NSLog(@"weak %@", weakSelf);
//    };
    
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
//                                                      target:self
//                                                    selector:@selector(fetchData)
//                                                    userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
//    self.timer = timer;
    NSLog(@"end 0");
    
    [AbcViewController getFundWithServerId:^(id db) {
        NSLog(@"self %@", self);
    }];
    
    self.title = @"zombie";
    self.array = @[self.title];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:self.tableView];
    NSArray *array = @[self.title];
    [[NSNotificationCenter defaultCenter] addObserver:array selector:@selector(count) name:@"zombie" object:nil];
}

+ (void)getFundWithServerId:(void (^)(id db))completion
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        __block NSObject *fund = nil;
        dispatch_sync(queue, ^{
            [self query:^(id db) {
                fund = [[NSObject alloc] init];
            }];
        });
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (completion) {
                completion(fund);
            }
        });
    });
}

+ (void)query:(void (^)(id db))block
{
    NSObject *db;
    block(db);
}

- (void)fetchData{
    NSArray *array = @[@"zombie"];
    self.array = array;
    [self.tableView reloadData];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"zombie" object:nil];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kIdentifierNormal"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"kIdentifierNormal"];
        }
        NSString *title = self.array[row];
        cell.textLabel.text = title;
        return cell;
}

- (void)zombie
{
    [self fetchData];
}




- (void)dealloc
{
    self.title = nil;
    [self.timer invalidate];
    self.timer = nil;
    NSLog(@"dealloc");
}



@end
