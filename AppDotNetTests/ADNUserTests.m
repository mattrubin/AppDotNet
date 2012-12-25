//
//  ADNUserTests.m
//  AppDotNet
//
//  Created by Me on 12/24/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNUserTests.h"
#import "ADNHelper.h"
#import "ADNUser.h"

#define TEST_FILE @"User"

@implementation ADNUserTests

- (void)setUp
{
    [super setUp];
    
    NSString *path = [[NSBundle bundleForClass:self.class] pathForResource:TEST_FILE ofType:@"json"];
    NSData *userData = [NSData dataWithContentsOfFile:path];
    
    NSDictionary *responseEnvelope;
    NSError *error;
    if ((responseEnvelope = [ADNHelper dictionaryFromJSONData:userData error:&error])) {
        self.dataDictionary = [ADNHelper responseContentFromEnvelope:responseEnvelope error:&error];
    }
    if (error) {
        STFail(@"Cannot create data dictionary: %@", error);
    }
}

- (void)tearDown
{
    self.dataDictionary = nil;
    
    [super tearDown];
}

- (void)testMessage
{
    ADNUser *user = [ADNUser instanceFromDictionary:self.dataDictionary];
    
    NSMutableDictionary *testDictionary    = [self.dataDictionary mutableCopy];
    NSMutableDictionary *userDictionary = [user.toDictionary mutableCopy];
    
    if (![userDictionary isEqual:testDictionary]) {
        STFail(@"Message dictionary validation failed.");
        NSLog(@"A:\n%@", testDictionary);
        NSLog(@"B:\n%@", userDictionary);
    }
}

@end
