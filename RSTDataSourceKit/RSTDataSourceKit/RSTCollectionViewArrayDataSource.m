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

#import "RSTCollectionViewArrayDataSource.h"


@interface RSTCollectionViewArrayDataSource ()

@property (nonatomic, copy, readonly) RSTCollectionViewCellConfigurationBlock cellConfigurationBlock;

@end


@implementation RSTCollectionViewArrayDataSource

#pragma mark - Init

- (instancetype)initWithItems:(NSArray *)items
                  cellFactory:(id<RSTCollectionViewCellDequeuing>)cellFactory
       cellConfigurationBlock:(RSTCollectionViewCellConfigurationBlock)cellConfigurationBlock
{
    NSParameterAssert(items != nil);
    NSParameterAssert(cellFactory != nil);
    NSParameterAssert(cellConfigurationBlock != nil);

    self = [super init];
    if (self) {
        _items = [items mutableCopy];
        _cellFactory = cellFactory;
        _cellConfigurationBlock = [cellConfigurationBlock copy];
    }
    return self;
}

#pragma mark - NSObject

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: items=%@, cellFactory=%@>", [self class], self.items, self.cellFactory];
}

#pragma mark - Collection view data source

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    id item = self.items[indexPath.row];

    UICollectionViewCell *cell = [self.cellFactory collectionViewCellInCollectionView:collectionView forItem:item atIndexPath:indexPath];

    self.cellConfigurationBlock(collectionView, cell, item, indexPath);

    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader && self.headerViewReuseIdentifer != nil) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                                  withReuseIdentifier:self.headerViewReuseIdentifer
                                                                                         forIndexPath:indexPath];

        if (self.headerViewConfigurationBlock != nil) {
            self.headerViewConfigurationBlock(collectionView, headerView, kind, indexPath);
        }
        return headerView;
    }

    return nil;
}

@end
