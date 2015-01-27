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

#import "RSTCollectionViewCellFactory.h"


@interface RSTCollectionViewCellFactory ()

@property (nonatomic, copy, readonly) RSTCollectionViewCellDequeuingBlock cellDequeuingBlock;

@end


@implementation RSTCollectionViewCellFactory

#pragma mark - Init

- (instancetype)initWithCellDequeuingBlock:(RSTCollectionViewCellDequeuingBlock)cellDequeuingBlock
{
    NSParameterAssert(cellDequeuingBlock != nil);

    self = [super init];
    if (self) {
        _cellDequeuingBlock = [cellDequeuingBlock copy];
    }
    return self;
}

+ (instancetype)factoryWithCellReuseIdentifier:(NSString *)cellReuseIdentifier
{
    NSParameterAssert(cellReuseIdentifier != nil);

    return [[RSTCollectionViewCellFactory alloc] initWithCellDequeuingBlock:^UICollectionViewCell *(UICollectionView *collectionView, id item, NSIndexPath *indexPath) {
        return [collectionView dequeueReusableCellWithReuseIdentifier:[cellReuseIdentifier copy] forIndexPath:indexPath];
    }];
}

#pragma mark - RSTCollectionViewCellDequeuing

- (UICollectionViewCell *)collectionViewCellInCollectionView:(UICollectionView *)collectionView
                                                     forItem:(id)item
                                                 atIndexPath:(NSIndexPath *)indexPath
{
    return self.cellDequeuingBlock(collectionView, item, indexPath);
}

@end
