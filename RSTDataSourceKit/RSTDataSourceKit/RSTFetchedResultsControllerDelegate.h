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

@import Foundation;
@import CoreData;
@import UIKit;

#import "RSTDataSourceBlocks.h"


@interface RSTFetchedResultsControllerDelegate : NSObject <NSFetchedResultsControllerDelegate>

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, copy) RSTTableViewCellConfigurationBlock cellConfigurationBlock;

- (instancetype)initWithTableView:(UITableView *)tableView
           cellConfigurationBlock:(RSTTableViewCellConfigurationBlock)cellConfigurationBlock NS_DESIGNATED_INITIALIZER;

- (id)init NS_UNAVAILABLE;

@end
