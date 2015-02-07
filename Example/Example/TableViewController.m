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

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSString *cellId = @"tableViewCell";

    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TableViewCell class]) bundle:nil] forCellReuseIdentifier:cellId];

    ViewModelFactory *factory = [ViewModelFactory new];
    NSArray *viewModels = [factory viewModels];
    
    RSTTableViewCellFactory *cellFactory = [[RSTTableViewCellFactory alloc] initWithCellDequeuingBlock:^UITableViewCell *(UITableView *tableView, id item, NSIndexPath *indexPath) {
        return [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
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
