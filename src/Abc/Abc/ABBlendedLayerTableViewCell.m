//
//  ABBlendedLayerTableViewCell.m
//  Abc
//
//  Created by Len on 16/3/17.
//  Copyright © 2016年 Len. All rights reserved.
//

#import "ABBlendedLayerTableViewCell.h"

@interface ABBlendedLayerTableViewCell ()

@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UIView *view2;

@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;

@end

@implementation ABBlendedLayerTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(50, 10, 120, 30)];
//        view1.layer.opacity = 0.6;
        view1.backgroundColor = [UIColor yellowColor];
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 30)];
        [view1 addSubview:label1];
        self.view1 = view1;
        self.label1 = label1;
        [self.contentView addSubview:view1];
        
        UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(80, 10, 120, 30)];
//        view2.layer.opacity = 0.6;
        view2.backgroundColor = [UIColor greenColor];
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 30)];
        [view2 addSubview:label2];
        self.view2 = view2;
        self.label2 = label2;
        [self.contentView addSubview:view2];
    }
    return self;
}

- (void)configTitle:(NSString *)title index:(NSInteger)index
{
    [self.label1 setText:title];
    [self.label2 setText:title];
}



@end
