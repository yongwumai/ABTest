//
//  ABOffscreenRenderTableViewCell.m
//  Abc
//
//  Created by Len on 16/3/17.
//  Copyright © 2016年 Len. All rights reserved.
//

#import "ABOffscreenRenderTableViewCell.h"

@interface ABOffscreenRenderTableViewCell ()

@property (strong, nonatomic) UIImageView *iconView;

@property (strong, nonatomic) UILabel *label1;

@end

@implementation ABOffscreenRenderTableViewCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
        self.iconView.layer.cornerRadius = 5.0f;
        // 这个
        self.iconView.layer.masksToBounds = YES;
        [self.contentView addSubview:self.iconView];
        
        self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(100, 15, 150, 25)];
        self.label1.textColor = [UIColor grayColor];
        // 这个
        self.label1.layer.shouldRasterize = YES;
        [self.contentView addSubview:self.label1];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
        self.iconView.layer.cornerRadius = 5.0f;
        // 这个
        self.iconView.layer.masksToBounds = YES;
        [self.contentView addSubview:self.iconView];
        
        self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(100, 15, 150, 25)];
        self.label1.textColor = [UIColor grayColor];
        // 这个
        self.label1.layer.shouldRasterize = YES;
        [self.contentView addSubview:self.label1];
    }
    return self;
}

- (void)configTitle:(NSString *)title index:(NSInteger)index
{
    NSLog(@"%@", @(index));
    if (index % 2 == 0) {
        [self.iconView setImage:[UIImage imageNamed:@"image1"]];
    } else {
        [self.iconView setImage:[UIImage imageNamed:@"image2"]];
    }
    [self.label1 setText:title];
}

@end
