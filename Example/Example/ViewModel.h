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

#import <Foundation/Foundation.h>

@interface ViewModel : NSObject

@property (nonatomic, readonly) NSString *title;

@property (nonatomic, readonly) NSString *subtitle;

- (instancetype)initWithTitle:(NSString *)title subtitle:(NSString *)subtitle;

@end
