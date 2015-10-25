//
//  TableViewContainerCell.m
//  ContainterTest
//
//  Created by Tal Shachar on 6/3/15.
//  Copyright (c) 2015 Tal Shachar. All rights reserved.
//

#import "TableViewContainerCell.h"

@implementation TableViewContainerCell

- (void)setContinerView:(UIView *)continerView {
    _continerView = continerView;
    _continerView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.contentView addSubview:_continerView];
    
    NSDictionary *viewsDictionary = @{@"contentView": self.contentView,
                                      @"_continerView": _continerView};
    
    [self.contentView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_continerView]|"
                                             options:0
                                             metrics:nil
                                               views:viewsDictionary]];
    [self.contentView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_continerView]|"
                                             options:0
                                             metrics:nil
                                               views:viewsDictionary]];
    
    [self setNeedsUpdateConstraints];
}


@end
