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

#import "ViewModelFactory.h"

#import "ViewModel.h"


@implementation ViewModelFactory

- (instancetype)initWithTotal:(NSUInteger)total
{
    self = [super init];
    if (self) {
        _total = total;
    }
    return self;
}

- (instancetype)init
{
    return [self initWithTotal:15];
}

- (NSArray *)viewModels
{
    NSMutableArray *models = [NSMutableArray new];

    for (int i = 0; i < 10; i++) {
        NSString *title = [NSString stringWithFormat:@"My Title %@", @(i)];
        NSString *subtitle = [NSString stringWithFormat:@"Some subtitle %@", @(i)];
        [models addObject:[[ViewModel alloc] initWithTitle:title subtitle:subtitle]];
    }

    return [models copy];
}

@end
