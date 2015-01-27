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

#import "RSTTableViewCellFactory.h"


@interface RSTTableViewCellFactory ()

@property (nonatomic, copy, readonly) RSTTableViewCellDequeuingBlock cellDequeuingBlock;

@end


@implementation RSTTableViewCellFactory

#pragma mark - Init

- (instancetype)initWithCellDequeuingBlock:(RSTTableViewCellDequeuingBlock)cellDequeuingBlock
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

    return [[RSTTableViewCellFactory alloc] initWithCellDequeuingBlock:^UITableViewCell *(UITableView *tableView, id item, NSIndexPath *indexPath) {
        return [tableView dequeueReusableCellWithIdentifier:[cellReuseIdentifier copy] forIndexPath:indexPath];
    }];
}

#pragma mark - RSTTableViewCellDequeuing

- (UITableViewCell *)tableViewCellInTableView:(UITableView *)tableView forItem:(id)item atIndexPath:(NSIndexPath *)indexPath
{
    return self.cellDequeuingBlock(tableView, item, indexPath);
}

@end
