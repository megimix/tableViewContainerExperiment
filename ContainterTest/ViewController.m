//
//  ViewController.m
//  ContainterTest
//
//  Created by Tal Shachar on 6/3/15.
//  Copyright (c) 2015 Tal Shachar. All rights reserved.
//

#import "ViewController.h"
#import "ContainerTableViewController.h"
#import "TableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    ContainerTableViewController *vc= [[ContainerTableViewController alloc] init];
//    TableViewController *vc = [[TableViewController alloc] init];
    
//    [vc willMoveToParentViewController:self];
//    [self addChildViewController:vc];
//    [vc didMoveToParentViewController:self];
    
    [self presentViewController:vc animated:NO completion:nil];
}

- (void)getData {
    
}

@end
