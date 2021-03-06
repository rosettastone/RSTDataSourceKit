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

#import <UIKit/UIKit.h>

#import <RSTDataSourceKit/RSTDataSourceKit.h>

#import "ViewModelFactory.h"

#import "ViewModel.h"

#import "TableViewCell.h"

@interface TableViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) RSTTableViewArrayDataSource *dataSource;

@end
