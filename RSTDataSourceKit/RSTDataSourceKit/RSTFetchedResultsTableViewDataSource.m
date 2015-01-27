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

#import "RSTFetchedResultsTableViewDataSource.h"

#import "RSTFetchedResultsControllerDelegate.h"


@interface RSTFetchedResultsTableViewDataSource ()

@property (nonatomic, copy) RSTTableViewCellConfigurationBlock cellConfigurationBlock;

@end


@implementation RSTFetchedResultsTableViewDataSource

#pragma mark - Init

- (instancetype)initWithFetchRequest:(NSFetchRequest *)fetchRequest
                managedObjectContext:(NSManagedObjectContext *)managedObjectContext
                  sectionNameKeyPath:(NSString *)sectionNameKeyPath
                           cacheName:(NSString *)cacheName
                 cellReuseIdentifier:(NSString *)cellReuseIdentifier
              cellConfigurationBlock:(RSTTableViewCellConfigurationBlock)cellConfigurationBlock
                            delegate:(RSTFetchedResultsControllerDelegate *)delegate
{
    NSParameterAssert(fetchRequest != nil);
    NSParameterAssert(managedObjectContext != nil);
    NSParameterAssert(cellReuseIdentifier != nil);
    NSParameterAssert(cellConfigurationBlock != nil);
    
    self = [super init];
    if (self) {
        _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                        managedObjectContext:managedObjectContext
                                                                          sectionNameKeyPath:sectionNameKeyPath
                                                                                   cacheName:cacheName];
        _fetchedResultsController.delegate = delegate;
        _cellReuseIdentifier = [cellReuseIdentifier copy];
        _cellConfigurationBlock = [cellConfigurationBlock copy];
    }
    return self;
}

#pragma mark - NSObject

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: cellReuseIdentifier=%@, fetchedResultsController=%@>", [self class], self.cellReuseIdentifier, self.fetchedResultsController];
}

#pragma mark - Fetching

- (BOOL)performFetch
{
    NSError *error = nil;
    [self.fetchedResultsController performFetch:&error];

    if (error) {
        NSLog(@"*** %s fetch error: %@", __PRETTY_FUNCTION__, error);
        return NO;
    }

    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.fetchedResultsController.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id<NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController.sections objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (self.fetchedResultsController.fetchedObjects.count == 0) {
        return nil;
    }

    id<NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController.sections objectAtIndex:section];
    return [sectionInfo name];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellReuseIdentifier forIndexPath:indexPath];
    self.cellConfigurationBlock(tableView, cell, [self.fetchedResultsController objectAtIndexPath:indexPath], indexPath);
    return cell;
}

@end
