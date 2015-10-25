//
//  TableViewController.m
//  ContainterTest
//
//  Created by Tal Shachar on 6/3/15.
//  Copyright (c) 2015 Tal Shachar. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView reloadData];
}

- (CGFloat)viewControllerHeight {
    CGFloat viewControllerHeight = 0.0f;
    
    viewControllerHeight += self.topView.frame.size.height;
    viewControllerHeight += self.tableView.contentSize.height;
    
    return viewControllerHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell new];
    
    cell.contentView.backgroundColor = ((indexPath.row % 2 == 0)
                            ? [UIColor lightGrayColor]
                            : [UIColor darkGrayColor]);
    cell.textLabel.text = @(indexPath.row).stringValue;
    return cell;
}

@end
