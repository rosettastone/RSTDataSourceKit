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
@import UIKit;

@protocol RSTTableViewCellDequeuing <NSObject>

- (UITableViewCell *)tableViewCellInTableView:(UITableView *)tableView
                                      forItem:(id)item
                                  atIndexPath:(NSIndexPath *)indexPath;

@end
