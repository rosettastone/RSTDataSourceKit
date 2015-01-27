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


@interface RSTCollectionViewCellFactory : NSObject <RSTCollectionViewCellDequeuing>

- (instancetype)initWithCellDequeuingBlock:(RSTCollectionViewCellDequeuingBlock)cellDequeuingBlock NS_DESIGNATED_INITIALIZER;

+ (instancetype)factoryWithCellReuseIdentifier:(NSString *)cellReuseIdentifier;

- (id)init NS_UNAVAILABLE;

@end
