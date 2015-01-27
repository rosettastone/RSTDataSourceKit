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

#import "RSTDataSourceBlocks.h"
#import "RSTTableViewCellFactory.h"


@interface RSTTableViewArrayDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, copy, readonly) NSMutableArray *items;

@property (nonatomic, copy, readonly) id<RSTTableViewCellDequeuing> cellFactory;

- (instancetype)initWithItems:(NSArray *)items
                  cellFactory:(id<RSTTableViewCellDequeuing>)cellFactory
       cellConfigurationBlock:(RSTTableViewCellConfigurationBlock)cellConfigurationBlock NS_DESIGNATED_INITIALIZER;

- (id)init NS_UNAVAILABLE;

@end
