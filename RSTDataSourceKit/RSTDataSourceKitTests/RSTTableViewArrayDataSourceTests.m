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


@interface RSTTableViewArrayDataSourceTests : RSTDataSourceTestCase

@property (strong, nonatomic) id mockTableView;

@property (strong, nonatomic) UITableViewCell *fakeCell;

@end


@implementation RSTTableViewArrayDataSourceTests

- (void)setUp
{
    [super setUp];

    self.fakeCell = [[UITableViewCell alloc] init];

    self.mockTableView = [OCMockObject mockForClass:[UITableView class]];

    [[[self.mockTableView stub] andReturn:self.fakeCell] dequeueReusableCellWithIdentifier:self.fakeReuseIdentifier
                                                                              forIndexPath:self.fakeIndexPath];
}

- (void)testTableViewArrayDataSource
{
    // GIVEN: a cell factory and data source object
    RSTTableViewCellFactory *cellFactory = [RSTTableViewCellFactory factoryWithCellReuseIdentifier:self.fakeReuseIdentifier];

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
    NSInteger sections = [dataSource numberOfSectionsInTableView:self.mockTableView];
    NSInteger rows = [dataSource tableView:self.mockTableView numberOfRowsInSection:0];
    UITableViewCell *cell = [dataSource tableView:self.mockTableView cellForRowAtIndexPath:self.fakeIndexPath];

    // THEN: we receive the expected return values
    XCTAssertEqual(sections, 1);
    XCTAssertEqual(rows, self.fakeItems.count);
    XCTAssertEqualObjects(cell, self.fakeCell);

    // THEN: the expected methods are called with the expected data
    [self.mockTableView verify];
    
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        XCTAssertNil(error, @"Expectation should not error");
    }];
}

@end
