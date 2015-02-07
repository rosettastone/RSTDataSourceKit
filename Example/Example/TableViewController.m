//
//  Rosetta Stone
//  http://product.rosettastone.com/news/
//
//
//  Documentation
//  http://cocoadocs.org/docsets/RSTDataSourceKit
//
//
//  GitHub
//  https://github.com/rosettastone/RSTDataSourceKit
//
//
//  License
//  Copyright (c) 2014 Rosetta Stone
//  Released under a BSD license: http://opensource.org/licenses/BSD-3-Clause
//

#import "TableViewController.h"

#import "TableViewCell.h"


@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TableViewCell class]) bundle:nil] forCellReuseIdentifier:@"tableViewCell"];

    self.factory = [ViewModelFactory new];
    NSArray *viewModels = [self.factory viewModels];
    
    RSTTableViewCellFactory *cellFactory = [[RSTTableViewCellFactory alloc] initWithCellDequeuingBlock:^UITableViewCell *(UITableView *tableView, id item, NSIndexPath *indexPath) {
        return [tableView dequeueReusableCellWithIdentifier:@"tableViewCell" forIndexPath:indexPath];
    }];

    self.dataSource = [[RSTTableViewArrayDataSource alloc] initWithItems:viewModels
                                                             cellFactory:cellFactory
                                                  cellConfigurationBlock:^(UITableView *tableView, UITableViewCell *cell, id item, NSIndexPath *indexPath) {

                                                      ViewModel *viewModel = (ViewModel *)item;
                                                      cell.textLabel.text = viewModel.title;
                                                      cell.detailTextLabel.text = viewModel.subtitle;
                                                  }];

    self.tableView.dataSource = self.dataSource;
}

@end
