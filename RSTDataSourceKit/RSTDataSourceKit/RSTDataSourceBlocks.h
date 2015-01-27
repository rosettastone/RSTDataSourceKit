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

#pragma mark - Cell dequeuing

typedef UICollectionViewCell *(^RSTCollectionViewCellDequeuingBlock)(UICollectionView *collectionView,
                                                                     id item,
                                                                     NSIndexPath *indexPath);

typedef UITableViewCell *(^RSTTableViewCellDequeuingBlock)(UITableView *tableView,
                                                           id item,
                                                           NSIndexPath *indexPath);

#pragma mark - Cell configuration

typedef void (^RSTCollectionViewCellConfigurationBlock)(UICollectionView *collectionView,
                                                        UICollectionViewCell *cell,
                                                        id item,
                                                        NSIndexPath *indexPath);

typedef void (^RSTTableViewCellConfigurationBlock)(UITableView *tableView,
                                                   UITableViewCell *cell,
                                                   id item,
                                                   NSIndexPath *indexPath);

typedef void (^RSTCollectionViewHeaderViewConfigurationBlock)(UICollectionView *collectionView,
                                                              UICollectionReusableView *reusableView,
                                                              NSString *kind,
                                                              NSIndexPath *indexPath);
