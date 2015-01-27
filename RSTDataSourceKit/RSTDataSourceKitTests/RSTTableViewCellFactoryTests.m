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

#import "RSTDataSourceTestCase.h"

#import "RSTTableViewArrayDataSource.h"
#import "RSTTableViewCellFactory.h"


@interface RSTTableViewCellFactoryTests : RSTDataSourceTestCase

@property (strong, nonatomic) id mockTableView;

@property (strong, nonatomic) UITableViewCell *fakeCell;

@property (strong, nonatomic) XCTestExpectation *expectation;

@end


@implementation RSTTableViewCellFactoryTests

- (void)setUp
{
    [super setUp];

    self.fakeCell = [[UITableViewCell alloc] init];

    self.mockTableView = [OCMockObject mockForClass:[UITableView class]];

    [[[self.mockTableView stub] andReturn:self.fakeCell] dequeueReusableCellWithIdentifier:self.fakeReuseIdentifier
                                                                              forIndexPath:self.fakeIndexPath];

    self.expectation = [self expectationWithDescription:@"CellFactoryDequeuingBlockExpectation"];
}

- (void)testTableViewCellFactory
{
    // GIVEN: a cell factory
    RSTTableViewCellFactory *cellFactory = [[RSTTableViewCellFactory alloc] initWithCellDequeuingBlock:^UITableViewCell *(UITableView *tableView, id item, NSIndexPath *indexPath) {
        XCTAssertEqualObjects(tableView, self.mockTableView);
        XCTAssertEqualObjects(item, self.fakeItems.firstObject);
        XCTAssertEqualObjects(indexPath, self.fakeIndexPath);

        [self.expectation fulfill];

        return [tableView dequeueReusableCellWithIdentifier:self.fakeReuseIdentifier forIndexPath:indexPath];
    }];

    // GIVEN: a data source initialized with the factory
    RSTTableViewArrayDataSource *dataSource = [[RSTTableViewArrayDataSource alloc] initWithItems:self.fakeItems
                                                                                     cellFactory:cellFactory
                                                                          cellConfigurationBlock:^(UITableView *tableView, UITableViewCell *cell, id item, NSIndexPath *indexPath) {
                                                                              XCTAssertEqualObjects(tableView, self.mockTableView);
                                                                              XCTAssertEqualObjects(cell, self.fakeCell);
                                                                              XCTAssertEqualObjects(item, self.fakeItems.firstObject);
                                                                              XCTAssertEqualObjects(indexPath, self.fakeIndexPath);

                                                                              [self.configurationBlockExpectation fulfill];
                                                                          }];
    XCTAssertNotNil(dataSource);

    // WHEN: we call the required table view data source methods
    UITableViewCell *cell = [dataSource tableView:self.mockTableView cellForRowAtIndexPath:self.fakeIndexPath];

    // THEN: we receive the expected return values
    XCTAssertEqualObjects(cell, self.fakeCell);

    // THEN: the expected methods are called with the expected data
    [self.mockTableView verify];
    
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        XCTAssertNil(error, @"Expectation should not error");
    }];
}

@end
