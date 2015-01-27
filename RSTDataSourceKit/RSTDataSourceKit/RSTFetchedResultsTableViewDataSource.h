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
@import CoreData;

@class RSTFetchedResultsControllerDelegate;

#import "RSTDataSourceBlocks.h"


@interface RSTFetchedResultsTableViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong, readonly) NSFetchedResultsController *fetchedResultsController;

@property (nonatomic, copy, readonly) NSString *cellReuseIdentifier;

- (instancetype)initWithFetchRequest:(NSFetchRequest *)fetchRequest
                managedObjectContext:(NSManagedObjectContext *)managedObjectContext
                  sectionNameKeyPath:(NSString *)sectionNameKeyPath
                           cacheName:(NSString *)cacheName
                 cellReuseIdentifier:(NSString *)cellReuseIdentifier
              cellConfigurationBlock:(RSTTableViewCellConfigurationBlock)cellConfigurationBlock
                            delegate:(RSTFetchedResultsControllerDelegate *)delegate NS_DESIGNATED_INITIALIZER;

- (id)init NS_UNAVAILABLE;

- (BOOL)performFetch;

@end
