//
//  UIView+nib.m
//  ContainterTest
//
//  Created by Tal Shachar on 6/3/15.
//  Copyright (c) 2015 Tal Shachar. All rights reserved.
//

#import "UIView+nib.h"

@implementation UIView (nib)

+ (UIView *)loadFromNib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] objectAtIndex:0];
}

@end
