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

#import "RSTCollectionViewArrayDataSource.h"
#import "RSTCollectionViewCellFactory.h"


@interface RSTCollectionViewCellFactoryTests : RSTDataSourceTestCase

@property (strong, nonatomic) id mockCollectionView;

@property (strong, nonatomic) UICollectionViewCell *fakeCell;

@property (strong, nonatomic) XCTestExpectation *expectation;

@end


@implementation RSTCollectionViewCellFactoryTests

- (void)setUp
{
    [super setUp];

    self.fakeCell = [[UICollectionViewCell alloc] init];

    self.mockCollectionView = [OCMockObject mockForClass:[UICollectionView class]];

    [[[self.mockCollectionView stub] andReturn:self.fakeCell] dequeueReusableCellWithReuseIdentifier:self.fakeReuseIdentifier
                                                                                        forIndexPath:self.fakeIndexPath];

    self.expectation = [self expectationWithDescription:@"CellFactoryDequeuingBlockExpection"];
}

- (void)testCollectionViewCellFactory
{
    // GIVEN: a cell factory
    RSTCollectionViewCellFactory *cellFactory = [[RSTCollectionViewCellFactory alloc] initWithCellDequeuingBlock:^UICollectionViewCell *(UICollectionView *collectionView, id item, NSIndexPath *indexPath) {
        XCTAssertEqualObjects(collectionView, self.mockCollectionView);
        XCTAssertEqualObjects(item, self.fakeItems.firstObject);
        XCTAssertEqualObjects(indexPath, self.fakeIndexPath);

        [self.expectation fulfill];

        return [collectionView dequeueReusableCellWithReuseIdentifier:self.fakeReuseIdentifier forIndexPath:indexPath];
    }];

    // GIVEN: a data source initialized with the factory
    RSTCollectionViewArrayDataSource *dataSource = [[RSTCollectionViewArrayDataSource alloc] initWithItems:self.fakeItems
                                                                                               cellFactory:cellFactory
                                                                                    cellConfigurationBlock:^(UICollectionView *collectionView, UICollectionViewCell *cell, id item, NSIndexPath *indexPath) {
                                                                                        XCTAssertEqualObjects(collectionView, self.mockCollectionView);
                                                                                        XCTAssertEqualObjects(cell, self.fakeCell);
                                                                                        XCTAssertEqualObjects(item, self.fakeItems.firstObject);
                                                                                        XCTAssertEqualObjects(indexPath, self.fakeIndexPath);

                                                                                        [self.configurationBlockExpectation fulfill];
                                                                                    }];

    // WHEN: we call the required collection view data source methods
    UICollectionViewCell *cell = [dataSource collectionView:self.mockCollectionView cellForItemAtIndexPath:self.fakeIndexPath];

    // THEN: we receive the expected return values
    XCTAssertEqualObjects(cell, self.fakeCell);

    // THEN: the expected methods are called with the expected data
    [self.mockCollectionView verify];

    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        XCTAssertNil(error, @"Expectation should not error");
    }];
}

@end
