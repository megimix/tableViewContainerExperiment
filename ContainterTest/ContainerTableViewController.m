//
//  ContainerTableViewController.m
//  ContainterTest
//
//  Created by Tal Shachar on 6/3/15.
//  Copyright (c) 2015 Tal Shachar. All rights reserved.
//

#import "ContainerTableViewController.h"
#import "TableViewController.h"
#import "CollectionViewCotroller.h"
#import "TableViewContainerCell.h"
#import "CollectionViewContainerCell.h"

@interface ContainerTableViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *containerTableView;

@property (strong, nonatomic) TableViewController *tableViewController;

@end

@implementation ContainerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTableViewController];
    
    [self.containerTableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
//    [self.containerTableView reloadData];
}

- (void)createTableViewController {
    self.tableViewController = [[TableViewController alloc] initWithNibName:NSStringFromClass([TableViewController class]) bundle:nil];
    
    [self.tableViewController willMoveToParentViewController:self];
    [self addChildViewController:self.tableViewController];
    [self.tableViewController didMoveToParentViewController:self];
    
    [self.tableViewController.view layoutIfNeeded];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numberOfRowsInSection = 0;
    switch (section) {
        case 0:
            numberOfRowsInSection = 2;
            break;
        case 1:
            numberOfRowsInSection = 1;
            break;
        case 2:
            numberOfRowsInSection = 2;
            break;
            
        default:
            break;
    }
    return numberOfRowsInSection;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat heightForRowAtIndexPath = 44.0f;
    
    switch (indexPath.section) {
        case 1: {
            
            heightForRowAtIndexPath = [self.tableViewController viewControllerHeight];
            break;
        }
            
        default:
            break;
    }
    return heightForRowAtIndexPath;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    
    switch (indexPath.section) {
        case 0:
        case 2:{
            cell = [UITableViewCell new];
            [cell layoutIfNeeded];
            cell.textLabel.text = [NSString stringWithFormat:@"%li - %li",(long)indexPath.section, (long)indexPath.row];
            break;
        }
        case 1: {
            static NSString *identifier = @"TableViewContainerCell";
            
            id tableViewContainerCellObject = [tableView dequeueReusableCellWithIdentifier:identifier];
            
            if (!tableViewContainerCellObject) {
                tableViewContainerCellObject = [[[NSBundle mainBundle] loadNibNamed:identifier owner:tableViewContainerCellObject options:nil] objectAtIndex:0];
            }
            
            if ([tableViewContainerCellObject isKindOfClass:[TableViewContainerCell class]]) {
                TableViewContainerCell *aTableViewContainerCell = (TableViewContainerCell *)tableViewContainerCellObject;
                
                aTableViewContainerCell.continerView = self.tableViewController.view;
                
                cell = aTableViewContainerCell;
            }
            
            break;
        }
        default:
            break;
    }
    
    if (!cell) {
        cell = [UITableViewCell new];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.row == 1) {
//        [self presentViewController:self.tableViewController animated:YES completion:nil];
//    }
}
@end
