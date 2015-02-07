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

#import "CollectionViewController.h"

@implementation CollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSString *cellId = @"collectionViewCell";

    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([CollectionViewCell class]) bundle:nil]
          forCellWithReuseIdentifier:cellId];

    ViewModelFactory *factory = [ViewModelFactory new];
    NSArray *viewModels = [factory viewModels];

    RSTCollectionViewCellFactory *cellFactory = [[RSTCollectionViewCellFactory alloc] initWithCellDequeuingBlock:^UICollectionViewCell *(UICollectionView *collectionView, id item, NSIndexPath *indexPath) {
        return [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    }];

    self.dataSource = [[RSTCollectionViewArrayDataSource alloc] initWithItems:viewModels
                                                                  cellFactory:cellFactory
                                                       cellConfigurationBlock:^(UICollectionView *collectionView, UICollectionViewCell *cell, id item, NSIndexPath *indexPath) {

                                                           ViewModel *viewModel = (ViewModel *)item;
                                                           CollectionViewCell *customCell = (CollectionViewCell *)cell;

                                                           customCell.textLabel.text = viewModel.title;
                                                           customCell.detailTextLabel.text = viewModel.subtitle;

                                                       }];

    self.collectionView.dataSource = self.dataSource;
}

@end
