//
//  ABAnalyzerObject.m
//  Abc
//
//  Created by Len on 16/3/14.
//  Copyright © 2016年 Len. All rights reserved.
//

#import "ABAnalyzerObject.h"
#import <UIKit/UIKit.h>

@implementation ABAnalyzerObject

- (instancetype)init
{
    return self;
}

- (NSInteger)getText
{
    NSInteger a = 0;
    switch (a) {
        case 0: {
            NSInteger b;
            return b;
        }
            break;
            
        default:
            break;
    }
    return 0;
}

- (UIImage*)imageFromView:(UIImage *)srcImage rect:(CGRect)rect
{
    CGImageRef cr = CGImageCreateWithImageInRect(srcImage.CGImage, rect);
    UIImage* cropped = [UIImage imageWithCGImage:cr];
    
    CGImageRelease(cr);
    return cropped;
}

@end
