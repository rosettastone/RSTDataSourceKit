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

@implementation RSTDataSourceTestCase

- (void)setUp
{
    [super setUp];

    self.fakeItems = @[ @"item1", @"item2", @"item3" ];

    self.fakeReuseIdentifier = [[NSProcessInfo processInfo] globallyUniqueString];

    self.fakeIndexPath = [NSIndexPath indexPathForItem:0 inSection:0];

    self.configurationBlockExpectation = [self expectationWithDescription:@"ConfigurationBlockExpectation"];
}

@end
