//
//  SenTestCase+ADNModelTests.h
//  AppDotNet
//
//  Created by Thomas Westfeld on 16.03.13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

// helper methods to test models of the AppDotNet framework

#import <SenTestingKit/SenTestingKit.h>

typedef enum {
    ADNComparisonIgnoreMissingKeysInFirst  = 1<<0,
    ADNComparisonIgnoreMissingKeysInSecond = 1<<1,
} ADNComparisonOptions;

@interface SenTestCase (ADNModelTests)

- (BOOL)roundTripEqualityTestforModelClass:(Class)modelClass withJSONNamed:(NSString *)filename;

- (BOOL)recursivelyCompareObject:(id)A toObject:(id)B withKeyPath:(NSString *)keyPath options:(ADNComparisonOptions)options;
- (BOOL)recursivelyCompareDictionary:(NSDictionary *)A toDictionary:(NSDictionary *)B withBaseKeyPath:(NSString *)baseKeyPath options:(ADNComparisonOptions)options;
- (BOOL)recursivelyCompareArray:(NSArray *)A toArray:(NSArray *)B withBaseKeyPath:(NSString *)baseKeyPath options:(ADNComparisonOptions)options;
@end
