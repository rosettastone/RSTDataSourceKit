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

#import "RSTTableViewArrayDataSource.h"

@interface RSTTableViewArrayDataSource ()

@property (nonatomic, copy, readonly) RSTTableViewCellConfigurationBlock cellConfigurationBlock;

@end


@implementation RSTTableViewArrayDataSource

#pragma mark - Init

- (instancetype)initWithItems:(NSArray *)items
                  cellFactory:(id<RSTTableViewCellDequeuing>)cellFactory
       cellConfigurationBlock:(RSTTableViewCellConfigurationBlock)cellConfigurationBlock
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id item = self.items[indexPath.row];

    UITableViewCell *cell = [self.cellFactory tableViewCellInTableView:tableView forItem:item atIndexPath:indexPath];

    self.cellConfigurationBlock(tableView, cell, item, indexPath);

    return cell;
}

@end
