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


@interface RSTCollectionViewArrayDataSourceTests : RSTDataSourceTestCase

@property (strong, nonatomic) id mockCollectionView;

@property (strong, nonatomic) UICollectionViewCell *fakeCell;

@property (strong, nonatomic) UICollectionReusableView *fakeHeaderView;

@property (strong, nonatomic) NSString *fakeHeaderIdentifier;

@end


@implementation RSTCollectionViewArrayDataSourceTests

- (void)setUp
{
    [super setUp];

    self.fakeCell = [[UICollectionViewCell alloc] init];
    self.fakeHeaderView = [[UICollectionReusableView alloc] init];
    self.fakeHeaderIdentifier = [[NSProcessInfo processInfo] globallyUniqueString];

    self.mockCollectionView = [OCMockObject mockForClass:[UICollectionView class]];


    [[[self.mockCollectionView stub] andReturn:self.fakeCell] dequeueReusableCellWithReuseIdentifier:self.fakeReuseIdentifier
                                                                                        forIndexPath:self.fakeIndexPath];

    [[[self.mockCollectionView stub] andReturn:self.fakeHeaderView] dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                                       withReuseIdentifier:self.fakeHeaderIdentifier
                                                                                              forIndexPath:self.fakeIndexPath];
}

- (void)testCollectionViewArrayDataSource
{
    // GIVEN: a cell factory and data source object
    RSTCollectionViewCellFactory *cellFactory = [RSTCollectionViewCellFactory factoryWithCellReuseIdentifier:self.fakeReuseIdentifier];

    RSTCollectionViewArrayDataSource *dataSource = [[RSTCollectionViewArrayDataSource alloc] initWithItems:self.fakeItems
                                                                                               cellFactory:cellFactory
                                                                                    cellConfigurationBlock:^(UICollectionView *collectionView, UICollectionViewCell *cell, id item, NSIndexPath *indexPath) {

                                                                                        XCTAssertEqualObjects(collectionView, self.mockCollectionView);
                                                                                        XCTAssertEqualObjects(cell, self.fakeCell);
                                                                                        XCTAssertEqualObjects(item, self.fakeItems.firstObject);
                                                                                        XCTAssertEqualObjects(indexPath, self.fakeIndexPath);

                                                                                        [self.configurationBlockExpectation fulfill];
                                                                                    }];
    XCTAssertNotNil(dataSource);

    // WHEN: we call the required collection view data source methods
    NSInteger sections = [dataSource numberOfSectionsInCollectionView:self.mockCollectionView];
    NSInteger rows = [dataSource collectionView:self.mockCollectionView numberOfItemsInSection:0];
    UICollectionViewCell *cell = [dataSource collectionView:self.mockCollectionView cellForItemAtIndexPath:self.fakeIndexPath];

    // THEN: we receive the expected return values
    XCTAssertEqual(sections, 1);
    XCTAssertEqual(rows, self.fakeItems.count);
    XCTAssertEqualObjects(cell, self.fakeCell);

    // THEN: the expected methods are called with the expected data
    [self.mockCollectionView verify];

    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        XCTAssertNil(error, @"Expectation should not error");
    }];
}

- (void)testCollectionViewArrayDataSourceWithHeaderView
{
    // GIVEN: a cell factory and data source object with a header view
    RSTCollectionViewCellFactory *cellFactory = [RSTCollectionViewCellFactory factoryWithCellReuseIdentifier:self.fakeReuseIdentifier];

    RSTCollectionViewArrayDataSource *dataSource = [[RSTCollectionViewArrayDataSource alloc] initWithItems:self.fakeItems
                                                                                               cellFactory:cellFactory
                                                                                    cellConfigurationBlock:^(UICollectionView *collectionView, UICollectionViewCell *cell, id item, NSIndexPath *indexPath) {
                                                                                        // do nothing, tested above
                                                                                    }];

    dataSource.headerViewReuseIdentifer = self.fakeHeaderIdentifier;
    dataSource.headerViewConfigurationBlock = ^(UICollectionView *collectionView, UICollectionReusableView *reusableView, NSString *kind, NSIndexPath *indexPath) {
        XCTAssertEqualObjects(collectionView, self.mockCollectionView);
        XCTAssertEqualObjects(reusableView, self.fakeHeaderView);
        XCTAssertEqualObjects(kind, UICollectionElementKindSectionHeader);
        XCTAssertEqualObjects(indexPath, self.fakeIndexPath);

        [self.configurationBlockExpectation fulfill];
    };

    // WHEN: we call the collection view data source method for a header
    UICollectionReusableView *header = [dataSource collectionView:self.mockCollectionView
                                viewForSupplementaryElementOfKind:UICollectionElementKindSectionHeader
                                                      atIndexPath:self.fakeIndexPath];

    // THEN: we receive the expected return values
    XCTAssertEqualObjects(header, self.fakeHeaderView);

    // THEN: the expected methods are called with the expected data
    [self.mockCollectionView verify];
    
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        XCTAssertNil(error, @"Expectation should not error");
    }];
}

@end
