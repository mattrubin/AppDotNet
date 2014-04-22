//
//  SenTestCase+ADNModelTests.m
//  AppDotNet
//
//  Created by Thomas Westfeld on 16.03.13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "SenTestCase+ADNModelTests.h"
#import <AppDotNet/AppDotNet.h>

@implementation SenTestCase (ADNModelTests)
- (BOOL)roundTripEqualityTestforModelClass:(Class)modelClass withJSONNamed:(NSString *)filename
{
    NSString *path = [[NSBundle bundleForClass:self.class] pathForResource:filename ofType:@"json"];
    NSData *testData = [NSData dataWithContentsOfFile:path];
    
    NSError *error = nil;
    NSDictionary *testDictionary = [NSJSONSerialization JSONObjectWithData:testData options:0 error:&error];
    
    ADNModel *model = [ADNJSONAdapter modelOfClass:modelClass fromJSONDictionary:testDictionary error:nil];
    NSDictionary *modelDictionary = [ADNJSONAdapter JSONDictionaryFromModel:model];
    
    if (![self recursivelyCompareObject:modelDictionary toObject:testDictionary withKeyPath:nil options:ADNComparisonIgnoreMissingKeysInSecond]) {
        //STFail(@"Model dictionary validation failed.");
        //NSLog(@"A:\n%@", testDictionary);
        //NSLog(@"B:\n%@", modelDictionary);
        return NO;
    }
    
    return YES;
}


#pragma mark - Recursive comparisons

- (BOOL)recursivelyCompareObject:(id)A toObject:(id)B withKeyPath:(NSString *)keyPath options:(ADNComparisonOptions)options
{
    // Don't fail if a missing key ends up as a null object
    if ((!A && [B isKindOfClass:[NSNull class]]) ||
        (!B && [A isKindOfClass:[NSNull class]])) {
        NSLog(@"WARNING: Missing object matched with null object for key path %@", keyPath);
        return YES;
    }
    
    if (!A && (options & ADNComparisonIgnoreMissingKeysInFirst)) {
        NSLog(@"WARNING: Ignoring nil object in A for key path %@", keyPath);
        return YES;
    }
    if (!B && (options & ADNComparisonIgnoreMissingKeysInSecond)) {
        NSLog(@"WARNING: Ignoring nil object in A for key path %@", keyPath);
        return YES;
    }
    
    if (!A) {
        STFail(@"A has no object for key path %@", keyPath);
        return NO;
    }
    
    if (!B) {
        STFail(@"B has no object for key path %@", keyPath);
        return NO;
    }
    
    if ([A isKindOfClass:[NSDictionary class]] && [B isKindOfClass:[NSDictionary class]]) {
        if (![self recursivelyCompareDictionary:A toDictionary:B withBaseKeyPath:keyPath options:options]) {
            //STFail(@"A and B have unequal dictionaries for key path %@", keyPath);
            return NO;
        }
    } else if ([A isKindOfClass:[NSArray class]] && [B isKindOfClass:[NSArray class]]) {
        if (![self recursivelyCompareArray:A toArray:B withBaseKeyPath:keyPath options:options]) {
            //STFail(@"A and B have unequal arrays for key path %@", keyPath);
            return NO;
        }
    } else {
        if (![A isEqual:B]) {
            STFail(@"A and B have unequal objects for key path %@", keyPath);
            return NO;
        }
    }
    
    return YES;
}

- (BOOL)recursivelyCompareDictionary:(NSDictionary *)A toDictionary:(NSDictionary *)B withBaseKeyPath:(NSString *)baseKeyPath options:(ADNComparisonOptions)options
{
    // Construct a set of all keys from both dictionaries
    NSMutableSet *keySet = [NSMutableSet setWithCapacity:A.count+B.count];
    [keySet addObjectsFromArray:A.allKeys];
    [keySet addObjectsFromArray:B.allKeys];
    
    BOOL equal = YES;
    
    for (id key in keySet) {
        NSString *keyPath = baseKeyPath?[baseKeyPath stringByAppendingFormat:@".%@", key]:key;
        
        id objA = [A objectForKey:key];
        id objB = [B objectForKey:key];
        
        if (![self recursivelyCompareObject:objA toObject:objB withKeyPath:keyPath options:options]) {
            equal = NO;
        }
    }
    
    return equal;
}

- (BOOL)recursivelyCompareArray:(NSArray *)A toArray:(NSArray *)B withBaseKeyPath:(NSString *)baseKeyPath options:(ADNComparisonOptions)options
{
    // Find a size large enough for both dictionaries
    NSUInteger count = MAX(A.count, B.count);
    
    BOOL equal = YES;
    
    for (NSUInteger i = 0; i < count; i++) {
        NSString *keyPath = baseKeyPath?[baseKeyPath stringByAppendingFormat:@"[%u]", i]:[NSString stringWithFormat:@"[%u]", i];
        
        id objA = A[i];
        id objB = B[i];
        
        if (![self recursivelyCompareObject:objA toObject:objB withKeyPath:keyPath options:options]) {
            equal = NO;
        }
    }
    
    return equal;
}
@end
