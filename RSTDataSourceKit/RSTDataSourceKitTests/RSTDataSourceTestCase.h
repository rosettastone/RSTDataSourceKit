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

@import XCTest;
@import UIKit;

#import <OCMock/OCMock.h>


@interface RSTDataSourceTestCase : XCTestCase

@property (nonatomic, strong) NSArray *fakeItems;

@property (nonatomic, strong) NSString *fakeReuseIdentifier;

@property (strong, nonatomic) NSIndexPath *fakeIndexPath;

@property (nonatomic, strong) XCTestExpectation *configurationBlockExpectation;

@end
