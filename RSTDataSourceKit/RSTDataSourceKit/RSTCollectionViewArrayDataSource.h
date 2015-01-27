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
#import "RSTCollectionViewCellDequeuing.h"


@interface RSTCollectionViewArrayDataSource : NSObject <UICollectionViewDataSource>

@property (nonatomic, copy, readonly) NSMutableArray *items;

@property (nonatomic, copy, readonly) id<RSTCollectionViewCellDequeuing> cellFactory;

@property (nonatomic, copy) NSString *headerViewReuseIdentifer;

@property (nonatomic, copy) RSTCollectionViewHeaderViewConfigurationBlock headerViewConfigurationBlock;

- (instancetype)initWithItems:(NSArray *)items
                  cellFactory:(id<RSTCollectionViewCellDequeuing>)cellFactory
       cellConfigurationBlock:(RSTCollectionViewCellConfigurationBlock)cellConfigurationBlock NS_DESIGNATED_INITIALIZER;

- (id)init NS_UNAVAILABLE;

@end
