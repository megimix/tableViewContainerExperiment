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
@property (strong, nonatomic) CollectionViewCotroller *collectionViewController;

@end

@implementation ContainerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.containerTableView.delegate = self;
    self.containerTableView.dataSource = self;
    
    self.tableViewController = [[TableViewController alloc] initWithNibName:NSStringFromClass([TableViewController class]) bundle:nil];
//    [self.tableViewController willMoveToParentViewController:self];
//    [self addChildViewController:self.tableViewController];
//    [self.tableViewController didMoveToParentViewController:self];
    if  (self.tableViewController.view) {}
    self.tableViewController.view.bounds = self.view.bounds;
    
    self.collectionViewController = [[CollectionViewCotroller alloc] initWithNibName:NSStringFromClass([CollectionViewCotroller class]) bundle:nil];
    [self.collectionViewController willMoveToParentViewController:self];
    [self addChildViewController:self.collectionViewController];
    [self.collectionViewController didMoveToParentViewController:self];
    if (self.collectionViewController.view) {}
    
    [self.view layoutIfNeeded];
    
    [self.containerTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat heightForRowAtIndexPath = 44.0f;
    
    switch (indexPath.row) {
        case 0:
            heightForRowAtIndexPath = self.collectionViewController.view.frame.size.height;
            break;
        case (10 - 1):
            heightForRowAtIndexPath = self.tableViewController.view.frame.size.height;
            break;
            
        default:
            break;
    }
    return heightForRowAtIndexPath;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    
    switch (indexPath.row) {
        case 0: {
            static NSString *identifier = @"CollectionViewContainerCell";
            
            id cellObject = [tableView dequeueReusableCellWithIdentifier:identifier];
            
            if (!cellObject) {
                cellObject = [[[NSBundle mainBundle] loadNibNamed:identifier owner:cellObject options:nil] objectAtIndex:0];
            }
            
            cell = (UITableViewCell *)cellObject;
            [cell addSubview:self.collectionViewController.view];
            
            break;
        }
        case (10 - 1): {
            static NSString *identifier = @"TableViewContainerCell";
            
            id cellObject = [tableView dequeueReusableCellWithIdentifier:identifier];
            
            if (!cellObject) {
                cellObject = [[[NSBundle mainBundle] loadNibNamed:identifier owner:cellObject options:nil] objectAtIndex:0];
                UITableViewCell *newCell = (UITableViewCell *)cellObject;
//                newCell.bounds = self.view.bounds;
                [newCell layoutIfNeeded];
            }
            
            cell = (UITableViewCell *)cellObject;
            [cell addSubview:self.tableViewController.view];
            break;
        }
        default:
            break;
    }
    
    if (!cell) {
        cell = [UITableViewCell new];
    }
    
    [cell layoutIfNeeded];
    cell.textLabel.text = [NSString stringWithFormat:@"%li",(long)indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.row == 1) {
//        [self presentViewController:self.tableViewController animated:YES completion:nil];
//    }
}
@end
