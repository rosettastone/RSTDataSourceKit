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

#import "ViewModel.h"

@implementation ViewModel

- (instancetype)initWithTitle:(NSString *)title subtitle:(NSString *)subtitle
{
    self = [super init];
    if (self) {
        _title = [title copy];
        _subtitle = [subtitle copy];
    }
    return self;
}

- (instancetype)init
{
    return [self initWithTitle:@"The Title" subtitle:@"Some subtitle"];
}

@end
