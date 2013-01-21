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
    
    if (![modelDictionary isEqualToDictionary:testDictionary]) {
        STFail(@"Channel dictionary validation failed.");
        NSLog(@"A:\n%@", testDictionary);
        NSLog(@"B:\n%@", modelDictionary);
        return NO;
    }
    
    return YES;
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
