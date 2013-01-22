//
//  ADNModelTests.m
//  AppDotNet
//
//  Created by Me on 1/21/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNModelTests.h"
#import <AppDotNet/AppDotNet.h>


#define CHANNEL_TEST_FILE @"Channel"
#define MESSAGE_TEST_FILE @"Message"
#define USER_TEST_FILE @"User"


@implementation ADNModelTests

- (BOOL)roundTripEqualityTestforModelClass:(Class)modelClass withJSONNamed:(NSString *)filename
{
    NSString *path = [[NSBundle bundleForClass:self.class] pathForResource:filename ofType:@"json"];
    NSData *testData = [NSData dataWithContentsOfFile:path];
    
    NSError *error = nil;
    NSDictionary *testDictionary = [NSJSONSerialization JSONObjectWithData:testData options:0 error:&error];
    
    ADNModel *model = [modelClass modelWithExternalRepresentation:testDictionary];
    NSDictionary *modelDictionary = model.externalRepresentation;
    
    if (![self recursivelyCompareDictionary:modelDictionary toDictionary:testDictionary withBaseKeyPath:nil]) {
        STFail(@"Model dictionary validation failed.");
        //NSLog(@"A:\n%@", testDictionary);
        //NSLog(@"B:\n%@", modelDictionary);
        return NO;
    }
    
    return YES;
}

- (BOOL)recursivelyCompareDictionary:(NSDictionary *)A toDictionary:(NSDictionary *)B withBaseKeyPath:(NSString *)baseKeyPath
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
        
        // Don't fail if a missing key ends up as a null object
        if ((!objA && [objB isKindOfClass:[NSNull class]]) ||
            (!objB && [objA isKindOfClass:[NSNull class]])) {
            NSLog(@"WARNING: Missing key mathced with null object for key path %@", keyPath);
            continue;
        }
        
        if (!objA) {
            STFail(@"A has no object for key path %@", keyPath);
            equal = NO;
            continue;
        }
        
        if (!objB) {
            STFail(@"B has no object for key path %@", keyPath);
            equal = NO;
            continue;
        }
        
        if ([objA isKindOfClass:[NSDictionary class]] && [objB isKindOfClass:[NSDictionary class]]) {
            if (![self recursivelyCompareDictionary:objA toDictionary:objB withBaseKeyPath:keyPath]) {
                STFail(@"A and B have unequal dictionaries for key path %@", keyPath);
                equal = NO;
                continue;
            }
        } else {
            if (![objA isEqual:objB]) {
                STFail(@"A and B have unequal objects for key path %@", keyPath);
                equal = NO;
                continue;
            }
        }
    }
    return equal;
}

- (void)testChannel
{
    [self roundTripEqualityTestforModelClass:[ADNChannel class] withJSONNamed:CHANNEL_TEST_FILE];
}

- (void)testMessage
{
    [self roundTripEqualityTestforModelClass:[ADNMessage class] withJSONNamed:MESSAGE_TEST_FILE];
}

- (void)testUser
{
    [self roundTripEqualityTestforModelClass:[ADNUser class] withJSONNamed:USER_TEST_FILE];
}


@end
